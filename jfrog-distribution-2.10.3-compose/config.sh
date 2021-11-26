#!/bin/bash

#Fail immediately on any error
#set -e

# This file is for preparing all the needed files and directories on the host.
# These directories are mounted into the docker containers.

SCRIPT_DIR=$(dirname $0)
SCRIPT_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_HOME="$(cd ${SCRIPT_HOME} && pwd)"
ENV="${COMPOSE_HOME}/.env"

source "${ENV}"

. ${SCRIPT_HOME}/bin/systemYamlHelper.sh
. ${SCRIPT_HOME}/bin/dockerComposeHelper.sh

RPM_DEB_RECOMMENDED_MIN_RAM=2621440           # 2.5G Total RAM => 2.5*1024*1024k=2621440
RPM_DEB_RECOMMENDED_MAX_USED_STORAGE=90       # needs more than 10% available storage
RPM_DEB_RECOMMENDED_MIN_CPU=3                 # needs more than 3 CPU Cores

JF_PROJECT_NAME=distribution
PRODUCT_NAME="$DISTRIBUTION_LABEL"
IS_POSTGRES_REQUIRED="$FLAG_Y"

docker_hook_setDirInfo(){
    logDebug "Method docker_hook_setDirInfo"
    REDIS_DATA_ROOT="${JF_ROOT_DATA_DIR}${THIRDPARTY_DATA_ROOT}/redis"
    POSTGRESQL_DATA_ROOT="${JF_ROOT_DATA_DIR}${THIRDPARTY_DATA_ROOT}/postgres"
}

docker_hook_postSystemYamlCreation () {
    logDebug "Method docker_hook_postSystemYamlCreation"
    docker_setSystemValue "shared.node.contextUrl" "http://$(wrapper_getHostIP):8080" "${SYSTEM_YAML_FILE}"
    docker_setSystemValue "shared.redis.connectionString" "redis://$(wrapper_getHostIP):6379" "${SYSTEM_YAML_FILE}"
    if [ "$IS_POSTGRES_REQUIRED" == "$FLAG_Y" ]; then
      docker_setSystemValue "$SYS_KEY_SHARED_DATABASE_URL" "jdbc:postgresql://$(wrapper_getHostIP):5432/distribution?sslmode=disable"
    fi
}

copyRedisConfigurationFile() {
  logDebug "Method ${FUNCNAME[0]}"
  # Copy the redis config file to the app folder
  local redisFolder="${JF_ROOT_DATA_DIR}/app/third-party/redis"
  mkdir -p $redisFolder || errorExit "Setting ownership of [${redisFolder}] to [${REDIS_USER}:${REDIS_USER}] failed"
  local confFile="${COMPOSE_HOME}/third-party/redis/redis.conf"
  [ -f "$confFile" ] || { warn "Could not find the file: [${confFile}]" && return; }
  if [ ! -f "$redisFolder/redis.conf" ]; then
    cp "$confFile" "$redisFolder" || errorExit "Could not copy redis.conf to the destination folder"
  fi
}

wrapper_hook_setRedisPassword () {
  local redisFile="${JF_ROOT_DATA_DIR}/app/third-party/redis/redis.conf"
  if [ ! -f "${redisFile}" ]; then
      copyRedisConfigurationFile
  fi
  grep "^requirepass password" ${redisFile} > /dev/null 2>&1
  [ $? -ne 0 ] && SET_REDIS_PASS=${FLAG_N} || SET_REDIS_PASS=${FLAG_Y}
  if [[ "${SET_REDIS_PASS}" == "${FLAG_Y}" ]]; then
    local systemYamlFile="${JF_ROOT_DATA_DIR}/var/etc/system.yaml"
    getSystemValue "shared.redis.connectionString" "NOT_SET" "false" "${systemYamlFile}"
    REDIS_CONNECTION_URL="${YAML_VALUE}"
    getSystemValue "${SYS_KEY_SHARED_REDIS_PASSWORD}" "NOT_SET" "false" "${systemYamlFile}"
    REDIS_PASSWORD_YAML_VALUE="${YAML_VALUE}"
    if [[ "${REDIS_CONNECTION_URL}" == "NOT_SET" && "${REDIS_PASSWORD_YAML_VALUE}" == "NOT_SET" ]]; then
        _setRedisPassword
        transformRedisPasswordToConfFile
    fi
  fi
}

transformRedisPasswordToConfFile () {
  getSystemValue "${SYS_KEY_SHARED_REDIS_PASSWORD}" "NOT_SET" "false" "${INSTALLER_YAML}"
  local redisPassword="${YAML_VALUE}"
  if [ "${redisPassword}" == "NOT_SET" ]; then
      return
  fi
  local redisFile="${JF_ROOT_DATA_DIR}/app/third-party/redis/redis.conf"
  replaceText "requirepass.*" "requirepass ${redisPassword}" "${redisFile}"
}


docker_hook_copyComposeFile() {
  logDebug "Method ${FUNCNAME[0]}"
  docker_setUpPostgresCompose

  local sourceFile="$COMPOSE_TEMPLATES/docker-compose.yaml"
  local targetFile="$COMPOSE_HOME/docker-compose.yaml"
  logDebug "Copying [$sourceFile] as [$targetFile]"
  cp "$sourceFile" "$targetFile"

  logDebug "Copying [$COMPOSE_TEMPLATES/$JFROG_REDIS_COMPOSE_FILE] as [$COMPOSE_HOME/$JFROG_REDIS_COMPOSE_FILE]"
  cp -f "${COMPOSE_TEMPLATES}/${JFROG_REDIS_COMPOSE_FILE}" "${COMPOSE_HOME}/${JFROG_REDIS_COMPOSE_FILE}"
}

docker_hook_productSpecificComposeHelp(){
    case "${PRODUCT_NAME}" in
        $DISTRIBUTION_LABEL)
        if [[ ! -z ${JFROG_REDIS_COMPOSE_FILE} ]]; then
cat << END_USAGE
start redis:         docker-compose -p ${JF_PROJECT_NAME}-redis -f ${JFROG_REDIS_COMPOSE_FILE} up -d
END_USAGE
        fi
        ;;
    esac
}

FEATURE_FLAG_USE_WRAPPER="$FLAG_Y"
MANDATORY_FIELDS="JF_SHARED_JFROGURL JF_SHARED_SECURITY_JOINKEY"
EXTERNAL_DATABASES="$DATABASE_POSTGRES"
DOCKER_USER=${DISTRIBUTION_USER}
MIGRATION_SUPPORTED="$FLAG_Y"
JFROG_REDIS_COMPOSE_FILE="docker-compose-redis.yaml"

docker_main $*