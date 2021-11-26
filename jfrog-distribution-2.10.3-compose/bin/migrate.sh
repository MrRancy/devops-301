#!/bin/bash

# Flags
FLAG_Y="y"
FLAG_N="n"
FLAGS_Y_N="$FLAG_Y $FLAG_N"
FLAG_NOT_APPLICABLE="_NA_"

WRAPPER_SCRIPT_TYPE_RPMDEB="RPMDEB"
WRAPPER_SCRIPT_TYPE_DOCKER_COMPOSE="DOCKERCOMPOSE"

SENSITIVE_KEY_VALUE="__sensitive_key_hidden___"

# Shared system keys
SYS_KEY_SHARED_JFROGURL="shared.jfrogUrl"
SYS_KEY_SHARED_JFROGURLTIMEOUT="shared.jfrogUrlTimeOut"
SYS_KEY_SHARED_SECURITY_JOINKEY="shared.security.joinKey"
SYS_KEY_SHARED_SECURITY_MASTERKEY="shared.security.masterKey"

SYS_KEY_SHARED_NODE_ID="shared.node.id"
SYS_KEY_SHARED_NODE_NAME="shared.node.name"
SYS_KEY_SHARED_JAVAHOME="shared.javaHome"

SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MYSQL="mysql"
SYS_KEY_SHARED_DATABASE_TYPE_VALUE_ORACLE="oracle"
SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MSSQL="mssql"
SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MARIADB="mariadb"
SYS_KEY_SHARED_DATABASE_TYPE_VALUE_POSTGRES="postgresql"
# If database type is selected as derby, assume its internal
SYS_KEY_SHARED_DATABASE_TYPE_VALUE_DERBY="derby"

SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_MYSQL="com.mysql.jdbc.Driver"
SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_ORACLE="oracle.jdbc.OracleDriver"
SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_MSSQL="com.microsoft.sqlserver.jdbc.SQLServerDriver"
SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_MARIADB="org.mariadb.jdbc.Driver"
SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_POSTGRES="org.postgresql.Driver"
SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_DERBY="org.apache.derby.jdbc.EmbeddedDriver"

SYS_KEY_SHARED_DATABASE_TYPE="shared.database.type"
SYS_KEY_SHARED_DATABASE_DRIVER="shared.database.driver"
SYS_KEY_SHARED_DATABASE_URL="shared.database.url"
SYS_KEY_SHARED_DATABASE_USERNAME="shared.database.username"
SYS_KEY_SHARED_DATABASE_PASSWORD="shared.database.password"

SYS_KEY_SHARED_REDIS_PASSWORD="shared.redis.password"
SYS_KEY_SHARED_RABBITMQ_URL="shared.rabbitMq.url"
SYS_KEY_SHARED_RABBITMQ_PASSWORD="shared.rabbitMq.password"

SYS_KEY_SHARED_ELASTICSEARCH_URL="shared.elasticsearch.url"
SYS_KEY_SHARED_ELASTICSEARCH_USERNAME="shared.elasticsearch.username"
SYS_KEY_SHARED_ELASTICSEARCH_PASSWORD="shared.elasticsearch.password"
SYS_KEY_SHARED_ELASTICSEARCH_CLUSTERSETUP="shared.elasticsearch.clusterSetup"
SYS_KEY_SHARED_ELASTICSEARCH_UNICASTFILE="shared.elasticsearch.unicastFile"
SYS_KEY_SHARED_ELASTICSEARCH_EXTRAJAVAOPTS="shared.elasticsearch.extraJavaOpts"
SYS_KEY_SHARED_ELASTICSEARCH_CLUSTERSETUP_VALUE="YES"
SYS_KEY_SHARED_ELASTICSEARCH_EXTERNALISE="shared.elasticsearch.external"
SYS_KEY_ELASTICSEARCH_APP_VERSION="elasticsearch.app.version"

getDatabaseDriver(){
    local databaseType="$1"
    case "$databaseType" in
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_POSTGRES)
            echo -n ${SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_POSTGRES}
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MYSQL)
            echo -n ${SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_MYSQL}
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MARIADB)
            echo -n ${SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_MARIADB}
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MSSQL)
            echo -n ${SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_MSSQL}
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_ORACLE)
            echo -n ${SYS_KEY_SHARED_DATABASE_DRIVER_VALUE_ORACLE}
        ;;
    esac
}

KEY_DATABASE_DRIVER=${SYS_KEY_SHARED_DATABASE_DRIVER}

WSS_SERVER_BASE_URL="http://localhost:8080"
SYS_KEY_SERVER_WSS_BASE_URL_KEY="server.externalScannerBaseUrl"
SYS_KEY_SERVER_INTEGRATION_ENABLE_KEY="server.isExtIntegrationEnable"

# Define this in product specific script. Should contain the path to unitcast file
# File used by insight server to write cluster active nodes info. This will be read by elasticsearch
#SYS_KEY_SHARED_ELASTICSEARCH_UNICASTFILE_VALUE=""

SYS_KEY_RABBITMQ_ACTIVE_NODE_NAME="shared.rabbitMq.active.node.name"
SYS_KEY_RABBITMQ_ACTIVE_NODE_IP="shared.rabbitMq.active.node.ip"

IGNORE_RABBITMQ_CONFIGS="cluster_formation.peer_discovery_backend cluster_formation.classic_config.nodes.1"
SYS_KEY_RABBITMQ_NODE_RABBITMQCONF="shared.rabbitMq.node.rabbitmqConf"

IGNORE_SYSTEM_YAML_VALIDATION="${FLAG_Y}"

# Filenames
FILE_NAME_SYSTEM_YAML="system.yaml"
FILE_NAME_SYSTEM_YAML_TEMPLATE="system.full-template.yaml"
FILE_NAME_INSTALLER_STATE_YAML="installerState.yaml"
FILE_NAME_JOIN_KEY="join.key"
FILE_NAME_MASTER_KEY="master.key"
FILE_NAME_INSTALLER_YAML="installer.yaml"

# Global constants used in business logic
NODE_TYPE_STANDALONE="standalone"
NODE_TYPE_CLUSTER_NODE="node"
NODE_TYPE_DATABASE="database"

# External(isable) databases 
DATABASE_POSTGRES="POSTGRES"
DATABASE_ELASTICSEARCH="ELASTICSEARCH"
DATABASE_RABBITMQ="RABBITMQ"

MYSQL_LABEL="MYSQL"
ORACLE_LABEL="ORACLE"
MSSQL_LABEL="MSSQL"
MARIADB_LABEL="MARIADB"
POSTGRES_LABEL="PostgreSQL"
ELASTICSEARCH_LABEL="Elasticsearch"
RABBITMQ_LABEL="Rabbitmq"
REDIS_LABEL="Redis"

ARTIFACTORY_LABEL="Artifactory"
JFMC_LABEL="Mission Control"
INSIGHT_LABEL="Insight"
DISTRIBUTION_LABEL="Distribution"
XRAY_LABEL="Xray"
RT_XRAY_TRIAL_LABEL="JFrog Platform Trial Pro X"

POSTGRES_CONTAINER="postgres"
ELASTICSEARCH_CONTAINER="elasticsearch"
RABBITMQ_CONTAINER="rabbitmq"
REDIS_CONTAINER="redis"

#Adding a small timeout before a read ensures it is positioned correctly in the screen
read_timeout=0.5

DEFAULT_CURL_TIMEOUT=10
# Options related to data directory location
PROMPT_DATA_DIR_LOCATION="Installation Directory"
KEY_DATA_DIR_LOCATION="installer.data_dir"

SYS_KEY_SHARED_NODE_HAENABLED="shared.node.haEnabled"
PROMPT_ADD_TO_CLUSTER="Are you adding an additional node to an existing product cluster?"
KEY_ADD_TO_CLUSTER="installer.ha"
VALID_VALUES_ADD_TO_CLUSTER="$FLAGS_Y_N"
SYS_KEY_ADD_TO_CLUSTER=${KEY_ADD_TO_CLUSTER}

SYS_KEY_SHARED_NODE_IP="shared.node.ip"
MESSAGE_HOST_IP="For IPv6 address, enclose value within square brackets as follows : [<ipv6_address>]"
PROMPT_HOST_IP="Please specify the IP address of this machine"
KEY_HOST_IP="installer.node.ip"

MESSAGE_POSTGRES_INSTALL="The installer can install a $POSTGRES_LABEL database, or you can connect to an existing compatible $POSTGRES_LABEL database\n(https://service.jfrog.org/installer/System+Requirements#SystemRequirements-RequirementsMatrix)\nIf you are upgrading from an existing installation, select N if you have externalized PostgreSQL, select Y if not."
PROMPT_POSTGRES_INSTALL="Do you want to install $POSTGRES_LABEL?"
KEY_POSTGRES_INSTALL="installer.install_postgresql"
KEY_POSTGRES_VERSION="installer.postgresql_version"
SYS_KEY_POSTGRES_VERSION=${KEY_POSTGRES_VERSION}
VALID_VALUES_POSTGRES_INSTALL="$FLAGS_Y_N"
SYS_KEY_POSTGRES_INSTALL=${KEY_POSTGRES_INSTALL}

# Postgres connection details
RPM_DEB_POSTGRES_HOME_DEFAULT="/var/opt/jfrog/postgres"
RPM_DEB_MESSAGE_STANDALONE_POSTGRES_DATA="$POSTGRES_LABEL home will have data and its configuration"
RPM_DEB_PROMPT_STANDALONE_POSTGRES_DATA="Type desired $POSTGRES_LABEL home location"
RPM_DEB_KEY_STANDALONE_POSTGRES_DATA="installer.postgresql.home"

MESSAGE_DATABASE_URL="Provide the database connection details"

GET_MULTI_SUPPORT_DATABASE_URL(){
    databaseURlExample=
    databaseLabel=
    getSystemValue "$SYS_KEY_SHARED_DATABASE_TYPE" "$SYS_KEY_SHARED_DATABASE_TYPE_VALUE_POSTGRES" "false" "$INSTALLER_YAML"
    case "$YAML_VALUE" in
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_POSTGRES)
            databaseURlExample="jdbc:postgresql://<IP_ADDRESS>:<PORT>/artifactory"
            databaseLabel="$POSTGRES_LABEL"
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MYSQL)
            databaseURlExample="jdbc:mysql://localhost:3306/artdb?characterEncoding=UTF-8&elideSetAutoCommits=true&useSSL=false"
            databaseLabel="$MYSQL_LABEL"
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MARIADB)
            databaseURlExample="jdbc:mariadb://localhost:3306/artdb?characterEncoding=UTF-8&elideSetAutoCommits=true&useSSL=false"
            databaseLabel="$MARIADB_LABEL"
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MSSQL)
            databaseURlExample="jdbc:sqlserver://localhost:1433;databaseName=artifactory;sendStringParametersAsUnicode=false;applicationName=Artifactory Binary Repository"
            databaseLabel="$MSSQL_LABEL"
        ;;
        $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_ORACLE)
            databaseURlExample="jdbc:oracle:thin:@localhost:1521:ORCL"
            databaseLabel="$ORACLE_LABEL"
        ;;
    esac
}

PROMPT_DATABASE_URL(){
    databaseURlExample=
    databaseLabel=
    case "$PRODUCT_NAME" in
            $ARTIFACTORY_LABEL)
                GET_MULTI_SUPPORT_DATABASE_URL
            ;;
            $JFMC_LABEL)
                databaseURlExample="jdbc:postgresql://<IP_ADDRESS>:<PORT>/mission_control?sslmode=disable"
                databaseLabel=$POSTGRES_LABEL
            ;;
            $INSIGHT_LABEL)
                databaseURlExample="jdbc:postgresql://<IP_ADDRESS>:<PORT>/insight?sslmode=disable"
                databaseLabel=$POSTGRES_LABEL
            ;;
            $DISTRIBUTION_LABEL)
                databaseURlExample="jdbc:postgresql://<IP_ADDRESS>:<PORT>/distribution?sslmode=disable"
                databaseLabel=$POSTGRES_LABEL
            ;;
            $XRAY_LABEL)
                databaseURlExample="postgres://<IP_ADDRESS>:<PORT>/xraydb?sslmode=disable"
                databaseLabel=$POSTGRES_LABEL
            ;;
        esac
    if [ -z "$databaseURlExample" ]; then
        echo -n "Database URL" # For consistency with username and password
        return
    fi
    echo -n "$databaseLabel url. Example: [$databaseURlExample]"
}

REGEX_MULTI_SUPPORT_DATABASE_URL(){
    databaseURlExample=
    getSystemValue "$SYS_KEY_SHARED_DATABASE_TYPE" "$SYS_KEY_SHARED_DATABASE_TYPE_VALUE_POSTGRES" "false" "$INSTALLER_YAML"
    case "$YAML_VALUE" in
            $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_POSTGRES)
                databaseURlExample=".*postgresql://.*/.*"
            ;;
            $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MYSQL)
                databaseURlExample=".*mysql://.*"
            ;;
            $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MARIADB)
                databaseURlExample=".*mariadb://.*"
            ;;
            $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_MSSQL)
                databaseURlExample=".*sqlserver://.*"
            ;;
            $SYS_KEY_SHARED_DATABASE_TYPE_VALUE_ORACLE)
                databaseURlExample=".*oracle:.*"
            ;;
        esac
}

REGEX_DATABASE_URL(){
    databaseURlExample=
    case "$PRODUCT_NAME" in
            $ARTIFACTORY_LABEL)
                REGEX_MULTI_SUPPORT_DATABASE_URL
            ;;
            $JFMC_LABEL)
                databaseURlExample="jdbc:postgresql://.*/.*"
            ;;
            $INSIGHT_LABEL)
                databaseURlExample="jdbc:postgresql://.*/.*"
            ;;
            $DISTRIBUTION_LABEL)
                databaseURlExample="jdbc:postgresql://.*/.*"
            ;;
            $XRAY_LABEL)
                databaseURlExample="postgres://.*/.*"
            ;;
        esac
    echo -n "^$databaseURlExample\$"
}

ERROR_MESSAGE_DATABASE_URL="Invalid database URL"
KEY_DATABASE_URL="$SYS_KEY_SHARED_DATABASE_URL"

MESSAGE_DB_PASSWORD="To setup $POSTGRES_LABEL, please enter a password"
PROMPT_DB_PASSWORD="database password"
IS_SENSITIVE_DB_PASSWORD="$FLAG_Y"
KEY_DB_PASSWORD="$SYS_KEY_SHARED_DATABASE_PASSWORD"
REGEX_DB_PASSWORD="^[a-zA-Z0-9]+$"
ERROR_MESSAGE_DB_PASSWORD="Please enter valid $POSTGRES_LABEL password"
REPLACE_POSTGRES_PASSWORD="__REPLACE_POSTGRES_PASSWORD__"

KEY_REDIS_PASSWORD="$SYS_KEY_SHARED_REDIS_PASSWORD"
DEFAULT_REDIS_PASSWORD="distri-redis"

KEY_RABBITMQ_PASSWORD="$SYS_KEY_SHARED_RABBITMQ_PASSWORD"
DEFAULT_RABBITMQ_PASSWORD="xray-rabbitmq"

MESSAGE_DATABASE_TYPE(){
    echo -n "Provide the type of your external database that you want to connect to."
    if [[ "${SUPPORTED_DATABASE_TYPES}" =~ .*${SYS_KEY_SHARED_DATABASE_TYPE_VALUE_DERBY}.* ]]; then 
        echo -en "\nNote : If you choose ${SYS_KEY_SHARED_DATABASE_TYPE_VALUE_DERBY}, it will be considered as an internal database and no further details will be asked"
    fi
}

KEY_DATABASE_TYPE="$SYS_KEY_SHARED_DATABASE_TYPE"

PROMPT_DATABASE_TYPE() {
    echo -n "Enter database type, supported values [ $SUPPORTED_DATABASE_TYPES ]"
}

REGEX_DATABASE_TYPE(){
    if [ -z "$SUPPORTED_DATABASE_TYPES" ]; then
        echo -n "$[a-z]*$"
    else
        local supportedDbList=""
        for dbtype in $SUPPORTED_DATABASE_TYPES; do
            [ -z "${supportedDbList}" ] && supportedDbList="${dbtype}" || supportedDbList="${supportedDbList}|${dbtype}"
        done
        echo -n "${supportedDbList}"
    fi
}

ERROR_MESSAGE_DATABASE_TYPE="Invalid database type"

 #NOTE: It is important to display the label. Since the message may be hidden if URL is known
PROMPT_DATABASE_USERNAME="Database username (If your existing connection URL already includes the username, leave this empty)"
KEY_DATABASE_USERNAME="$SYS_KEY_SHARED_DATABASE_USERNAME"
IS_OPTIONAL_DATABASE_USERNAME="$FLAG_Y"

 #NOTE: It is important to display the label. Since the message may be hidden if URL is known
PROMPT_DATABASE_PASSWORD="Database password (If your existing connection URL already includes the password, leave this empty)"
KEY_DATABASE_PASSWORD="$SYS_KEY_SHARED_DATABASE_PASSWORD"
IS_SENSITIVE_DATABASE_PASSWORD="$FLAG_Y"
IS_OPTIONAL_DATABASE_PASSWORD="$FLAG_Y"

MESSAGE_STANDALONE_ELASTICSEARCH_INSTALL="The installer can install a $ELASTICSEARCH_LABEL database or you can connect to an existing compatible $ELASTICSEARCH_LABEL database"
PROMPT_STANDALONE_ELASTICSEARCH_INSTALL="Do you want to install $ELASTICSEARCH_LABEL?"
KEY_STANDALONE_ELASTICSEARCH_INSTALL="installer.install_elasticsearch"
VALID_VALUES_STANDALONE_ELASTICSEARCH_INSTALL="$FLAGS_Y_N"
SYS_KEY_STANDALONE_ELASTICSEARCH_INSTALL=${KEY_STANDALONE_ELASTICSEARCH_INSTALL}

MESSAGE_XRAY_ARTIFACTORY_PAIRING="If you are not performing an upgrade, you can ignore the following question and press ${FLAG_Y}"
PROMPT_XRAY_ARTIFACTORY_PAIRING="Have you disconnected Artifactory Xray pairings, except one prior to performing this upgrade (Refer http://service.jfrog.org/wiki/Xray+and+Artifactory+One+to+One+Pairing for more details) ?"
KEY_XRAY_ARTIFACTORY_PAIRING="installer.is_xray_artifactory_pairing_disconnected"
VALID_VALUES_XRAY_ARTIFACTORY_PAIRING="$FLAGS_Y_N"

# Elasticsearch connection details
MESSAGE_ELASTICSEARCH_URL="Provide the $ELASTICSEARCH_LABEL connection details"
PROMPT_ELASTICSEARCH_URL="$ELASTICSEARCH_LABEL URL"
KEY_ELASTICSEARCH_URL="$SYS_KEY_SHARED_ELASTICSEARCH_URL"

MESSAGE_ELASTICSEARCH_USERNAME="To setup $ELASTICSEARCH_LABEL, please enter a username and password"
PROMPT_ELASTICSEARCH_USERNAME="elasticsearch username"
KEY_ELASTICSEARCH_USERNAME="$SYS_KEY_SHARED_ELASTICSEARCH_USERNAME"
REPLACE_ELASTICSEARCH_USERNAME="__REPLACE_ELASTICSEARCH_USERNAME__"

PROMPT_ELASTICSEARCH_PASSWORD="elasticsearch password"
KEY_ELASTICSEARCH_PASSWORD="$SYS_KEY_SHARED_ELASTICSEARCH_PASSWORD"
IS_SENSITIVE_ELASTICSEARCH_PASSWORD="$FLAG_Y"
REPLACE_ELASTICSEARCH_PASSWORD="__REPLACE_ELASTICSEARCH_PASSWORD__"

# Cluster related questions
MESSAGE_CLUSTER_MASTER_KEY="Provide the cluster's master key. It can be found in the data directory of the first node under /etc/security/master.key"
PROMPT_CLUSTER_MASTER_KEY="Master Key"
KEY_CLUSTER_MASTER_KEY="$SYS_KEY_SHARED_SECURITY_MASTERKEY"
IS_SENSITIVE_CLUSTER_MASTER_KEY="$FLAG_Y"

MESSAGE_JOIN_KEY="The Join key is the secret key used to establish trust between services in the JFrog Platform.\n(You can copy the Join Key from Admin > Security > Settings)"
PROMPT_JOIN_KEY="Join Key"
KEY_JOIN_KEY="$SYS_KEY_SHARED_SECURITY_JOINKEY"
IS_SENSITIVE_JOIN_KEY="$FLAG_Y"
REGEX_JOIN_KEY="^[a-zA-Z0-9]{16,}\$"
ERROR_MESSAGE_JOIN_KEY="Invalid Join Key"

# Rabbitmq related cluster information
MESSAGE_RABBITMQ_ACTIVE_NODE_NAME="Provide an active ${RABBITMQ_LABEL} node name. Run the command [ hostname -s ] on any of the existing nodes in the product cluster to get this"
PROMPT_RABBITMQ_ACTIVE_NODE_NAME="${RABBITMQ_LABEL} active node name"
KEY_RABBITMQ_ACTIVE_NODE_NAME="$SYS_KEY_RABBITMQ_ACTIVE_NODE_NAME"

# Rabbitmq related cluster information (necessary only for docker-compose)
PROMPT_RABBITMQ_ACTIVE_NODE_IP="${RABBITMQ_LABEL} active node ip"
KEY_RABBITMQ_ACTIVE_NODE_IP="$SYS_KEY_RABBITMQ_ACTIVE_NODE_IP"

MESSAGE_JFROGURL(){
    echo -e "The JFrog URL allows ${PRODUCT_NAME} to connect to a JFrog Platform Instance.\n(You can copy the JFrog URL from Admin > Security > Settings)"
}

PROMPT_JFROGURL="JFrog URL"
KEY_JFROGURL="$SYS_KEY_SHARED_JFROGURL"
REGEX_JFROGURL="^https?://.*:{0,}[0-9]{0,4}\$"
ERROR_MESSAGE_JFROGURL="Invalid JFrog URL"

# Set this to FLAG_Y on upgrade
IS_UPGRADE="${FLAG_N}"

# This belongs in JFMC but is the ONLY one that needs it so keeping it here for now. Can be made into a method and overridden if necessary
MESSAGE_MULTIPLE_PG_SCHEME="Please setup $POSTGRES_LABEL with schema as described in https://service.jfrog.org/installer/Installing+Mission+Control"

_getMethodOutputOrVariableValue() {
    unset EFFECTIVE_MESSAGE
    local keyToSearch=$1
    local effectiveMessage=
    local result="0"
    # logSilly "Searching for method: [$keyToSearch]"
    LC_ALL=C type "$keyToSearch" > /dev/null 2>&1 || result="$?"
    if [[ "$result" == "0" ]]; then
        # logSilly "Found method for [$keyToSearch]"
        EFFECTIVE_MESSAGE="$($keyToSearch)"
        return
    fi
    eval EFFECTIVE_MESSAGE=\${$keyToSearch}
    if [ ! -z "$EFFECTIVE_MESSAGE" ]; then
        return
    fi
    # logSilly "Didn't find method or variable for [$keyToSearch]"
}

# List of keys to be maintained in FILE_NAME_INSTALLER_STATE_YAML
setInstallerStateKeys() {
    local commonKeys="KEY_ADD_TO_CLUSTER KEY_POSTGRES_INSTALL KEY_POSTGRES_VERSION"
    case "$PRODUCT_NAME" in
        $ARTIFACTORY_LABEL)
            INSTALLER_STATE_KEYS="${commonKeys}"
        ;;
        $JFMC_LABEL)
            INSTALLER_STATE_KEYS="${commonKeys} KEY_STANDALONE_ELASTICSEARCH_INSTALL"
        ;;
        $INSIGHT_LABEL)
            INSTALLER_STATE_KEYS="${commonKeys} KEY_STANDALONE_ELASTICSEARCH_INSTALL"
        ;;
        $DISTRIBUTION_LABEL)
            INSTALLER_STATE_KEYS="${commonKeys}"
        ;;
        $XRAY_LABEL)
            INSTALLER_STATE_KEYS="${commonKeys}"
        ;;
        $RT_XRAY_TRIAL_LABEL)
            INSTALLER_STATE_KEYS="${commonKeys}"
        ;;
    esac

}

# To bump up Elasticsearch version in JFMC (native installers) change version
RPM_DEB_ES_VERSION="7.14.1"

# To bump up postgresql version in all products (native installer) change version 
POSTGRES_VERSION="13.2"
POSTGRES_MAJOR_VER="13"
POSTGRES_SLES_MAJOR_VER="12"
POSTGRES_SLES_VER="12.5-1"
POSTGRES_RPM_VER="13.2-1"
POSTGRES_DEB_VER="13_13.2-1"

# To bump up postgresql version in all products (compose installers) change version 
setPostgresVersion() {
    # To bump up postgresql in product add new version as new a variable for example JFROG_POSTGRES_12X_VERSION="13-5v"
    JFROG_POSTGRES_10X_VERSION="10-13v"
    JFROG_POSTGRES_12_3X_VERSION="12-3v"
    JFROG_POSTGRES_12_5X_VERSION="12-5v"
    JFROG_POSTGRES_13X_VERSION="13-2v"
    case "$PRODUCT_NAME" in
        $ARTIFACTORY_LABEL)
            JFROG_POSTGRES_9X_VERSION="9-6-11v"
            # To bump up postgresql in artifactory add new version in array
            JFROG_POSTGRES_VERSIONS=("9.6.11" "10.13" "12.3" "12.5" "13.2")
        ;;
        $JFMC_LABEL)
            JFROG_POSTGRES_9X_VERSION="9-6-11v"
            # To bump up postgresql in jfmc add new version in array
            JFROG_POSTGRES_VERSIONS=("9.6.11" "10.13" "12.3" "12.5" "13.2")
        ;;
        $INSIGHT_LABEL)
            # To bump up postgresql in jfmc add new version in array
            JFROG_POSTGRES_VERSIONS=("13.2")
        ;;
        $DISTRIBUTION_LABEL)
            JFROG_POSTGRES_9X_VERSION="9-6-10v"
            # To bump up postgresql in distribution add new version in array
            JFROG_POSTGRES_VERSIONS=("9.6.10" "10.13" "12.3" "12.5" "13.2")
        ;;
        $XRAY_LABEL)
            JFROG_POSTGRES_9X_VERSION="9-5-2v"
            # To bump up postgresql in xray add new version in array
            JFROG_POSTGRES_VERSIONS=("9.5.2" "10.13" "12.3" "12.5" "13.2")
        ;;
    esac
}



# REF https://misc.flogisoft.com/bash/tip_colors_and_formatting
cClear="\e[0m"
cBlue="\e[38;5;69m"
cRedDull="\e[1;31m"
cYellow="\e[1;33m"
cRedBright="\e[38;5;197m"
cBold="\e[1m"


_loggerGetModeRaw() {
    local MODE="$1"
    case $MODE in
    INFO)
        printf ""
    ;;
    DEBUG)
        printf "%s" "[${MODE}] "
    ;;
    WARN)
        printf "${cRedDull}%s%s${cClear}" "[" "${MODE}" "] "
    ;;
    ERROR)
        printf "${cRedBright}%s%s${cClear}" "[" "${MODE}" "] "
    ;;
    esac
}


_loggerGetMode() {
    local MODE="$1"
    case $MODE in
    INFO)
        printf "${cBlue}%s%-5s%s${cClear}" "[" "${MODE}" "]"
    ;;
    DEBUG)
        printf "%-7s" "[${MODE}]"
    ;;
    WARN)
        printf "${cRedDull}%s%-5s%s${cClear}" "[" "${MODE}" "]"
    ;;
    ERROR)
        printf "${cRedBright}%s%-5s%s${cClear}" "[" "${MODE}" "]"
    ;;
    esac
}

# Capitalises the first letter of the message
_loggerGetMessage() {
    local originalMessage="$*"
    local firstChar=$(echo "${originalMessage:0:1}" | awk '{ print toupper($0) }')
    local resetOfMessage="${originalMessage:1}"
    echo "$firstChar$resetOfMessage"
}

# The spec also says content should be left-trimmed but this is not necessary in our case. We don't reach the limit.
_loggerGetStackTrace() {
    printf "%s%-30s%s" "[" "$1:$2" "]"
}

_loggerGetThread() {
    printf "%s" "[main]"
}

_loggerGetServiceType() {
    printf "%s%-5s%s" "[" "shell" "]"
}

#Trace ID is not applicable to scripts
_loggerGetTraceID() {
    printf "%s" "[]"
}

logRaw() {
    echo ""
    printf "$1"
    echo ""
}

logBold(){
    echo ""
    printf "${cBold}$1${cClear}"
    echo ""
}

# The date binary works differently based on whether it is GNU/BSD
is_date_supported=0
date --version > /dev/null 2>&1 || is_date_supported=1
IS_GNU=$(echo $is_date_supported)

_loggerGetTimestamp() {
    if [ "${IS_GNU}" == "0" ]; then
        echo -n $(date -u +%FT%T.%3NZ)
    else
        echo -n $(date -u +%FT%T.000Z)
    fi
}

# https://www.shellscript.sh/tips/spinner/
_spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

showSpinner() {
    # Start the Spinner:
    _spin &
    # Make a note of its Process ID (PID):
    SPIN_PID=$!
    # Kill the spinner on any signal, including our own exit.
    trap "kill -9 $SPIN_PID" `seq 0 15` &> /dev/null || return 0
}

stopSpinner() {
    local occurrences=$(ps -ef | grep -wc "${SPIN_PID}")
    let "occurrences+=0"
    # validate that it is present (2 since this search itself will show up in the results)
    if [ $occurrences -gt 1 ]; then
        kill -9 $SPIN_PID &>/dev/null || return 0
        wait $SPIN_ID &>/dev/null
    fi
}

_getEffectiveMessage(){
    local MESSAGE="$1"
    local MODE=${2-"INFO"}

    if [ -z "$CONTEXT" ]; then
        CONTEXT=$(caller)
    fi

    _EFFECTIVE_MESSAGE=
    if [ -z "$LOG_BEHAVIOR_ADD_META" ]; then
        _EFFECTIVE_MESSAGE="$(_loggerGetModeRaw $MODE)$(_loggerGetMessage $MESSAGE)"
    else
        local SERVICE_TYPE="script"
        local TRACE_ID=""
        local THREAD="main"
        
        local CONTEXT_LINE=$(echo "$CONTEXT" | awk '{print $1}')
        local CONTEXT_FILE=$(echo "$CONTEXT" | awk -F"/" '{print $NF}')
        
        _EFFECTIVE_MESSAGE="$(_loggerGetTimestamp) $(_loggerGetServiceType) $(_loggerGetMode $MODE) $(_loggerGetTraceID) $(_loggerGetStackTrace $CONTEXT_FILE $CONTEXT_LINE) $(_loggerGetThread) - $(_loggerGetMessage $MESSAGE)"
    fi
    CONTEXT=
}

# Important - don't call any log method from this method. Will become an infinite loop. Use echo to debug
_logToFile() {
    local MODE=${1-"INFO"}
    local targetFile="$LOG_BEHAVIOR_ADD_REDIRECTION"
    # IF the file isn't passed, abort
    if [ -z "$targetFile" ]; then
        return
    fi
    # IF this is not being run in verbose mode and mode is debug or lower, abort
    if [ "${VERBOSE_MODE}" != "$FLAG_Y" ] && [ "${VERBOSE_MODE}" != "true" ] && [ "${VERBOSE_MODE}" != "debug" ]; then
        if [ "$MODE" == "DEBUG" ] || [ "$MODE" == "SILLY" ]; then
            return
        fi
    fi

    # Create the file if it doesn't exist
    if [ ! -f "${targetFile}" ]; then
        return
        # touch $targetFile > /dev/null 2>&1 || true
    fi
    # # Make it readable
    # chmod 640 $targetFile > /dev/null 2>&1 || true

    # Log contents
    printf "%s\n" "$_EFFECTIVE_MESSAGE" >> "$targetFile" || true
}

logger() {
    if [ "$LOG_BEHAVIOR_ADD_NEW_LINE" == "$FLAG_Y" ]; then
        echo ""
    fi
    CONTEXT=$(caller)
    _getEffectiveMessage "$@"
    local MODE=${2-"INFO"}
    printf "%s\n" "$_EFFECTIVE_MESSAGE"
    _logToFile "$MODE"
}

logDebug(){
    VERBOSE_MODE=${VERBOSE_MODE-"false"}
    CONTEXT=$(caller)
    if [ "${VERBOSE_MODE}" == "$FLAG_Y" ] || [ "${VERBOSE_MODE}" == "true" ] || [ "${VERBOSE_MODE}" == "debug" ];then
        logger "$1" "DEBUG"
    else
        logger "$1" "DEBUG" >&6
    fi
    CONTEXT=
}

logSilly(){
    VERBOSE_MODE=${VERBOSE_MODE-"false"}
    CONTEXT=$(caller)
    if [ "${VERBOSE_MODE}" == "silly" ];then
        logger "$1" "DEBUG"
    else
        logger "$1" "DEBUG" >&6
    fi
    CONTEXT=
}

logError() {
    CONTEXT=$(caller)
    logger "$1" "ERROR"
    CONTEXT=
}

errorExit () {
    CONTEXT=$(caller)
    logger "$1" "ERROR"
    CONTEXT=
    exit 1
}

warn () {
    CONTEXT=$(caller)
    logger "$1" "WARN"
    CONTEXT=
}

note () {
    CONTEXT=$(caller)
    logger "$1" "NOTE"
    CONTEXT=
}

bannerStart() {
    title=$1
    echo
    echo -e "\033[1m${title}\033[0m"
    echo
}

bannerSection() {
    title=$1
    echo
    echo -e "******************************** ${title} ********************************"
    echo
}

bannerSubSection() {
    title=$1
    echo
    echo -e "************** ${title} *******************"
    echo
}

bannerMessge() {
    title=$1
    echo
    echo -e "********************************"
    echo -e "${title}"
    echo -e "********************************"
    echo
}

setRed () {
    local input="$1"
    echo -e \\033[31m${input}\\033[0m
}
setGreen () {
    local input="$1"
    echo -e \\033[32m${input}\\033[0m
}
setYellow () {
    local input="$1"
    echo -e \\033[33m${input}\\033[0m
}

logger_addLinebreak () {
    echo -e "---\n"
}

bannerImportant() {
    title=$1
    local bold="\033[1m"
    local noColour="\033[0m"
    echo
    echo -e "${bold}######################################## IMPORTANT ########################################${noColour}"
    echo -e "${bold}${title}${noColour}"
    echo -e "${bold}###########################################################################################${noColour}"
    echo
}

bannerEnd() {
    #TODO pass a title and calculate length dynamically so that start and end look alike
    echo
    echo "*****************************************************************************"
    echo
}

banner() {
    title=$1
    content=$2
    bannerStart "${title}"
    echo -e "$content"
}

# The logic below helps us redirect content we'd normally hide to the log file. 
    #
    # We have several commands which clutter the console with output and so use 
    # `cmd > /dev/null` - this redirects the command's output to null.
    # 
    # However, the information we just hid maybe useful for support. Using the code pattern
    # `cmd >&6` (instead of `cmd> >/dev/null` ), the command's output is hidden from the console 
    # but redirected to the installation log file
    # 

#Default value of 6 is just null
exec 6>>/dev/null
redirectLogsToFile() {
    echo ""
    # local file=$1

    # [ ! -z "${file}" ] || return 0

    # local logDir=$(dirname "$file")

    # if [ ! -f "${file}" ]; then
    #     [ -d "${logDir}" ] || mkdir -p ${logDir} || \
    #     ( echo "WARNING : Could not create parent directory (${logDir}) to redirect console log : ${file}" ; return 0 )
    # fi

    # #6 now points to the log file
    # exec 6>>${file}
    # #reference https://unix.stackexchange.com/questions/145651/using-exec-and-tee-to-redirect-logs-to-stdout-and-a-log-file-in-the-same-time
    # exec 2>&1 > >(tee -a "${file}")
}

# Check if a give key contains any sensitive string as part of it
# Based on the result, the caller can decide its value can be displayed or not
#   Sample usage : isKeySensitive "${key}" && displayValue="******" || displayValue=${value}
isKeySensitive(){
    local key=$1
    # keep all the sensitive keys in lower case
    local sensitiveKeys="password|secret|key|token|extrajavaopts|database\.url"

    if [ -z "${key}" ]; then
        return 1
    else
        local lowercaseKey=$(echo "${key}" | tr '[:upper:]' '[:lower:]' 2>/dev/null)
        [[ "${lowercaseKey}" =~ ${sensitiveKeys} ]] && return 0 || return 1
    fi
}

getPrintableValueOfKey(){
    local displayValue=
    local key="$1"
    if [ -z "$key" ]; then
        # This is actually an incorrect usage of this method but any logging will cause unexpected content in the caller
        echo -n ""
        return
    fi

    local value="$2"
    isKeySensitive "${key}" && displayValue="$SENSITIVE_KEY_VALUE" || displayValue="${value}"
    echo -n $displayValue
}

_createConsoleLog(){
    if [ -z "${JF_PRODUCT_HOME}" ]; then
        return
    fi
    local targetFile="${JF_PRODUCT_HOME}/var/log/console.log"
    mkdir -p "${JF_PRODUCT_HOME}/var/log" || true
    if [ ! -f ${targetFile} ]; then
        touch $targetFile > /dev/null 2>&1 || true
    fi
    chmod 640 $targetFile > /dev/null 2>&1 || true
}

# Output from application's logs are piped to this method. It checks a configuration variable to determine if content should be logged to 
# the common console.log file
redirectServiceLogsToFile() {

    local result="0"
    local SKIP="${FLAG_N}"
    local targetFile=

    # check if the function getSystemValue exists
    LC_ALL=C type getSystemValue > /dev/null 2>&1 || result="$?"
    if [[ "$result" != "0" ]]; then
        warn "Couldn't find the systemYamlHelper. Skipping log redirection"
        SKIP="${FLAG_Y}"
    fi

    getSystemValue "shared.logging.consoleLog.enabled" "NOT_SET"
    if [[ "${SKIP}" == "${FLAG_N}" && "${YAML_VALUE}" == "false" ]]; then
        logger "Redirection is set to false. Skipping log redirection"
        SKIP="${FLAG_Y}"
    fi

    if [[ "${SKIP}" == "${FLAG_N}" && -z "${JF_PRODUCT_HOME}" || "${JF_PRODUCT_HOME}" == "" ]]; then
        warn "JF_PRODUCT_HOME is unavailable. Skipping log redirection"
        SKIP="${FLAG_Y}"
    fi

    if [[ "${SKIP}" == "${FLAG_Y}" ]]; then
        targetFile="/dev/null"
    else
        targetFile="${JF_PRODUCT_HOME}/var/log/console.log"
        _createConsoleLog
    fi

    while read -r line; do
        printf '%s\n' "${line}" >> $targetFile || return 0 # Don't want to log anything - might clutter the screen
    done
}

## Display environment variables starting with JF_ along with its value
## Value of sensitive keys will be displayed as "******"
##
## Sample Display :
##
## ========================
## JF Environment variables
## ========================
##
## JF_SHARED_NODE_ID                   : locahost
## JF_SHARED_JOINKEY                   : ******
##
##
displayEnv() {
    local JFEnv=$(printenv | grep ^JF_ 2>/dev/null)
    local key=
    local value=

    if [ -z "${JFEnv}" ]; then
        return
    fi

    cat << ENV_START_MESSAGE

========================
JF Environment variables
========================
ENV_START_MESSAGE

    for entry in ${JFEnv}; do
        key=$(echo "${entry}" | awk -F'=' '{print $1}')
        value=$(echo "${entry}" | cut -d '=' -f2-)

        isKeySensitive "${key}" && value="******" || value=${value}
        
        printf "\n%-35s%s" "${key}" " : ${value}"
    done
    echo;
}

## Check if redirection to console log is disabled
##
## Sample usage:
##
## if $(isConsoleLogDisabled); then
##    // its disabled, forget about console.log
## else
##    // console.log is important, write all information to it
## fi
##
isConsoleLogDisabled(){
    local result=
    # check if the function getSystemValue exists
    LC_ALL=C type getSystemValue > /dev/null 2>&1
    result="$?"
    if [[ "$result" != "0" ]]; then
        return 1;
    fi

    getSystemValue "shared.logging.consoleLog.enabled" "NOT_SET" >/dev/null 2>&1

    # disable console log in docker container by default as this effects performance - INST-1238
    if [[ $(isRunningInsideAContainer 2>/dev/null) == "$FLAG_Y" && "${YAML_VALUE}" == "NOT_SET" ]] || [[ "${YAML_VALUE}" == "false" ]] ; then
        return 0;
    else
        return 1;
    fi
}

_addLogRotateConfiguration() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    # mandatory inputs
    local confFile="$1"
    local logFile="$2"

    # Method available in _ioOperations.sh
    LC_ALL=C type io_setYQPath > /dev/null 2>&1 || return 1

    io_setYQPath

    # Method available in _systemYamlHelper.sh
    LC_ALL=C type getSystemValue > /dev/null 2>&1 || return 1

    local frequency="daily"
    local archiveFolder="archived"

    local compressLogFiles=
    local delaycompressEnable=
    getSystemValue "shared.logging.rotation.compress" "true"
    if [[ "${YAML_VALUE}" == "true" ]]; then
        compressLogFiles="compress"
        delaycompressEnable="delaycompress"
    fi

    getSystemValue "shared.logging.rotation.maxFiles" "10"
    local noOfBackupFiles="${YAML_VALUE}"

    getSystemValue "shared.logging.rotation.maxSizeMb" "25"
    local sizeOfFile="${YAML_VALUE}M"

    logDebug "Adding logrotate configuration for [$logFile] to [$confFile]"

    # Add configuration to file
    local confContent=$(cat << LOGROTATECONF
$logFile {
    $frequency
    missingok
    copytruncate
    rotate $noOfBackupFiles
    $compressLogFiles
    $delaycompressEnable
    notifempty
    olddir $archiveFolder
    dateext
    extension .log
    dateformat -%Y-%m-%d-%s
    size ${sizeOfFile}
}
LOGROTATECONF
) 
    echo "${confContent}" > ${confFile} || return 1
}

_operationIsBySameUser() {
    local targetUser="$1"
    local currentUserID=$(id -u)
    local currentUserName=$(id -un)

    if [ $currentUserID == $targetUser ] || [ $currentUserName == $targetUser ]; then
        echo -n "yes"
    else   
        echo -n "no"
    fi
}

_addCronJobForLogrotate() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    
    # Abort if logrotate is not available
    [ "$(io_commandExists 'crontab')" != "yes" ] && warn "cron is not available" && return 1

    # mandatory inputs
    local productHome="$1"
    local confFile="$2"
    local cronJobOwner="$3"

    # We want to use our binary if possible. It may be more recent than the one in the OS
    local logrotateBinary="$productHome/app/third-party/logrotate/logrotate"

    if [ ! -f "$logrotateBinary" ]; then
        logrotateBinary="logrotate"
        [ "$(io_commandExists 'logrotate')" != "yes" ] && warn "logrotate is not available" && return 1
    fi
    local cmd="$logrotateBinary ${confFile} --state $productHome/var/etc/logrotate/logrotate-state" #--verbose

    id -u $cronJobOwner > /dev/null 2>&1 || { warn "User $cronJobOwner does not exist. Aborting logrotate configuration" && return 1; }
    
    # Remove the existing line
    removeLogRotation "$productHome" "$cronJobOwner" || true

    # Run logrotate daily at the 55th minute of every hour
    local cronInterval="55 * * * * $cmd"

    local standaloneMode=$(_operationIsBySameUser "$cronJobOwner")

    # If this is standalone mode, we cannot use -u - the user running this process may not have the necessary privileges
    if [ "$standaloneMode" == "no" ]; then
        (crontab -l -u $cronJobOwner 2>/dev/null; echo "$cronInterval") | crontab -u $cronJobOwner -
    else
        (crontab -l 2>/dev/null; echo "$cronInterval") | crontab -
    fi
}

## Configure logrotate for a product
## Failure conditions:
## If logrotation could not be setup for some reason
## Parameters:
## $1: The product name
## $2: The product home
## Depends on global: none
## Updates global: none
## Returns: NA

configureLogRotation() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    
    # disable console log in docker container as this effects performance - INST-1238
    if $(isConsoleLogDisabled >/dev/null 2>&1); then
        return 0;
    fi

    # mandatory inputs
    local productName="$1"
    if [ -z $productName ]; then
        warn "Incorrect usage. A product name is necessary for configuring log rotation" && return 1
    fi
    
    local productHome="$2"
    if [ -z $productHome ]; then
        warn "Incorrect usage. A product home folder is necessary for configuring log rotation" && return 1
    fi

    local logFile="${productHome}/var/log/console.log"
    if [[ $(uname) == "Darwin" ]]; then
        logger "Log rotation for [$logFile] has not been configured. Please setup manually"
        return 0
    fi
    
    local userID="$3"
    if [ -z $userID ]; then
        warn "Incorrect usage. A userID is necessary for configuring log rotation" && return 1
    fi

    local groupID=${4:-$userID}
    local logConfigOwner=${5:-$userID}

    logDebug "Configuring log rotation as user [$userID], group [$groupID], effective cron User [$logConfigOwner]"
    
    local errorMessage="Could not configure logrotate. Please configure log rotation of the file: [$logFile] manually"

    local confFile="${productHome}/var/etc/logrotate/logrotate.conf"

    # TODO move to recursive method
    createDir "${productHome}" "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }
    createDir "${productHome}/var" "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }
    createDir "${productHome}/var/log" "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }
    createDir "${productHome}/var/log/archived" "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }
    
    # TODO move to recursive method
    createDir "${productHome}/var/etc"  "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }
    createDir "${productHome}/var/etc/logrotate" "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }

    # conf file should be owned by the user running the script
    createFile "${confFile}" "$userID" "$groupID" || { warn "Could not create configuration file [$confFile]" return 1; }

    _addLogRotateConfiguration "${confFile}" "${logFile}" "$userID" "$groupID" || { warn "${errorMessage}" && return 1; }
    _addCronJobForLogrotate "${productHome}" "${confFile}" "${logConfigOwner}" || { warn "${errorMessage}" && return 1; }
}

_pauseExecution() {
    if [ "${VERBOSE_MODE}" == "debug" ]; then
      
        local breakPoint="$1"
        if [ ! -z "$breakPoint" ]; then
            printf "${cBlue}Breakpoint${cClear} [$breakPoint] "
            echo ""
        fi
        printf "${cBlue}Press enter once you are ready to continue${cClear}"
        read -s choice
        echo ""
    fi
}

# removeLogRotation "$productHome" "$cronJobOwner" || true
removeLogRotation() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    if [[ $(uname) == "Darwin" ]]; then
        logDebug "Not implemented for Darwin."
        return 0
    fi
    local productHome="$1"
    local cronJobOwner="$2"
    local standaloneMode=$(_operationIsBySameUser "$cronJobOwner")

    local confFile="${productHome}/var/etc/logrotate/logrotate.conf"
    
    if [ "$standaloneMode" == "no" ]; then
        crontab -l -u $cronJobOwner 2>/dev/null | grep -v "$confFile" | crontab -u $cronJobOwner -
    else
        crontab -l 2>/dev/null | grep -v "$confFile" | crontab -
    fi
}

# NOTE: This method does not check the configuration to see if redirection is necessary.
# This is intentional. If we don't redirect, tomcat logs might get redirected to a folder/file
# that does not exist, causing the service itself to not start
setupTomcatRedirection() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"

    if $(isConsoleLogDisabled >/dev/null 2>&1); then
        export CATALINA_OUT="/dev/null"
        logger "Redirection is set to false. Skipping catalina log redirection"
        return 0;
    else
        local consoleLog="${JF_PRODUCT_HOME}/var/log/console.log"
        _createConsoleLog
        export CATALINA_OUT="${consoleLog}"
    fi
}

setupScriptLogsRedirection() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    if [ -z "${JF_PRODUCT_HOME}" ]; then
        logDebug "No JF_PRODUCT_HOME. Returning"
        return
    fi
    # Create the console.log file if it is not already present
    # _createConsoleLog || true
    # # Ensure any logs (logger/logError/warn) also get redirected to the console.log
    # # Using installer.log as a temparory fix. Please change this to console.log once INST-291 is fixed
    export LOG_BEHAVIOR_ADD_REDIRECTION="${JF_PRODUCT_HOME}/var/log/console.log"
    export LOG_BEHAVIOR_ADD_META="$FLAG_Y"
}

# Returns Y if this method is run inside a container
isRunningInsideAContainer() {
    if [ -f "/.dockerenv" ]; then
        echo -n "$FLAG_Y"
    else
        echo -n "$FLAG_N"
    fi 
}

_messageBeforePrompt() {
    if [ "$DONT_PROMPT_USE_DEFAULTS" != "$FLAG_Y" ];then
        logRaw "$1"
    fi
}



POSTGRES_USER=999
NGINX_USER=104
NGINX_GROUP=107
ES_USER=1000
REDIS_USER=999
MONGO_USER=999
RABBITMQ_USER=999
LOG_FILE_PERMISSION=640
PID_FILE_PERMISSION=644

# Copy file
copyFile(){
    local source=$1
    local target=$2
    local mode=${3:-overwrite}
    local enableVerbose=${4:-"${FLAG_N}"}
    local verboseFlag=""

    if [ ! -z "${enableVerbose}" ] && [ "${enableVerbose}" == "${FLAG_Y}" ]; then
        verboseFlag="-v"
    fi

    if [[ ! ( $source && $target ) ]]; then
        warn "Source and target is mandatory to copy file"
        return 1
    fi

    if [[ -f "${target}" ]]; then
        [[ "$mode" = "overwrite" ]] && ( cp ${verboseFlag} -f "$source" "$target" || errorExit "Unable to copy file, command : cp -f ${source} ${target}") || true
    else
        cp ${verboseFlag} -f "$source" "$target" || errorExit "Unable to copy file, command : cp -f ${source} ${target}"
    fi
}

# Copy files recursively from given source directory to destination directory
# This method wil copy but will NOT overwrite
# Destination will be created if its not available
copyFilesNoOverwrite(){
    local src=$1
    local dest=$2
    local enableVerboseCopy="${3:-${FLAG_Y}}"

    if [[ -z "${src}" || -z "${dest}" ]]; then
        return
    fi

    if [ -d "${src}" ] && [ "$(ls -A ${src})" ]; then
        local relativeFilePath=""
        local targetFilePath=""

        for file in $(find ${src} -type f 2>/dev/null) ; do
            # Derive relative path and attach it to destination 
            # Example : 
            #       src=/extra_config
            #       dest=/var/opt/jfrog/artifactory/etc
            #       file=/extra_config/config.xml
            #       relativeFilePath=config.xml
            #       targetFilePath=/var/opt/jfrog/artifactory/etc/config.xml
            relativeFilePath=${file/${src}/}
            targetFilePath=${dest}${relativeFilePath}

            createDir "$(dirname "$targetFilePath")"
            copyFile "${file}" "${targetFilePath}" "no_overwrite" "${enableVerboseCopy}"
        done
    fi    
}

#    TODO : WINDOWS ?
#  Check the max open files and open processes set on the system
checkULimits () {
    local minMaxOpenFiles=${1:-32000}
    local minMaxOpenProcesses=${2:-1024}
    local setValue=${3:-true}
    local warningMsgForFiles=${4}
    local warningMsgForProcesses=${5}

    logger "Checking open files and processes limits"

    local currentMaxOpenFiles=$(ulimit -n)
    logger "Current max open files is $currentMaxOpenFiles"
    if [ ${currentMaxOpenFiles} != "unlimited" ] && [ "$currentMaxOpenFiles" -lt "$minMaxOpenFiles" ]; then
        if [ "${setValue}" ]; then
            ulimit -n "${minMaxOpenFiles}" >/dev/null 2>&1 || warn "Max number of open files $currentMaxOpenFiles is low!"
            [ -z "${warningMsgForFiles}" ] || warn "${warningMsgForFiles}"
        else
            errorExit "Max number of open files $currentMaxOpenFiles, is too low. Cannot run the application!"
        fi
    fi

    local currentMaxOpenProcesses=$(ulimit -u)
    logger "Current max open processes is $currentMaxOpenProcesses"
    if [ "$currentMaxOpenProcesses" != "unlimited" ] && [ "$currentMaxOpenProcesses" -lt "$minMaxOpenProcesses" ]; then
        if [ "${setValue}" ]; then
            ulimit -u "${minMaxOpenProcesses}" >/dev/null 2>&1 || warn "Max number of open files $currentMaxOpenFiles is low!"
            [ -z "${warningMsgForProcesses}" ] || warn "${warningMsgForProcesses}"
        else
            errorExit "Max number of open files $currentMaxOpenProcesses, is too low. Cannot run the application!"
        fi
    fi
}

createDirs() {
    local appDataDir=$1
    local serviceName=$2
    local folders="backup bootstrap data etc logs work"

    [ -z "${appDataDir}" ]  && errorExit "An application directory is mandatory to create its data structure"  || true
    [ -z "${serviceName}" ] && errorExit "A service name is mandatory to create service data structure"         || true

    for folder in ${folders}
    do
        folder=${appDataDir}/${folder}/${serviceName}
        if [ ! -d "${folder}" ]; then
            logger "Creating folder : ${folder}"
            mkdir -p "${folder}" || errorExit "Failed to create ${folder}"
        fi
    done
}


testReadWritePermissions () {
    local dir_to_check=$1
    local error=false

    [ -d ${dir_to_check} ] || errorExit "'${dir_to_check}' is not a directory"

    local test_file=${dir_to_check}/test-permissions

    # Write file
    if echo test > ${test_file} 1> /dev/null 2>&1; then
        # Write succeeded. Testing read...
        if cat ${test_file} > /dev/null; then
            rm -f ${test_file}
        else
            error=true
        fi
    else
        error=true
    fi

    if [ ${error} == true ]; then
        return 1
    else
        return 0
    fi
}

# Test directory has read/write permissions for current user
testDirectoryPermissions () {
    local dir_to_check=$1
    local error=false

    [ -d ${dir_to_check}  ] || errorExit "'${dir_to_check}' is not a directory"

    local u_id=$(id -u)
    local id_str="id ${u_id}"

    logger "Testing directory ${dir_to_check} has read/write permissions for user ${id_str}"

    if ! testReadWritePermissions ${dir_to_check}; then
        error=true
    fi

    if [ "${error}" == true ]; then
        local stat_data=$(stat -Lc "Directory: %n, permissions: %a, owner: %U, group: %G" ${dir_to_check})
        logger "###########################################################"
        logger "${dir_to_check} DOES NOT have proper permissions for user ${id_str}"
        logger "${stat_data}"
        logger "Mounted directory must have read/write permissions for user ${id_str}"
        logger "###########################################################"
        errorExit "Directory ${dir_to_check} has bad permissions for user ${id_str}"
    fi
    logger "Permissions for ${dir_to_check} are good"
}

# Utility method to create a directory path recursively with chown feature as
# Failure conditions:
## Exits if unable to create a directory
# Parameters:
## $1: Root directory from where the path can be created
## $2: List of recursive child directories seperated by space
## $3: user who should own the directory. Optional
## $4: group who should own the directory. Optional
# Depends on global: none
# Updates global: none
# Returns: NA
#
# Usage:
# createRecursiveDir "/opt/jfrog/product/var" "bootstrap tomcat lib" "user_name" "group_name"
createRecursiveDir(){
    local rootDir=$1
    local pathDirs=$2
    local user=$3
    local group=${4:-${user}}
    local fullPath=

    [ ! -z "${rootDir}" ] || return 0

    createDir "${rootDir}" "${user}" "${group}"

    [ ! -z "${pathDirs}" ] || return 0

    fullPath=${rootDir}

    for dir in ${pathDirs}; do
        fullPath=${fullPath}/${dir}
        createDir "${fullPath}" "${user}" "${group}"
    done
}

# Utility method to create a directory
# Failure conditions:
## Exits if unable to create a directory
# Parameters:
## $1: directory to create
## $2: user who should own the directory. Optional
## $3: group who should own the directory. Optional
# Depends on global: none
# Updates global: none
# Returns: NA

createDir(){
    local dirName="$1"
    local printMessage=no
    logSilly "Method ${FUNCNAME[0]} invoked with [$dirName]"
    [ -z "${dirName}" ] && return
    
    logDebug "Attempting to create ${dirName}"
    mkdir -p "${dirName}" || errorExit "Unable to create directory: [${dirName}]"
    local userID="$2"
    local groupID=${3:-$userID}

    # If UID/GID is passed, chown the folder
    if [ ! -z "$userID" ] && [ ! -z "$groupID" ]; then
        # Earlier, this line would have returned 1 if it failed. Now it just warns. 
        # This is intentional. Earlier, this line would NOT be reached if the folder already existed. 
        # Since it will always come to this line and the script may be running as a non-root user, this method will just warn if
        # setting permissions fails (so as to not affect any existing flows)
        io_setOwnershipNonRecursive "$dirName" "$userID" "$groupID" || warn "Could not set owner of [$dirName] to [$userID:$groupID]"
    fi
    # logging message to print created dir with user and group
    local logMessage=${4:-$printMessage}
    if [[ "${logMessage}" == "yes" ]]; then
        logger "Successfully created directory [${dirName}].  Owner: [${userID}:${groupID}]"
    fi
}

removeSoftLinkAndCreateDir () {
   local dirName="$1"
   local userID="$2"
   local groupID="$3"
   local logMessage="$4"
   removeSoftLink "${dirName}"
   createDir "${dirName}" "${userID}" "${groupID}" "${logMessage}"
}

# Utility method to remove a soft link
removeSoftLink () {
    local dirName="$1"
    if [[ -L "${dirName}" ]]; then
        targetLink=$(readlink -f "${dirName}")
        logger "Removing the symlink [${dirName}] pointing to [${targetLink}]"
        rm -f "${dirName}"
    fi
}

# Check Directory exist in the path
checkDirExists () {
    local directoryPath="$1"

    [[ -d "${directoryPath}" ]] && echo -n "true" || echo -n "false"
}


# Utility method to create a file
# Failure conditions:
# Parameters:
## $1: file to create
# Depends on global: none
# Updates global: none
# Returns: NA

createFile(){
    local fileName="$1"
    logSilly "Method ${FUNCNAME[0]} [$fileName]"
    [ -f "${fileName}" ] && return 0
    touch "${fileName}" || return 1

    local userID="$2"
    local groupID=${3:-$userID}

    # If UID/GID is passed, chown the folder
    if [ ! -z "$userID" ] && [ ! -z "$groupID" ]; then
        io_setOwnership "$fileName" "$userID" "$groupID" || return 1
    fi
}

# Check File exist in the filePath
# IMPORTANT- DON'T ADD LOGGING to this method
checkFileExists () {
    local filePath="$1"

    [[ -f "${filePath}" ]] && echo -n "true" || echo -n "false"
}

# Check for directories contains any (files or sub directories)
# IMPORTANT- DON'T ADD LOGGING to this method
checkDirContents () {
    local directoryPath="$1"
    if [[ "$(ls -1 "${directoryPath}" | wc -l)" -gt 0 ]]; then
        echo -n "true"
    else
        echo -n "false"
    fi
}

# Check contents exist in directory
# IMPORTANT- DON'T ADD LOGGING to this method
checkContentExists () {
    local source="$1"

    if [[ "$(checkDirContents "${source}")" != "true" ]]; then
        echo -n "false"
    else
        echo -n "true"
    fi
}

# Resolve the variable
# IMPORTANT- DON'T ADD LOGGING to this method
evalVariable () {
    local output="$1"
    local input="$2"

    eval "${output}"=\${"${input}"}
    eval echo \${"${output}"}
}

# Usage: if [ "$(io_commandExists 'curl')" == "yes" ]
# IMPORTANT- DON'T ADD LOGGING to this method
io_commandExists() {
    local commandToExecute="$1"
    hash "${commandToExecute}" >/dev/null 2>&1
    local rt=$?
    if [ "$rt" == 0 ]; then echo -n "yes"; else echo -n "no"; fi
}

# Usage: if [ "$(io_curlExists)" != "yes" ]
# IMPORTANT- DON'T ADD LOGGING to this method
io_curlExists() {
    io_commandExists "curl"
}

io_opensslExists() {
    io_commandExists "openssl"
}

io_hasMatch() {
    logSilly "Method ${FUNCNAME[0]}"
    local result=0
    logDebug "Executing [echo \"$1\" | grep \"$2\" >/dev/null 2>&1]"
    echo "$1" | grep "$2" >/dev/null 2>&1 || result=1
    return $result
}

# Utility method to check if the string passed (usually a connection url) corresponds to this machine itself
# Failure conditions: None
# Parameters:
## $1: string to check against
# Depends on global: none
# Updates global: IS_LOCALHOST with value "yes/no"
# Returns: NA

io_getIsLocalhost() {
    logSilly "Method ${FUNCNAME[0]}"
    IS_LOCALHOST="$FLAG_N"
    local inputString="$1"
    logDebug "Parsing [$inputString] to check if we are dealing with this machine itself"

    io_hasMatch "$inputString" "localhost" && {
        logDebug "Found localhost. Returning [$FLAG_Y]"
        IS_LOCALHOST="$FLAG_Y" && return;
    } || logDebug "Did not find match for localhost"
    
    local hostIP=$(io_getPublicHostIP)
    io_hasMatch "$inputString" "$hostIP" && {
        logDebug "Found $hostIP. Returning [$FLAG_Y]"
        IS_LOCALHOST="$FLAG_Y" && return;
    } || logDebug "Did not find match for $hostIP"
    
    local hostID=$(io_getPublicHostID)
    io_hasMatch "$inputString" "$hostID" && {
        logDebug "Found $hostID. Returning [$FLAG_Y]"
        IS_LOCALHOST="$FLAG_Y" && return;
    } || logDebug "Did not find match for $hostID"
    
    local hostName=$(io_getPublicHostName)
    io_hasMatch  "$inputString" "$hostName" && {
        logDebug "Found $hostName. Returning [$FLAG_Y]"
        IS_LOCALHOST="$FLAG_Y" && return;
    } || logDebug "Did not find match for $hostName"
    
}

# Usage: if [ "$(io_tarExists)" != "yes" ]
# IMPORTANT- DON'T ADD LOGGING to this method
io_tarExists() {
    io_commandExists "tar"
}

# IMPORTANT- DON'T ADD LOGGING to this method
io_getPublicHostIP() {
    local OS_TYPE=$(uname)
    local publicHostIP=
    if [ "${OS_TYPE}" == "Darwin" ]; then
        ipStatus=$(ifconfig en0 | grep "status" | awk '{print$2}')
        if [ "${ipStatus}" == "active" ]; then
            publicHostIP=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')
        else
            errorExit "Host IP could not be resolved!"
        fi
    elif [ "${OS_TYPE}" == "Linux" ]; then
        publicHostIP=$(hostname -i 2>/dev/null || echo "127.0.0.1")
    fi
    publicHostIP=$(echo "${publicHostIP}" | awk '{print $1}')
    echo -n "${publicHostIP}"
}

isIpV6(){
    local ip="${1}"
    if [[ ! -z "${ip}" ]] && [[ "${ip}" =~ ^.*:.*:.*$ ]]; then
        return 0;
    else
        return 1;
    fi
}

# Pass the key to be checked. The value of the key will be modified based on conditions
# Usage : _modifyValue "USER_CHOICE" "HOST_IP"
#          Before : USER_CHOICE="fe80::4001:aff:fe46:1e27"
#          After  : USER_CHOICE="[fe80::4001:aff:fe46:1e27]"
modifyValue(){
    local targetKey=${1}
    local yamlKey=${2}
    local targetValue=""

    if [[ -z "${targetKey}" ]] || [[ -z "${yamlKey}" ]]; then
        return 0;
    fi

    eval targetvalue=\${${targetKey}}

    [ -z "${targetvalue}" ] && return 0 || true

    case "${yamlKey}" in
        HOST_IP)
            # Enclose value within square brackets if its ipv6 
            if isIpV6 "${targetvalue}" && ! [[ "${targetvalue}" =~ ^\[.*\]$ ]]; then
                [[ "${targetvalue}" =~ ^\[.* ]] || targetvalue="[${targetvalue}"
                [[ "${targetvalue}" =~ .*\]$ ]] || targetvalue="${targetvalue}]"
                logger "Found an ipv6 value, enclosing it wih brackets : ${targetvalue}"
                eval ${targetKey}="${targetvalue}"
            fi
        ;;
    esac
}

# Will return the short host name (up to the first dot)
# IMPORTANT- DON'T ADD LOGGING to this method
io_getPublicHostName() {
    echo -n "$(hostname -s)"
}

# Will return the full host name (use this as much as possible)
# IMPORTANT- DON'T ADD LOGGING to this method
io_getPublicHostID() {
    echo -n "$(hostname)"
}

# Utility method to backup a file
# Failure conditions: NA
# Parameters: filePath
# Depends on global: none,
# Updates global: none
# Returns: NA
io_backupFile() {
    logSilly "Method ${FUNCNAME[0]}"
    fileName="$1"
    if [ ! -f "${filePath}" ]; then
        logDebug "No file: [${filePath}] to backup"
        return
    fi
    dateTime=$(date +"%Y-%m-%d-%H-%M-%S")
    targetFileName="${fileName}.backup.${dateTime}"
    yes | \cp -f "$fileName" "${targetFileName}"
    logger "File [${fileName}] backedup as [${targetFileName}]"
}

# Reference https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash/4025065#4025065
is_number() {
    case "$BASH_VERSION" in
        3.1.*)
            PATTERN='\^\[0-9\]+\$'
            ;;
        *)
            PATTERN='^[0-9]+$'
            ;;
    esac

    [[ "$1" =~ $PATTERN ]]
}

io_compareVersions() {
    if [[ $# != 2 ]]
    then
        echo "Usage: min_version current minimum"
        return
    fi

    A="${1%%.*}"
    B="${2%%.*}"

    if [[ "$A" != "$1" && "$B" != "$2" && "$A" == "$B" ]]
    then
        io_compareVersions "${1#*.}" "${2#*.}"
    else
        if is_number "$A" && is_number "$B"
        then
            if [[ "$A" -eq "$B" ]]; then
                echo "0"
            elif [[ "$A" -gt "$B" ]]; then
	            echo "1"
	        elif [[ "$A" -lt "$B" ]]; then
	            echo "-1"
            fi
        fi
    fi
}

# Reference https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
# Strip all leading and trailing spaces
# IMPORTANT- DON'T ADD LOGGING to this method
io_trim() {
    local var="$1"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
}

# temporary function will be removing it ASAP
# search for string and replace text in file
replaceText_migration_hook () {
    local regexString="$1"
    local replaceText="$2"
    local file="$3"

    if [[ "$(checkFileExists "${file}")" != "true" ]]; then
        return
    fi
    if [[ $(uname) == "Darwin" ]]; then
        sed -i '' -e "s/${regexString}/${replaceText}/" "${file}" || warn "Failed to replace the text in ${file}"
    else
        sed -i -e "s/${regexString}/${replaceText}/" "${file}" || warn "Failed to replace the text in ${file}"
    fi
}

# search for string and replace text in file
replaceText () {
    local regexString="$1"
    local replaceText="$2"
    local file="$3"

    if [[ "$(checkFileExists "${file}")" != "true" ]]; then
        return
    fi
    if [[ $(uname) == "Darwin" ]]; then
        sed -i '' -e "s#${regexString}#${replaceText}#" "${file}" || warn "Failed to replace the text in ${file}"
    else
        sed -i -e "s#${regexString}#${replaceText}#" "${file}" || warn "Failed to replace the text in ${file}"
        logDebug "Replaced [$regexString] with [$replaceText] in [$file]"
    fi
}

# search for string and prepend text in file
prependText () {
    local regexString="$1"
    local text="$2"
    local file="$3"

    if [[ "$(checkFileExists "${file}")" != "true" ]]; then
        return
    fi
    if [[ $(uname) == "Darwin" ]]; then
        sed -i '' -e '/'"${regexString}"'/i\'$'\n\\'"${text}"''$'\n' "${file}" || warn "Failed to prepend the text in ${file}"
    else
        sed -i -e '/'"${regexString}"'/i\'$'\n\\'"${text}"''$'\n' "${file}" || warn "Failed to prepend the text in ${file}"
    fi
}

# add text to beginning of the file
addText () {
    local text="$1"
    local file="$2"

    if [[ "$(checkFileExists "${file}")" != "true" ]]; then
        return
    fi
    if [[ $(uname) == "Darwin" ]]; then
        sed -i '' -e '1s/^/'"${text}"'\'$'\n/' "${file}" || warn "Failed to add the text in ${file}"
    else
        sed -i -e '1s/^/'"${text}"'\'$'\n/' "${file}" || warn "Failed to add the text in ${file}"
    fi
}

io_replaceString () {
    local value="$1"
    local firstString="$2"
    local secondString="$3"
    local separator=${4:-"/"}
    local updateValue=
    if [[ $(uname) == "Darwin" ]]; then
        updateValue=$(echo "${value}" | sed "s${separator}${firstString}${separator}${secondString}${separator}")
    else
        updateValue=$(echo "${value}" | sed "s${separator}${firstString}${separator}${secondString}${separator}")
    fi
    echo -n "${updateValue}"
}

_findYQ() {
    # logSilly "Method ${FUNCNAME[0]}" (Intentionally not logging. Does not add value)
    local parentDir="$1"
    if [ -z "$parentDir" ]; then
        return
    fi
    logDebug "Executing command [find "${parentDir}" -name third-party -type d]"
    local yq=$(find "${parentDir}" -name third-party -type d)
    if [ -d "${yq}/yq" ]; then
        export YQ_PATH="${yq}/yq"
    fi
}


io_setYQPath() {
    if [ -z "${YQ_PATH}" ] && [ ! -z "${COMPOSE_HOME}" ] && [ -d "${COMPOSE_HOME}" ]; then
        _findYQ "${COMPOSE_HOME}"
    fi
    # TODO We can remove this block after all the code is restructured.
    if [ -z "${YQ_PATH}" ] && [ ! -z "${SCRIPT_HOME}" ] && [ -d "${SCRIPT_HOME}" ]; then
        _findYQ "${SCRIPT_HOME}"
    fi

    # logSilly "Method ${FUNCNAME[0]}" (Intentionally not logging. Does not add value)  
    if [ -z "${YQ_PATH}" ] &&  [ ! -z "${JF_PRODUCT_HOME}" ] && [ -d "${JF_PRODUCT_HOME}" ]; then
        _findYQ "${JF_PRODUCT_HOME}"
    fi
}

io_getLinuxDistribution() {
    LINUX_DISTRIBUTION=

    # Make sure running on Linux
    [ $(uname -s) != "Linux" ] && return

    # Find out what Linux distribution we are on

    cat /etc/*-release | grep -i Red >/dev/null 2>&1 && LINUX_DISTRIBUTION=RedHat || true

    # OS 6.x
    cat /etc/issue.net | grep Red >/dev/null 2>&1 && LINUX_DISTRIBUTION=RedHat || true

    # OS 7.x
    cat /etc/*-release | grep -i centos >/dev/null 2>&1 && LINUX_DISTRIBUTION=CentOS && LINUX_DISTRIBUTION_VER="7" || true

    # OS 8.x
    grep -q -i "release 8" /etc/redhat-release >/dev/null 2>&1 && LINUX_DISTRIBUTION_VER="8" || true

    # OS 7.x
    grep -q -i "release 7" /etc/redhat-release >/dev/null 2>&1 && LINUX_DISTRIBUTION_VER="7" || true

    # OS 6.x
    grep -q -i "release 6" /etc/redhat-release >/dev/null 2>&1 && LINUX_DISTRIBUTION_VER="6" || true

    cat /etc/*-release | grep -i Red | grep -i 'VERSION=7' >/dev/null 2>&1 && LINUX_DISTRIBUTION=RedHat && LINUX_DISTRIBUTION_VER="7" || true

    cat /etc/*-release | grep -i debian >/dev/null 2>&1 && LINUX_DISTRIBUTION=Debian || true

    cat /etc/*-release | grep -i ubuntu >/dev/null 2>&1 && LINUX_DISTRIBUTION=Ubuntu || true

    # OS SLES
    cat /etc/*-release | grep -i SUSE >/dev/null 2>&1 && LINUX_DISTRIBUTION="SLES" && LINUX_DISTRIBUTION_VER="12-SP5" || true
}

## Utility method to check ownership of folders/files
## Failure conditions:
    ## If invoked with incorrect inputs - FATAL
    ## If file is not owned by the user & group
## Parameters:
    ## user
    ## group
    ## folder to chown    
## Globals: none
## Returns: none
## NOTE: The method does NOTHING if the OS is Mac
io_checkOwner () {
    logSilly "Method ${FUNCNAME[0]}"
    local osType=$(uname)
    
    if [ "${osType}" != "Linux" ]; then
        logDebug "Unsupported OS. Skipping check"
        return 0
    fi

    local file_to_check=$1
    local user_id_to_check=$2
    

    if [ -z "$user_id_to_check" ] || [ -z "$file_to_check" ]; then
        errorExit "Invalid invocation of method. Missing mandatory inputs"
    fi

    local group_id_to_check=${3:-$user_id_to_check}
    local check_user_name=${4:-"no"}

    logDebug "Checking permissions on [$file_to_check] for user [$user_id_to_check] & group [$group_id_to_check]"

    local stat=

    if [ "${check_user_name}" == "yes" ]; then
        stat=( $(stat -Lc "%U %G" ${file_to_check}) )
    else
        stat=( $(stat -Lc "%u %g" ${file_to_check}) )
    fi

    local user_id=${stat[0]}
    local group_id=${stat[1]}

    if [[ "${user_id}" != "${user_id_to_check}" ]] || [[ "${group_id}" != "${group_id_to_check}" ]] ; then
        logDebug "Ownership mismatch. [${file_to_check}] is not owned by [${user_id_to_check}:${group_id_to_check}]"
        return 1
    else
        return 0
    fi
}

## Utility method to change ownership of a file/folder - NON recursive
## Failure conditions:
    ## If invoked with incorrect inputs - FATAL
    ## If chown operation fails - returns 1
## Parameters: 
    ## user
    ## group
    ## file to chown    
## Globals: none
## Returns: none
## NOTE: The method does NOTHING if the OS is Mac

io_setOwnershipNonRecursive() {
    
    local osType=$(uname)
    if [ "${osType}" != "Linux" ]; then
        return
    fi

    local targetFile="$1"
    local user="$2"

    if [ -z "$user" ] || [ -z "$targetFile" ]; then
        errorExit "Invalid invocation of method. Missing mandatory inputs"
    fi

    local group=${3:-$user}
    logDebug "Method ${FUNCNAME[0]}. Executing [chown ${user}:${group} ${targetFile}]"
    chown ${user}:${group} "${targetFile}" || return 1
}

## Utility method to change ownership of a file. 
## IMPORTANT 
## If being called on a folder, should ONLY be called for fresh folders or may cause performance issues
## Failure conditions:
    ## If invoked with incorrect inputs - FATAL
    ## If chown operation fails - returns 1
## Parameters: 
    ## user
    ## group
    ## file to chown    
## Globals: none
## Returns: none
## NOTE: The method does NOTHING if the OS is Mac

io_setOwnership() {
    
    local osType=$(uname)
    if [ "${osType}" != "Linux" ]; then
        return
    fi

    local targetFile="$1"
    local user="$2"

    if [ -z "$user" ] || [ -z "$targetFile" ]; then
        errorExit "Invalid invocation of method. Missing mandatory inputs"
    fi

    local group=${3:-$user}
    logDebug "Method ${FUNCNAME[0]}. Executing [chown -R ${user}:${group} ${targetFile}]"
    chown -R ${user}:${group} "${targetFile}" || return 1
}

## Utility method to create third party folder structure necessary for Postgres
## Failure conditions:
## If creation of directory or assigning permissions fails
## Parameters: none
## Globals:
## POSTGRESQL_DATA_ROOT
## Returns: none
## NOTE: The method does NOTHING if the folder already exists
io_createPostgresDir() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    [ -z "${POSTGRESQL_DATA_ROOT}" ] && return 0

    logDebug "Property [${POSTGRESQL_DATA_ROOT}] exists. Proceeding"

    createDir "${POSTGRESQL_DATA_ROOT}/data"
    if [[ $(stat -c "User:%u" ${POSTGRESQL_DATA_ROOT} | awk -F ':' '{print $2}') != ${POSTGRES_USER} ]]; then
        io_setOwnership  "${POSTGRESQL_DATA_ROOT}" "${POSTGRES_USER}" "${POSTGRES_USER}" || errorExit "Setting ownership of [${POSTGRESQL_DATA_ROOT}] to [${POSTGRES_USER}:${POSTGRES_USER}] failed"
    fi
}

## Utility method to create third party folder structure necessary for Nginx
## Failure conditions:
## If creation of directory or assigning permissions fails
## Parameters: none
## Globals:
## NGINX_DATA_ROOT
## Returns: none
## NOTE: The method does NOTHING if the folder already exists
io_createNginxDir() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    [ -z "${NGINX_DATA_ROOT}" ] && return 0

    logDebug "Property [${NGINX_DATA_ROOT}] exists. Proceeding"

    createDir "${NGINX_DATA_ROOT}"
    io_setOwnership  "${NGINX_DATA_ROOT}" "${NGINX_USER}" "${NGINX_GROUP}" || errorExit "Setting ownership of [${NGINX_DATA_ROOT}] to [${NGINX_USER}:${NGINX_GROUP}] failed"
}

## Utility method to create third party folder structure necessary for ElasticSearch
## Failure conditions:
## If creation of directory or assigning permissions fails
## Parameters: none
## Globals:
## ELASTIC_DATA_ROOT
## Returns: none
## NOTE: The method does NOTHING if the folder already exists
io_createElasticSearchDir() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    [ -z "${ELASTIC_DATA_ROOT}" ] && return 0

    logDebug "Property [${ELASTIC_DATA_ROOT}] exists. Proceeding"

    createDir "${ELASTIC_DATA_ROOT}/data"
    io_setOwnership  "${ELASTIC_DATA_ROOT}" "${ES_USER}" "${ES_USER}" || errorExit "Setting ownership of [${ELASTIC_DATA_ROOT}] to [${ES_USER}:${ES_USER}] failed"
}

## Utility method to create third party folder structure necessary for Redis
## Failure conditions:
## If creation of directory or assigning permissions fails
## Parameters: none
## Globals:
## REDIS_DATA_ROOT
## Returns: none
## NOTE: The method does NOTHING if the folder already exists
io_createRedisDir() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    [ -z "${REDIS_DATA_ROOT}" ] && return 0

    logDebug "Property [${REDIS_DATA_ROOT}] exists. Proceeding"

    createDir "${REDIS_DATA_ROOT}"
    io_setOwnership  "${REDIS_DATA_ROOT}" "${REDIS_USER}" "${REDIS_USER}" || errorExit "Setting ownership of [${REDIS_DATA_ROOT}] to [${REDIS_USER}:${REDIS_USER}] failed"
}

## Utility method to create third party folder structure necessary for Mongo
## Failure conditions:
## If creation of directory or assigning permissions fails
## Parameters: none
## Globals:
## MONGODB_DATA_ROOT
## Returns: none
## NOTE: The method does NOTHING if the folder already exists
io_createMongoDir() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    [ -z "${MONGODB_DATA_ROOT}" ] && return 0

    logDebug "Property [${MONGODB_DATA_ROOT}] exists. Proceeding"

    createDir "${MONGODB_DATA_ROOT}/logs"
    createDir "${MONGODB_DATA_ROOT}/configdb"
    createDir "${MONGODB_DATA_ROOT}/db"
    io_setOwnership  "${MONGODB_DATA_ROOT}" "${MONGO_USER}" "${MONGO_USER}" || errorExit "Setting ownership of [${MONGODB_DATA_ROOT}] to [${MONGO_USER}:${MONGO_USER}] failed"
}

## Utility method to create third party folder structure necessary for RabbitMQ
## Failure conditions:
## If creation of directory or assigning permissions fails
## Parameters: none
## Globals:
## RABBITMQ_DATA_ROOT
## Returns: none
## NOTE: The method does NOTHING if the folder already exists
io_createRabbitMQDir() {
    logDebug "Method ${FUNCNAME[0]} Caller:$(caller)"
    [ -z "${RABBITMQ_DATA_ROOT}" ] && return 0

    logDebug "Property [${RABBITMQ_DATA_ROOT}] exists. Proceeding"

    createDir "${RABBITMQ_DATA_ROOT}"
    io_setOwnership  "${RABBITMQ_DATA_ROOT}" "${RABBITMQ_USER}" "${RABBITMQ_USER}" || errorExit "Setting ownership of [${RABBITMQ_DATA_ROOT}] to [${RABBITMQ_USER}:${RABBITMQ_USER}] failed"
}

# Add or replace a property in provided properties file
addOrReplaceProperty() {
    local propertyName=$1
    local propertyValue=$2
    local propertiesPath=$3
    local delimiter=${4:-"="}

    # Return if any of the inputs are empty
    [[ -z "$propertyName"   || "$propertyName"   == "" ]] && return
    [[ -z "$propertyValue"  || "$propertyValue"  == "" ]] && return
    [[ -z "$propertiesPath" || "$propertiesPath" == "" ]] && return

    grep "^${propertyName}\s*${delimiter}.*$" ${propertiesPath} > /dev/null 2>&1
    [ $? -ne 0 ] && echo -e "\n${propertyName}${delimiter}${propertyValue}" >> ${propertiesPath}
    sed -i -e "s|^${propertyName}\s*${delimiter}.*$|${propertyName}${delimiter}${propertyValue}|g;" ${propertiesPath}
}

# Remove a property in provided properties file
removeProperty() {
    local propertyName=$1
    local propertiesPath=$2
    local delimiter=${3:-":"}

    # Return if any of the inputs are empty
    [[ -z "$propertyName"   || "$propertyName"   == "" ]] && return 0
    [[ -z "$propertiesPath" || "$propertiesPath" == "" ]] && return 0

    grep "^${propertyName}\s*${delimiter}.*$" ${propertiesPath} > /dev/null 2>&1

    # If provided property exists in file remove the line
    if [ $? -eq 0 ]; then
        sed -i -e "/^${propertyName}\s*${delimiter}.*$/d" ${propertiesPath} || return 1
    fi
}

# Set property only if its not set
io_setPropertyNoOverride(){
    local propertyName=$1
    local propertyValue=$2
    local propertiesPath=$3

    # Return if any of the inputs are empty
    [[ -z "$propertyName"   || "$propertyName"   == "" ]] && return
    [[ -z "$propertyValue"  || "$propertyValue"  == "" ]] && return
    [[ -z "$propertiesPath" || "$propertiesPath" == "" ]] && return

    grep "^${propertyName}:" ${propertiesPath} > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "${propertyName}: ${propertyValue}" >> ${propertiesPath} || warn "Setting property ${propertyName}: ${propertyValue} in [ ${propertiesPath} ] failed"
    else
        logger "Skipping update of property : ${propertyName}" >&6
    fi
}

# Add a line to a file if it doesn't already exist
addLine() {
    local line_to_add=$1
    local target_file=$2
    logger "Trying to add line $1 to $2" >&6 2>&1
    cat "$target_file" | grep -F "$line_to_add" -wq >&6 2>&1
    if [ $? != 0  ]; then
        logger "Line does not exist and will be added" >&6 2>&1
        echo $line_to_add >> $target_file || errorExit "Could not update $target_file"
    fi    
}

# Utility method to check if a value (first paramter) exists in an array (2nd parameter)
# 1st parameter "value to find"
# 2nd parameter "The array to search in. Please pass a string with each value separated by space"
# Example: containsElement "y" "y Y n N"
containsElement () {
  local searchElement=$1
  local searchArray=($2)
  local found=1
  for elementInIndex in "${searchArray[@]}";do
    if [[ $elementInIndex == $searchElement ]]; then
        found=0
    fi
  done
  return $found
}

# Utility method to get user's choice
# 1st parameter "what to ask the user"
# 2nd parameter "what choices to accept, separated by spaces"
# 3rd parameter "what is the default choice (to use if the user simply presses Enter)"
# Example 'getUserChoice "Are you feeling lucky? Punk!" "y n Y N" "y"'
getUserChoice(){
    configureLogOutput
    read_timeout=${read_timeout:-0.5}
    local choice="na"
    local text_to_display=$1
    local choices=$2
    local default_choice=$3
    users_choice=

    until containsElement "$choice" "$choices"; do
        echo "";echo "";
        sleep $read_timeout #This ensures correct placement of the question.
        read -p  "$text_to_display :" choice
        : ${choice:=$default_choice}
    done
    users_choice=$choice
    echo -e "\n$text_to_display: $users_choice" >&6
    sleep $read_timeout #This ensures correct logging
}

setFilePermission () {
    local permission=$1
    local file=$2
    chmod "${permission}" "${file}" || warn "Setting permission ${permission} to file [ ${file} ] failed"
}

# Read properties file and (Add|Update) the property
propertyTransform () {
    local confFile="$1"
    local propName="${2}"
    local newPropValue="${3}"
    local check=
   
   [[ -z "$confFile"     || "$confFile"     == "" ]] && return
   [[ -z "$propName"     || "$propName"     == "" ]] && return
   [[ -z "$newPropValue" || "$newPropValue" == "" ]] && return

    while IFS='=' read -r key value || [ -n "${key}" ];
    do
        [[ -z "${key}" || "${key}" == $'\n' || "${key}" =~ \#.* ]] && continue
        key="$(io_trim "${key}")"
        if [[ "${key}" == "${propName}" ]]; then
            local existingPropValue="$(io_trim "${value}")"
            # Compare property value and update, if there is a  change
            if [[ "${existingPropValue}" != "${newPropValue}" ]]; then
                addOrReplaceProperty "${propName}" "${newPropValue}" "${confFile}" " = "
                check=false && break
            fi
            check=false && break
        else
            check=true
        fi
    done < "${confFile}"
    # Add new property
    if [[ "${check}" == "true" ]]; then
        local property=$(echo "${propName}" = "${newPropValue}")
        echo -e "\n${property}" >> "${confFile}"
    fi
}

# Transform array of objects from system yaml into properties files
transformPropertiesToFile () {
   local confFile="$1"
   local yamlKey="$2"
   local systemYamlFile="$3"
   local ignorePropName=($4)
   local status=

   [[ -z "$confFile"        || "$confFile" == "" ]] && return
   [[ -z "$yamlKey"         || "$yamlKey"  == "" ]] && return
   [[ -z "$systemYamlFile"  || "$systemYamlFile"  == "" ]] && return

   #get count of properties list in sysytem yaml
    getYamlValue "${yamlKey}[].name" "${systemYamlFile}" "false"
    local propCount="${YAML_VALUE}"
    if [[ -z "${propCount}" ]]; then
        return
    fi
    propCount=$(echo ${propCount} | tr '-' ' ')
    propCount=$(io_trim "${propCount}")
    propCount=($propCount)
    propCount=${#propCount[@]}

    for ((i = 0 ; i < "${propCount}" ; i++)); do
        # Read properties from system.yaml
        getYamlValue "${yamlKey}[$i].name" "${systemYamlFile}" "false"
        local propName="${YAML_VALUE}"
        if [[ -z "${propName}" ]]; then
            return
        fi
        getYamlValue "${yamlKey}[$i].value" "${systemYamlFile}" "false"
        local newPropValue="${YAML_VALUE}"
        if [[ -z "${newPropValue}" ]]; then
            warn "Empty value for [${yamlKey}[$i].name] in [${systemYamlFile}]"
            return
        fi
        if [[ ! "${ignorePropName[@]}" =~  "${propName}" ]]; then
            # Read properties file and (Add|Update) the property
            propertyTransform "${confFile}" "${propName}" "${newPropValue}"
        else
            status=false
        fi
    done
    if [[ "${status}" == "false" ]]; then
        logger "One of the properties [${ignorePropName[*]}] was found in the [${systemYamlFile}], Ignoring it!"
        logger "Properties [${ignorePropName[*]}] are used and set by the application and must not be set in the [${systemYamlFile}]."
    fi
}

randomPasswordGenerator () {
    local entry="$1"
    local randomPassword=
    local rt="$(io_opensslExists)"
    if [[ "$rt" == "yes" ]]; then
        randomPassword=$(echo "${entry}" | openssl rand -hex 8 2>/dev/null)
    else
        randomPassword=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 8 2>/dev/null)
    fi
    echo "${randomPassword}"
}

# Use bash in-built to open a tcp connection to associated socket using redirections
# This expects the url to be of the format http://localhost:8082/router/api/v1/system/ping
# Can be used to make simple get calls
httpGet(){
    local url=$1
    local dns=
    local port=
    local api=
    local tag="Connection: close"

    if [[ -z "$url" || "$url" = "" ]]; then
        errorExit "URL is not passed for health check!"
    fi

    # extract dns from url
    dns=$(echo "$url" | awk -F ':' '{print $2}' )
    dns=${dns/\/\//""} # //localhost ==> localhost

    # extract port
    portWithApi=$(echo "$url" | awk -F ':' '{print $3}' )
    port=$(grep -o '[0-9]*' <<< "$portWithApi")  
    port=$(echo ${port} | awk -F ' ' '{print $1}') # 8082/router/api/v1/system/ping ==> 8082

    # extract api
    api=$(echo "${portWithApi}" | tr "${port}" " ")
    api=$(io_trim "${api}")  # 8082/router/api/v1/system/ping ==> /router/api/v1/system/ping
    ping -c 1 -W 1 "${dns}"
    if [ $? -ne 0 ]; then
        return
    fi
    exec 5<> /dev/tcp/${dns}/${port}
    cat <&5 &
    echo -en "GET ${api} HTTP/1.1\r\nHost: ${dns}:${port}\r\n${tag}\r\n\r\n" >&5
}


#setting required paths
setAppDir (){
    SCRIPT_DIR=$(dirname $0)
    SCRIPT_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    APP_DIR="`cd "${SCRIPT_HOME}";pwd`"
}

ZIP_TYPE="zip"
COMPOSE_TYPE="compose"
RPM_TYPE="rpm"
DEB_TYPE="debian"
DOCKER_TYPE="docker"

sourceScript () {
    local file="$1"

    [ ! -z "${file}" ] || errorExit "target file is not passed to source a file"

    if [ ! -f "${file}" ]; then
        errorExit "${file} file is not found"
    else
        source "${file}" || errorExit "Unable to source ${file}, please check if the user ${USER} has permissions to perform this action"
    fi
}
# Source required helpers
initHelpers () {
    local systemYamlHelper="${APP_DIR}/systemYamlHelper.sh"
    local thirdPartyDir=$(find ${APP_DIR}/.. -name third-party -type d)
    export YQ_PATH="${thirdPartyDir}/yq"
    LIBXML2_PATH="${thirdPartyDir}/libxml2/bin/xmllint"
    export LD_LIBRARY_PATH="${thirdPartyDir}/libxml2/lib"
    sourceScript "${systemYamlHelper}"
}
# Check migration info yaml file available in the path
checkMigrationInfoYaml () {

    if [[ -f "${APP_DIR}/migrationZipInfo.yaml" ]]; then
        MIGRATION_SYSTEM_YAML_INFO="${APP_DIR}/migrationZipInfo.yaml"
        INSTALLER="${ZIP_TYPE}"
    elif [[ -f "${APP_DIR}/migrationRpmInfo.yaml" ]]; then
        MIGRATION_SYSTEM_YAML_INFO="${APP_DIR}/migrationRpmInfo.yaml"
        INSTALLER="${RPM_TYPE}"
    elif [[ -f "${APP_DIR}/migrationDebInfo.yaml" ]]; then
        MIGRATION_SYSTEM_YAML_INFO="${APP_DIR}/migrationDebInfo.yaml"
        INSTALLER="${DEB_TYPE}"
    elif [[ -f "${APP_DIR}/migrationDockerInfo.yaml" ]]; then
        MIGRATION_SYSTEM_YAML_INFO="${APP_DIR}/migrationDockerInfo.yaml"
        INSTALLER="${DOCKER_TYPE}"
    elif [[ -f "${APP_DIR}/migrationComposeInfo.yaml" ]]; then
        MIGRATION_SYSTEM_YAML_INFO="${APP_DIR}/migrationComposeInfo.yaml"
        INSTALLER="${COMPOSE_TYPE}"
    else
        errorExit "File migration Info yaml does not exist in [${APP_DIR}]"
    fi
}

retrieveYamlValue () {
    local yamlPath="$1"
    local value="$2"
    local output="$3"
    local message="$4"

    [[ -z "${yamlPath}" ]] && errorExit "yamlPath is mandatory to get value from ${MIGRATION_SYSTEM_YAML_INFO}"

    getYamlValue "${yamlPath}" "${MIGRATION_SYSTEM_YAML_INFO}" "false"
    value="${YAML_VALUE}"
    if [[ -z "${value}" ]]; then
        if [[ "${output}" == "Warning" ]]; then
            warn "Empty value for ${yamlPath} in [${MIGRATION_SYSTEM_YAML_INFO}]"
        elif [[ "${output}" == "Skip" ]]; then
            return
        else
            errorExit "${message}"
        fi
    fi
}

checkEnv () {
   
    if [[ "${INSTALLER}" == "${ZIP_TYPE}" ]]; then
        # check Environment JF_PRODUCT_HOME is set before migration
        NEW_DATA_DIR="$(evalVariable "NEW_DATA_DIR" "JF_PRODUCT_HOME")"
        if [[ -z "${NEW_DATA_DIR}" ]]; then
            errorExit "Environment variable JF_PRODUCT_HOME is not set, this is required to perform Migration"
        fi
    else
        # check Environment JF_ROOT_DATA_DIR is set before migration
        OLD_DATA_DIR="$(evalVariable "OLD_DATA_DIR" "JF_ROOT_DATA_DIR")"
        # check Environment JF_ROOT_DATA_DIR is set before migration
        NEW_DATA_DIR="$(evalVariable "NEW_DATA_DIR" "JF_ROOT_DATA_DIR")"
        if [[ -z "${NEW_DATA_DIR}" ]] && [[  -z "${OLD_DATA_DIR}" ]]; then
            errorExit "Could not find ${PROMPT_DATA_DIR_LOCATION} to perform Migration"
        fi
    fi
    # appending var directory to $JF_PRODUCT_HOME
    NEW_DATA_DIR="${NEW_DATA_DIR}/var"
}

getDataDir () {

    if [[ "${INSTALLER}" == "${ZIP_TYPE}" || "${INSTALLER}" == "${COMPOSE_TYPE}" ]]; then
        checkEnv
    elif [[ "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then
        OLD_DATA_DIR="$(evalVariable "OLD_DATA_DIR" "JF_ROOT_DATA_DIR")"
        NEW_DATA_DIR="${OLD_DATA_DIR}"
        if [[ -z "${NEW_DATA_DIR}" ]] && [[  -z "${OLD_DATA_DIR}" ]]; then
            errorExit "Could not find ${PROMPT_DATA_DIR_LOCATION} to perform Migration"
        fi
    else
        getCustomDataDir_hook
        NEW_DATA_DIR="`cd "${APP_DIR}"/../../;pwd`"
        NEW_DATA_DIR="${NEW_DATA_DIR}/var"
    fi
}

# Retrieve Product name from MIGRATION_SYSTEM_YAML_INFO
getProduct () {
    retrieveYamlValue "migration.product" "${YAML_VALUE}" "Fail" "Empty value under ${yamlPath} in [${MIGRATION_SYSTEM_YAML_INFO}]"
    PRODUCT="${YAML_VALUE}"
    PRODUCT=$(echo "${PRODUCT}" | tr '[:upper:]' '[:lower:]' 2>/dev/null)
    if [[ "${PRODUCT}" != "artifactory" && "${PRODUCT}" != "distribution" && "${PRODUCT}" != "xray" ]]; then
        errorExit "migration.product in [${MIGRATION_SYSTEM_YAML_INFO}] is not correct, please set based on product as ARTIFACTORY or DISTRIBUTION or XRAY"
    fi
}
# Compare product version with minProductVersion and maxProductVersion
migrateCheckVersion () {
    local productVersion="$1"
    local minProductVersion="$2"
    local maxProductVersion="$3"

    if [[ "$(io_compareVersions "${productVersion}" "${maxProductVersion}")" -eq 0 || "$(io_compareVersions "${productVersion}" "${maxProductVersion}")" -eq 1 ]]; then
        logger "Migration not necessary. ${PRODUCT} is already ${productVersion}"
        exit 0
    elif [[ "$(io_compareVersions "${productVersion}" "${minProductVersion}")" -eq 0 || "$(io_compareVersions "${productVersion}" "${minProductVersion}")" -eq 1 ]]; then
        bannerStart "Detected ${PRODUCT} ${productVersion}, initiating migration"
    else
        logger "Current ${PRODUCT} ${productVersion} version is not supported for migration"
        exit 1
    fi
}

getProductVersion () {
    local minProductVersion="$1"
    local maxProductVersion="$2"
    local newfilePath="$3"
    local oldfilePath="$4"
    local propertyInDocker="$5"
    local property="$6"
    local productVersion=
    local status=

    if [[ "$INSTALLER" == "${COMPOSE_TYPE}" ]]; then
        if [[ -f "${oldfilePath}" ]]; then
            if [[ "${PRODUCT}" == "artifactory" ]]; then
                productVersion="$(readKey "${property}" "${oldfilePath}")"
            else
                productVersion="$(cat "${oldfilePath}")"
            fi
            status="success"
        elif [[ -f "${newfilePath}" ]]; then
            productVersion="$(readKey "${propertyInDocker}" "${newfilePath}")"
            status="fail"
        else
            logger "File [${oldfilePath}] or [${newfilePath}] not found to get current version."
            exit 0
        fi
    else
        if [[ -f "${newfilePath}" ]]; then
            productVersion="$(readKey "${property}" "${newfilePath}")"
            status="fail"
        elif [[ -f "${oldfilePath}" ]]; then
            productVersion="$(readKey "${property}" "${oldfilePath}")"
            status="success"
        else
            if [[ "${INSTALLER}" == "${ZIP_TYPE}" || "$INSTALLER" == "${DOCKER_TYPE}" ]]; then
                logger "File [${newfilePath}] not found to get current version."
            else
                logger "File [${oldfilePath}] or [${newfilePath}] not found to get current version."
            fi
            exit 0
        fi
    fi
    if [[ -z "${productVersion}" || "${productVersion}" == "" ]]; then
        [[ "${status}" == "success" ]] && logger "No version found in file [${oldfilePath}]."
        [[ "${status}" == "fail" ]] && logger "No version found in file [${newfilePath}]."
        exit 0
    fi

    migrateCheckVersion "${productVersion}" "${minProductVersion}" "${maxProductVersion}"
}

readKey () {
    local property="$1"
    local file="$2"
    local version=

    while IFS='=' read -r key value || [ -n "${key}" ];
    do
        [[ ! "${key}" =~ \#.* && ! -z "${key}" && ! -z "${value}" ]]
        key="$(io_trim "${key}")"
        if [[ "${key}" == "${property}" ]]; then
            version="${value}" && check=true && break
        else
            check=false
        fi
    done < "${file}"
    if [[ "${check}" == "false" ]]; then
        return
    fi
    echo "${version}"
}

# create Log directory
createLogDir () {
    if [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        getUserAndGroupFromFile
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/log" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}"
    fi
}

# Creating migration log file
creationMigrateLog () {
    local LOG_FILE_NAME="migration.log"
    createLogDir
    local MIGRATION_LOG_FILE="${NEW_DATA_DIR}/log/${LOG_FILE_NAME}"
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then
        MIGRATION_LOG_FILE="${SCRIPT_HOME}/${LOG_FILE_NAME}"
    fi
    touch "${MIGRATION_LOG_FILE}"
    setFilePermission "${LOG_FILE_PERMISSION}" "${MIGRATION_LOG_FILE}"
    exec &> >(tee -a "${MIGRATION_LOG_FILE}")   
}
# Set path where system.yaml should create
setSystemYamlPath () {
    SYSTEM_YAML_PATH="${NEW_DATA_DIR}/etc/system.yaml"
    logger "system.yaml will be created in path [${SYSTEM_YAML_PATH}]"
}
# Create directory
createDirectory () {
    local directory="$1"
    local output="$2"
    local check=false
    local message="Could not create directory ${directory}, please check if the user ${USER} has permissions to perform this action"
    removeSoftLink "${directory}"
    mkdir -p "${directory}" && check=true || check=false
    if [[ "${check}" == "false" ]]; then
        if [[ "${output}" == "Warning" ]]; then
            warn "${message}"
        else
            errorExit "${message}"
        fi
    fi
    setOwnershipBasedOnInstaller "${directory}"
}

setOwnershipBasedOnInstaller () {
    local directory="$1"
    if [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        getUserAndGroupFromFile
        chown -R ${USER_TO_CHECK}:${GROUP_TO_CHECK} "${directory}" || warn "Setting ownership on $directory failed"
    elif [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${COMPOSE_TYPE}" ]]; then
        io_setOwnership "${directory}" "${JF_USER}" "${JF_USER}"
    fi
}

getUserAndGroup () {
    local file="$1"
    read uid gid <<<$(stat -c '%U %G' ${file})
    USER_TO_CHECK="${uid}"
    GROUP_TO_CHECK="${gid}"
}
    
# set ownership
getUserAndGroupFromFile () {
    case $PRODUCT in
        artifactory)
            getUserAndGroup "/etc/opt/jfrog/artifactory/artifactory.properties"
        ;;
        distribution)
            getUserAndGroup "${OLD_DATA_DIR}/etc/versions.properties"
        ;;
        xray)
            getUserAndGroup "${OLD_DATA_DIR}/security/master.key"
        ;;
        esac
} 

# creating required directories
createRequiredDirs () {
    bannerSubSection "CREATING REQUIRED DIRECTORIES"
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/etc/security" "${JF_USER}" "${JF_USER}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/data" "${JF_USER}" "${JF_USER}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/log/archived" "${JF_USER}" "${JF_USER}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/work" "${JF_USER}" "${JF_USER}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/backup" "${JF_USER}" "${JF_USER}" "yes"
        io_setOwnership "${NEW_DATA_DIR}" "${JF_USER}" "${JF_USER}"
        if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" ]]; then
            removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/data/postgres" "${POSTGRES_USER}" "${POSTGRES_USER}" "yes"
        fi
    elif [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        getUserAndGroupFromFile
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/etc" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/etc/security" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/data" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/log/archived" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/work" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${NEW_DATA_DIR}/backup" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
    fi
}

# Check entry in map is format
checkMapEntry () {
    local entry="$1"

    [[ "${entry}" != *"="* ]] && echo -n "false" || echo -n "true"
}
# Check value Empty and warn
warnIfEmpty () {
    local filePath="$1"
    local yamlPath="$2"
    local check=

    if [[ -z "${filePath}" ]]; then
        warn "Empty value in yamlpath [${yamlPath} in [${MIGRATION_SYSTEM_YAML_INFO}]"
        check=false
    else
        check=true
    fi
    echo "${check}"
}

logCopyStatus () {
    local status="$1"
    local logMessage="$2"
    local warnMessage="$3"

    [[ "${status}" == "success"  ]] && logger "${logMessage}"
    [[ "${status}" == "fail" ]] && warn "${warnMessage}"
}
# copy contents from source to destination
copyCmd () {
    local source="$1"
    local target="$2"
    local mode="$3"
    local status=
    
    case $mode in
        unique)
            cp -up "${source}"/* "${target}"/ && status="success" || status="fail"
            logCopyStatus "${status}" "Successfully copied directory contents from [${source}] to [${target}]" "Failed to copy directory contents from [${source}] to [${target}]"
        ;;
        specific)
            cp -pf "${source}" "${target}"/ && status="success" || status="fail"
            logCopyStatus "${status}" "Successfully copied file [${source}] to [${target}]" "Failed to copy file [${source}] to [${target}]"
        ;;
        patternFiles)
            cp -pf "${source}"* "${target}"/ && status="success" || status="fail"
            logCopyStatus "${status}" "Successfully copied files matching [${source}*] to [${target}]" "Failed to copy files matching [${source}*] to [${target}]"
        ;;
        full)
            cp -prf "${source}"/* "${target}"/ && status="success" || status="fail"
            logCopyStatus "${status}" "Successfully copied directory contents from [${source}] to [${target}]" "Failed to copy directory contents from [${source}] to [${target}]"
        ;;
    esac
}
# Check contents exist in source before copying
copyOnContentExist () {
    local source="$1"
    local target="$2"
    local mode="$3"

    if [[ "$(checkContentExists "${source}")" == "true" ]]; then
        copyCmd "${source}" "${target}" "${mode}"
    else
        logger "No contents to copy from [${source}]"
    fi
}

# move source to destination
moveCmd () {
    local source="$1"
    local target="$2"
    local status=
    
    mv -f "${source}" "${target}" && status="success" || status="fail"
    [[ "${status}" == "success" ]] && logger "Successfully moved directory [${source}] to [${target}]"
    [[ "${status}" == "fail" ]] && warn "Failed to move directory [${source}] to [${target}]"
}

# symlink target to source
symlinkCmd () {
    local source="$1"
    local target="$2"
    local symlinkSubDir="$3"
    local check=false
    
    if [[ "${symlinkSubDir}" == "subDir" ]]; then
        ln -sf "${source}"/* "${target}" && check=true || check=false
    else
        ln -sf "${source}" "${target}"   && check=true || check=false
    fi
    
    [[ "${check}" == "true"  ]] && logger "Successfully symlinked directory [${target}] to old [${source}]"
    [[ "${check}" == "false" ]] && warn "Symlink operation failed"
}
# Check contents exist in source before symlinking
symlinkOnExist () {
    local source="$1"
    local target="$2"
    local symlinkSubDir="$3"

    if [[ "$(checkContentExists "${source}")" == "true" ]]; then
        if [[ "${symlinkSubDir}" == "subDir" ]]; then
            symlinkCmd "${source}" "${target}" "subDir"
        else
            symlinkCmd "${source}" "${target}"
        fi
    else
        logger "No contents to symlink from [${source}]"
    fi
}

prependDir () {
    local absolutePath="$1"
    local fullPath="$2"
    local sourcePath=

    if [[ "${absolutePath}" = \/* ]]; then
        sourcePath="${absolutePath}"
    else
        sourcePath="${fullPath}"
    fi
    echo "${sourcePath}"
}

getFirstEntry (){
    local entry="$1"

    [[ -z "${entry}" ]] && return
    echo "${entry}" | awk -F"=" '{print $1}'
}

getSecondEntry () {
    local entry="$1"

    [[ -z "${entry}" ]] && return
    echo "${entry}" | awk -F"=" '{print $2}'
}
# To get absolutePath
pathResolver () {
    local directoryPath="$1"
    local dataDir=

    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then
        retrieveYamlValue "migration.oldDataDir" "oldDataDir" "Warning"
        dataDir="${YAML_VALUE}"
        cd "${dataDir}"
    else
        cd "${OLD_DATA_DIR}"
    fi
    absoluteDir="`cd "${directoryPath}";pwd`"
    echo "${absoluteDir}"
}

checkPathResolver () {
    local value="$1"

    if [[ "${value}" == \/* ]]; then
        value="${value}"
    else
        value="$(pathResolver "${value}")"
    fi
    echo "${value}"
}

propertyMigrate () {
    local entry="$1"
    local filePath="$2"
    local fileName="$3"
    local check=false

    local yamlPath="$(getFirstEntry "${entry}")"
    local property="$(getSecondEntry "${entry}")"
    if [[ -z "${property}" ]]; then
        warn "Property is empty in map [${entry}] in the file [${MIGRATION_SYSTEM_YAML_INFO}]"
        return
    fi
    if [[ -z "${yamlPath}" ]]; then
        warn "yamlPath is empty for [${property}] in [${MIGRATION_SYSTEM_YAML_INFO}]"
        return
    fi
    while IFS='=' read -r key value || [ -n "${key}" ];
    do
        [[ ! "${key}" =~ \#.* && ! -z "${key}" && ! -z "${value}" ]]
        key="$(io_trim "${key}")"
        if [[ "${key}" == "${property}" ]]; then
            if [[ "${PRODUCT}" == "artifactory" ]]; then
                value="$(migrateResolveDerbyPath "${key}" "${value}")"
                value="$(migrateResolveHaDirPath "${key}" "${value}")"
                if [[ "${INSTALLER}" != "${DOCKER_TYPE}" ]]; then 
                    value="$(updatePostgresUrlString_Hook "${yamlPath}" "${value}")"
                fi
            fi
            if [[ "${key}" == "context.url" ]]; then
                local ip=$(echo "${value}" | awk -F/ '{print $3}' | sed 's/:.*//')
                setSystemValue "shared.node.ip" "${ip}" "${SYSTEM_YAML_PATH}"
                logger "Setting [shared.node.ip] with [${ip}] in system.yaml"
            fi
            setSystemValue "${yamlPath}" "${value}" "${SYSTEM_YAML_PATH}" && logger "Setting [${yamlPath}] with value of the property [${property}] in system.yaml" && check=true && break || check=false
        fi
    done < "${NEW_DATA_DIR}/${filePath}/${fileName}"
    [[ "${check}" == "false" ]] && logger "Property [${property}] not found in file [${fileName}]"
}

setHaEnabled_hook () {
    echo ""
}

migratePropertiesFiles () {
    local fileList=
    local filePath=
    local fileName=
    local map=
    
    retrieveYamlValue "migration.propertyFiles.files" "fileList" "Skip"
    fileList="${YAML_VALUE}"
    if [[ -z "${fileList}" ]]; then
        return
    fi
    bannerSection "PROCESSING MIGRATION OF PROPERTY FILES"
    for file in ${fileList};
    do
        bannerSubSection "Processing Migration of $file"
        retrieveYamlValue "migration.propertyFiles.$file.filePath" "filePath" "Warning"
        filePath="${YAML_VALUE}"
        retrieveYamlValue "migration.propertyFiles.$file.fileName" "fileName" "Warning"
        fileName="${YAML_VALUE}"
        [[ -z "${filePath}" && -z "${fileName}" ]] && continue
        if [[ "$(checkFileExists "${NEW_DATA_DIR}/${filePath}/${fileName}")" == "true" ]]; then
            logger "File [${fileName}] found in path [${NEW_DATA_DIR}/${filePath}]"
            # setting haEnabled with true only if ha-node.properties is present
            setHaEnabled_hook "${filePath}"
            retrieveYamlValue "migration.propertyFiles.$file.map" "map" "Warning"
            map="${YAML_VALUE}"
            [[ -z "${map}" ]] && continue
            for entry in $map;
            do
                if [[ "$(checkMapEntry "${entry}")" == "true" ]]; then
                    propertyMigrate "${entry}" "${filePath}" "${fileName}"
                else
                    warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e yamlPath=property"
                fi
            done
        else
            logger "File [${fileName}] was not found in path [${NEW_DATA_DIR}/${filePath}] to migrate"
        fi
    done
}

createTargetDir () {
    local mountDir="$1"
    local target="$2"

    logger "Target directory not found [${mountDir}/${target}], creating it"
    createDirectoryRecursive "${mountDir}" "${target}" "Warning"
}

createDirectoryRecursive () {
    local mountDir="$1"
    local target="$2"
    local output="$3"
    local check=false
    local message="Could not create directory ${directory}, please check if the user ${USER} has permissions to perform this action"
    removeSoftLink "${mountDir}/${target}"
    local directory=$(echo "${target}" | tr '/' ' ' )
    local targetDir="${mountDir}"
    for dir in ${directory}; 
    do
        targetDir="${targetDir}/${dir}"
        mkdir -p "${targetDir}" && check=true || check=false
        setOwnershipBasedOnInstaller "${targetDir}"
    done
    if [[ "${check}" == "false" ]]; then
        if [[ "${output}" == "Warning" ]]; then
            warn "${message}"
        else
            errorExit "${message}"
        fi
    fi
}

copyOperation () {
    local source="$1"
    local target="$2"
    local mode="$3"
    local check=false
    local targetDataDir=
    local targetLink=
    local date=

    # prepend OLD_DATA_DIR only if source is relative path
    source="$(prependDir "${source}" "${OLD_DATA_DIR}/${source}")"
    targetDataDir="`cd "${NEW_DATA_DIR}"/../;pwd`"
    copyLogMessage "${mode}"
    #remove source if it is a symlink
    if [[ -L "${source}" ]]; then
        targetLink=$(readlink -f "${source}")
        logger "Removing the symlink [${source}] pointing to [${targetLink}]"
        rm -f "${source}"
        source=${targetLink}
    fi
    if [[ "$(checkDirExists "${source}")" != "true" ]]; then
        logger "Source [${source}] directory not found in path"
        return
    fi
    if [[ "$(checkDirContents "${source}")" != "true" ]]; then
        logger "No contents to copy from [${source}]"
        return
    fi
    if [[ "$(checkDirExists "${targetDataDir}/${target}")" != "true" ]]; then
        createTargetDir "${targetDataDir}" "${target}"
    fi
    copyOnContentExist "${source}" "${targetDataDir}/${target}" "${mode}"
}

copySpecificFiles () {
    local source="$1"
    local target="$2"
    local mode="$3"
  
    # prepend OLD_DATA_DIR only if source is relative path
    source="$(prependDir "${source}" "${OLD_DATA_DIR}/${source}")"
    targetDataDir="`cd "${NEW_DATA_DIR}"/../;pwd`"
    copyLogMessage "${mode}"
    if [[ "$(checkFileExists "${source}")" != "true" ]]; then
        logger "Source file [${source}] does not exist in path"
        return
    fi
    if [[ "$(checkDirExists "${targetDataDir}/${target}")" != "true" ]]; then
        createTargetDir "${targetDataDir}" "${target}"
    fi
    copyCmd "${source}" "${targetDataDir}/${target}" "${mode}"
}

copyPatternMatchingFiles () {
    local source="$1"
    local target="$2"
    local mode="$3"
    local sourcePath="${4}"

    # prepend OLD_DATA_DIR only if source is relative path
    sourcePath="$(prependDir "${sourcePath}" "${OLD_DATA_DIR}/${sourcePath}")"
    targetDataDir="`cd "${NEW_DATA_DIR}"/../;pwd`"
    copyLogMessage "${mode}"
    if [[ "$(checkDirExists "${sourcePath}")" != "true" ]]; then
        logger "Source [${sourcePath}] directory not found in path"
        return
    fi
    if ls "${sourcePath}/${source}"* 1> /dev/null 2>&1; then
        if [[ "$(checkDirExists "${targetDataDir}/${target}")" != "true" ]]; then
            createTargetDir "${targetDataDir}" "${target}"
        fi
        copyCmd "${sourcePath}/${source}" "${targetDataDir}/${target}" "${mode}"
    else
        logger "Source file [${sourcePath}/${source}*] does not exist in path"
    fi
}

copyLogMessage () {
    local mode="$1"
    case $mode in
        specific)
           logger "Copy file [${source}] to target [${targetDataDir}/${target}]"
        ;;
        patternFiles)
            logger "Copy files matching [${sourcePath}/${source}*] to target [${targetDataDir}/${target}]"
        ;;
        full)
            logger "Copy directory contents from source [${source}] to target [${targetDataDir}/${target}]"
        ;;
        unique)
            logger "Copy directory contents from source [${source}] to target [${targetDataDir}/${target}]"
        ;;
    esac
}

copyBannerMessages () {
    local mode="$1"
    local textMode="$2"
    case $mode in
        specific)
            bannerSection "COPY ${textMode} FILES"
        ;;
        patternFiles)
            bannerSection "COPY MATCHING ${textMode}"
        ;;
        full)
            bannerSection "COPY ${textMode} DIRECTORIES CONTENTS"
        ;;
        unique)
            bannerSection "COPY ${textMode} DIRECTORIES CONTENTS"
        ;;
    esac
}

invokeCopyFunctions () {
    local mode="$1"
    local source="$2"
    local target="$3"

    case $mode in
        specific)
            copySpecificFiles "${source}" "${target}" "${mode}"
        ;;
        patternFiles)
            retrieveYamlValue "migration.${copyFormat}.sourcePath" "map" "Warning"
            local sourcePath="${YAML_VALUE}"
            copyPatternMatchingFiles "${source}" "${target}" "${mode}" "${sourcePath}"
        ;;
        full)
            copyOperation "${source}" "${target}" "${mode}"
        ;;
        unique)
            copyOperation "${source}" "${target}" "${mode}"
        ;;
    esac
}
# Copies contents from source directory and target directory
copyDataDirectories () {
    local copyFormat="$1"
    local mode="$2"
    local map=
    local source=
    local target=
    local textMode=
    local targetDataDir=
    local copyFormatValue=

    retrieveYamlValue "migration.${copyFormat}" "${copyFormat}" "Skip"
    copyFormatValue="${YAML_VALUE}"
    if [[ -z "${copyFormatValue}" ]]; then
        return
    fi
    textMode=$(echo "${mode}" | tr '[:lower:]' '[:upper:]' 2>/dev/null)
    copyBannerMessages "${mode}" "${textMode}"
    retrieveYamlValue "migration.${copyFormat}.map" "map" "Warning"
    map="${YAML_VALUE}"
    targetDataDir="`cd "${NEW_DATA_DIR}"/../;pwd`"
    for entry in $map;
    do
        if [[ "$(checkMapEntry "${entry}")" == "true" ]]; then
            source="$(getSecondEntry "${entry}")"
            target="$(getFirstEntry "${entry}")"
            [[ -z "${source}" ]] && warn "source value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
            [[ -z "${target}" ]] && warn "target value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
            invokeCopyFunctions "${mode}" "${source}" "${target}"
        else
            warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e target=source"
        fi
        echo "";
    done
}

invokeMoveFunctions () {
    local source="$1"
    local target="$2"
    local sourceDataDir=
    local targetBasename=
    # prepend OLD_DATA_DIR only if source is relative path
    sourceDataDir=$(prependDir "${source}" "${OLD_DATA_DIR}/${source}")
    targetBasename=$(dirname "${target}")
    logger "Moving directory source [${sourceDataDir}] to target [${NEW_DATA_DIR}/${target}]"
    if [[ "$(checkDirExists "${sourceDataDir}")" != "true" ]]; then
        logger "Directory [${sourceDataDir}] not found in path to move"
        return
    fi
    if [[ "$(checkDirExists "${NEW_DATA_DIR}/${targetBasename}")" != "true" ]]; then
        createTargetDir "${NEW_DATA_DIR}" "${targetBasename}"
        moveCmd "${sourceDataDir}" "${NEW_DATA_DIR}/${target}"
    else
        moveCmd "${sourceDataDir}" "${NEW_DATA_DIR}/tempDir"
        moveCmd "${NEW_DATA_DIR}/tempDir" "${NEW_DATA_DIR}/${target}"
    fi
}

# Move source directory and target directory
moveDirectories () {
    local moveDataDirectories=
    local map=
    local source=
    local target=

    retrieveYamlValue "migration.moveDirectories" "moveDirectories" "Skip"
    moveDirectories="${YAML_VALUE}"
    if [[ -z "${moveDirectories}" ]]; then
        return
    fi
    bannerSection "MOVE DIRECTORIES"
    retrieveYamlValue "migration.moveDirectories.map" "map" "Warning"
    map="${YAML_VALUE}"
    for entry in $map;
    do
        if [[ "$(checkMapEntry "${entry}")" == "true" ]]; then
            source="$(getSecondEntry "${entry}")"
            target="$(getFirstEntry "${entry}")"
            [[ -z "${source}" ]] && warn "source value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
            [[ -z "${target}" ]] && warn "target value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
            invokeMoveFunctions "${source}" "${target}"
        else
            warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e target=source"
        fi
    echo "";
    done
}

copyDirectories () {

    copyDataDirectories "copyFiles" "full"
    copyDataDirectories "copyUniqueFiles" "unique"
    copyDataDirectories "copySpecificFiles" "specific"
    copyDataDirectories "copyPatternMatchingFiles" "patternFiles"
}

symlinkDir () {
    local source="$1"
    local target="$2"
    local targetDir=
    local basename=
    local targetParentDir=
     
    targetDir="$(dirname "${target}")"
    if [[ "${targetDir}" == "${source}" ]]; then
        # symlink the sub directories
        createDirectory "${NEW_DATA_DIR}/${target}" "Warning"
        if [[ "$(checkDirExists "${NEW_DATA_DIR}/${target}")" == "true" ]]; then
            symlinkOnExist "${OLD_DATA_DIR}/${source}" "${NEW_DATA_DIR}/${target}" "subDir"
            basename="$(basename "${target}")"
            cd "${NEW_DATA_DIR}/${target}" && rm -f "${basename}"
        fi
    else
        targetParentDir="$(dirname "${NEW_DATA_DIR}/${target}")"
        createDirectory "${targetParentDir}" "Warning"
        if [[ "$(checkDirExists "${targetParentDir}")" == "true" ]]; then
            symlinkOnExist "${OLD_DATA_DIR}/${source}" "${NEW_DATA_DIR}/${target}"
        fi
    fi
}

symlinkOperation () {
    local source="$1"
    local target="$2"
    local check=false
    local targetLink=
    local date=
    
    #   Check if source is a link and do symlink
    if [[ -L "${OLD_DATA_DIR}/${source}" ]]; then
        targetLink=$(readlink -f "${OLD_DATA_DIR}/${source}")
        symlinkOnExist "${targetLink}" "${NEW_DATA_DIR}/${target}"
    else
        #  check if source is directory and do symlink
        if [[ "$(checkDirExists "${OLD_DATA_DIR}/${source}")" != "true" ]]; then
            logger "Source [${source}] directory not found in path to symlink"
            return
        fi
        if [[ "$(checkDirContents "${OLD_DATA_DIR}/${source}")" != "true" ]]; then
            logger "No contents found in [${OLD_DATA_DIR}/${source}] to symlink"
            return
        fi
        if [[ "$(checkDirExists "${NEW_DATA_DIR}/${target}")" != "true" ]]; then
            logger "Target directory [${NEW_DATA_DIR}/${target}] does not exist to create symlink, creating it"
            symlinkDir "${source}" "${target}"
        else
            rm -rf "${NEW_DATA_DIR}/${target}" && check=true || check=false
            [[ "${check}" == "false" ]] && warn "Failed to remove contents in [${NEW_DATA_DIR}/${target}/]"
            symlinkDir "${source}" "${target}"
        fi
    fi
}
# Creates a symlink path - Source directory to which the symbolic link should point.
symlinkDirectories () {
    local linkFiles=
    local map=
    local source=
    local target=

    retrieveYamlValue "migration.linkFiles" "linkFiles" "Skip"
    linkFiles="${YAML_VALUE}"
    if [[ -z "${linkFiles}" ]]; then
        return
    fi
    bannerSection "SYMLINK DIRECTORIES"
    retrieveYamlValue "migration.linkFiles.map" "map" "Warning"
    map="${YAML_VALUE}"
    for entry in $map;
    do
        if [[ "$(checkMapEntry "${entry}")" == "true" ]]; then
            source="$(getSecondEntry "${entry}")"
            target="$(getFirstEntry "${entry}")"
            logger "Symlink directory [${NEW_DATA_DIR}/${target}] to old [${OLD_DATA_DIR}/${source}]"
            [[ -z "${source}" ]] && warn "source value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
            [[ -z "${target}" ]] && warn "target value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
            symlinkOperation "${source}" "${target}"
        else
            warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e target=source"
        fi
        echo "";
    done
}

updateConnectionString () {
    local yamlPath="$1"
    local value="$2"
    local mongoPath="shared.mongo.url"
    local rabbitmqPath="shared.rabbitMq.url"
    local postgresPath="shared.database.url"
    local redisPath="shared.redis.connectionString"
    local mongoConnectionString="mongo.connectionString"
    local sourceKey=
    local hostIp=$(io_getPublicHostIP)
    local hostKey=
    
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" ]]; then 
    # Replace @postgres:,@mongodb:,@rabbitmq:,@redis: to @{hostIp}: (Compose Installer)
        hostKey="@${hostIp}:"
        case $yamlPath in
            ${postgresPath})
                sourceKey="@postgres:"
                value=$(io_replaceString "${value}" "${sourceKey}" "${hostKey}")
            ;;
            ${mongoPath})
                sourceKey="@mongodb:"
                value=$(io_replaceString "${value}" "${sourceKey}" "${hostKey}")
            ;;
            ${rabbitmqPath})
                sourceKey="@rabbitmq:"
                value=$(io_replaceString "${value}" "${sourceKey}" "${hostKey}")
            ;;
            ${redisPath})
                sourceKey="@redis:"
                value=$(io_replaceString "${value}" "${sourceKey}" "${hostKey}")
            ;;
            ${mongoConnectionString})
                sourceKey="@mongodb:"
                value=$(io_replaceString "${value}" "${sourceKey}" "${hostKey}")
            ;;
        esac
    fi
    echo -n "${value}"
}

yamlMigrate () {
    local entry="$1"
    local sourceFile="$2"
    local value=
    local yamlPath=
    local key=
    yamlPath="$(getFirstEntry "${entry}")"
    key="$(getSecondEntry "${entry}")"
    if [[ -z "${key}" ]]; then
        warn "key is empty in map [${entry}] in the file [${MIGRATION_SYSTEM_YAML_INFO}]"
        return
    fi
    if [[ -z "${yamlPath}" ]]; then
        warn "yamlPath is empty for [${key}] in [${MIGRATION_SYSTEM_YAML_INFO}]"
        return
    fi
    getYamlValue "${key}" "${sourceFile}" "false"
    value="${YAML_VALUE}"
    if [[ ! -z "${value}" ]]; then
        value=$(updateConnectionString "${yamlPath}" "${value}")
    fi
    if [[ "${PRODUCT}" == "artifactory" ]]; then
        replicatorSetDefaultPort "${sourceFile}" "${key}" "${value}"
        replicatorProfiling "${key}" "${value}"
    fi
    if [[ -z "${value}" ]]; then
        logger "No value for [${key}] in [${sourceFile}]"
    else
        setSystemValue "${yamlPath}" "${value}" "${SYSTEM_YAML_PATH}"
        logger "Setting [${yamlPath}] with value of the key [${key}] in system.yaml"
    fi
}

migrateYamlFile () {
    local files=
    local filePath=
    local fileName=
    local sourceFile=
    local map=
    retrieveYamlValue "migration.yaml.files" "files" "Skip"
    files="${YAML_VALUE}"
    if [[ -z "${files}" ]]; then
        return
    fi
    bannerSection "MIGRATION OF YAML FILES"
    for file in $files;
    do
        bannerSubSection "Processing Migration of $file"
        retrieveYamlValue "migration.yaml.$file.filePath" "filePath" "Warning"
        filePath="${YAML_VALUE}"
        retrieveYamlValue "migration.yaml.$file.fileName" "fileName" "Warning"
        fileName="${YAML_VALUE}"
        [[ -z "${filePath}" && -z "${fileName}" ]] && continue
        sourceFile="${NEW_DATA_DIR}/${filePath}/${fileName}"
        if [[ "$(checkFileExists "${sourceFile}")" == "true" ]]; then
            logger "File [${fileName}] found in path [${NEW_DATA_DIR}/${filePath}]"
            retrieveYamlValue "migration.yaml.$file.map" "map" "Warning"
            map="${YAML_VALUE}"
            [[ -z "${map}" ]] && continue
            for entry in $map;
            do
                if [[ "$(checkMapEntry "${entry}")" == "true" ]]; then
                    yamlMigrate "${entry}" "${sourceFile}"
                else
                    warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e yamlPath=key"
                fi
            done
        else
            logger "File [${fileName}] is not found in path [${NEW_DATA_DIR}/${filePath}] to migrate"
        fi
    done
}
# updates the key and value in system.yaml
updateYamlKeyValue () {
    local entry="$1"
    local value=
    local yamlPath=
    local key=

    yamlPath="$(getFirstEntry "${entry}")"
    value="$(getSecondEntry "${entry}")"
    if [[ -z "${value}" ]]; then
        warn "value is empty in map [${entry}] in the file [${MIGRATION_SYSTEM_YAML_INFO}]"
        return
    fi
    if [[ -z "${yamlPath}" ]]; then
        warn "yamlPath is empty for [${key}] in [${MIGRATION_SYSTEM_YAML_INFO}]"
        return
    fi
    setSystemValue "${yamlPath}" "${value}" "${SYSTEM_YAML_PATH}"
    logger "Setting [${yamlPath}] with value [${value}] in system.yaml"
}

updateSystemYamlFile () {
    local updateYaml=
    local map=

    retrieveYamlValue "migration.updateSystemYaml" "updateYaml" "Skip"
    updateSystemYaml="${YAML_VALUE}"
    if [[ -z "${updateSystemYaml}" ]]; then
        return
    fi
    bannerSection "UPDATE SYSTEM YAML FILE WITH KEY AND VALUES"
    retrieveYamlValue "migration.updateSystemYaml.map" "map" "Warning"
    map="${YAML_VALUE}"
    if [[ -z "${map}" ]]; then
        return
    fi
    for entry in $map;
    do
        if [[ "$(checkMapEntry "${entry}")" == "true" ]]; then
            updateYamlKeyValue "${entry}"
        else
            warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e yamlPath=key"
        fi
    done
}

backupFiles_hook () {
    logSilly "Method ${FUNCNAME[0]}"
}

backupDirectory () {
    local backupDir="$1"
    local dir="$2"
    local targetDir="$3"
    local effectiveUser=
    local effectiveGroup=

    if [[ "${dir}" = \/* ]]; then
        dir=$(echo "${dir/\//}")
    fi
            
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then 
        effectiveUser="${JF_USER}"
        effectiveGroup="${JF_USER}"
    elif [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        effectiveUser="${USER_TO_CHECK}" 
        effectiveGroup="${GROUP_TO_CHECK}"
    fi
    
    removeSoftLinkAndCreateDir "${backupDir}" "${effectiveUser}" "${effectiveGroup}" "yes"
    local backupDirectory="${backupDir}/${PRODUCT}"
    removeSoftLinkAndCreateDir "${backupDirectory}" "${effectiveUser}" "${effectiveGroup}" "yes"
    removeSoftLinkAndCreateDir "${backupDirectory}/${dir}" "${effectiveUser}" "${effectiveGroup}" "yes"
    local outputCheckDirExists="$(checkDirExists "${backupDirectory}/${dir}")"
    if [[ "${outputCheckDirExists}" == "true" ]]; then
        copyOnContentExist "${targetDir}" "${backupDirectory}/${dir}" "full"
    fi
}

removeOldDirectory () {
    local backupDir="$1"
    local entry="$2"
    local check=false
    
     # prepend OLD_DATA_DIR only if entry is relative path
    local targetDir="$(prependDir "${entry}" "${OLD_DATA_DIR}/${entry}")"
    local outputCheckDirExists="$(checkDirExists "${targetDir}")"
    if [[ "${outputCheckDirExists}" != "true" ]]; then
        logger "No [${targetDir}] directory found to delete"
        echo "";
        return
    fi
    backupDirectory "${backupDir}" "${entry}" "${targetDir}"
    rm -rf  "${targetDir}" && check=true || check=false
    [[ "${check}" == "true"  ]] && logger "Successfully removed directory [${targetDir}]"
    [[ "${check}" == "false" ]] && warn "Failed to remove directory [${targetDir}]"
    echo "";
}

cleanUpOldDataDirectories () {
    local cleanUpOldDataDir=
    local map=
    local entry=

    retrieveYamlValue "migration.cleanUpOldDataDir" "cleanUpOldDataDir" "Skip"
    cleanUpOldDataDir="${YAML_VALUE}"
    if [[ -z "${cleanUpOldDataDir}" ]]; then
        return
    fi
    bannerSection "CLEAN UP OLD DATA DIRECTORIES"
    retrieveYamlValue "migration.cleanUpOldDataDir.map" "map" "Warning"
    map="${YAML_VALUE}"
    [[ -z "${map}" ]] && continue
    date="$(date +%Y%m%d%H%M)"
    backupDir="${NEW_DATA_DIR}/backup/backup-${date}"
    bannerImportant "****** Old data configurations are backedup in [${backupDir}] directory ******"
    backupFiles_hook "${backupDir}/${PRODUCT}"
    for entry in $map;
    do
        removeOldDirectory "${backupDir}" "${entry}"
    done
}

backupFiles () {
    local backupDir="$1"
    local dir="$2"
    local targetDir="$3"
    local fileName="$4"
    local effectiveUser=
    local effectiveGroup=

    if [[ "${dir}" = \/* ]]; then
        dir=$(echo "${dir/\//}")
    fi
            
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then 
        effectiveUser="${JF_USER}"
        effectiveGroup="${JF_USER}"
    elif [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        effectiveUser="${USER_TO_CHECK}" 
        effectiveGroup="${GROUP_TO_CHECK}"
    fi

    removeSoftLinkAndCreateDir "${backupDir}" "${effectiveUser}" "${effectiveGroup}" "yes"
    local backupDirectory="${backupDir}/${PRODUCT}"
    removeSoftLinkAndCreateDir "${backupDirectory}" "${effectiveUser}" "${effectiveGroup}" "yes"
    removeSoftLinkAndCreateDir "${backupDirectory}/${dir}" "${effectiveUser}" "${effectiveGroup}" "yes"
    local outputCheckDirExists="$(checkDirExists "${backupDirectory}/${dir}")"
    if [[ "${outputCheckDirExists}" == "true" ]]; then
        copyCmd "${targetDir}/${fileName}" "${backupDirectory}/${dir}" "specific"
    fi
}

removeOldFiles () {
    local backupDir="$1"
    local directoryName="$2"
    local fileName="$3"
    local check=false
    
     # prepend OLD_DATA_DIR only if entry is relative path
    local targetDir="$(prependDir "${directoryName}" "${OLD_DATA_DIR}/${directoryName}")"
    local outputCheckFileExists="$(checkFileExists "${targetDir}/${fileName}")"
    if [[ "${outputCheckFileExists}" != "true" ]]; then
        logger "No [${targetDir}/${fileName}] file found to delete"
        return
    fi
    backupFiles "${backupDir}" "${directoryName}" "${targetDir}" "${fileName}"
    rm -f  "${targetDir}/${fileName}" && check=true || check=false
    [[ "${check}" == "true"  ]] && logger "Successfully removed file [${targetDir}/${fileName}]"
    [[ "${check}" == "false" ]] && warn "Failed to remove file [${targetDir}/${fileName}]"
    echo "";
}

cleanUpOldFiles () {
    local cleanUpFiles=
    local map=
    local entry=

    retrieveYamlValue "migration.cleanUpOldFiles" "cleanUpOldFiles" "Skip"
    cleanUpOldFiles="${YAML_VALUE}"
    if [[ -z "${cleanUpOldFiles}" ]]; then
        return
    fi
    bannerSection "CLEAN UP OLD FILES"
    retrieveYamlValue "migration.cleanUpOldFiles.map" "map" "Warning"
    map="${YAML_VALUE}"
    [[ -z "${map}" ]] && continue
    date="$(date +%Y%m%d%H%M)"
    backupDir="${NEW_DATA_DIR}/backup/backup-${date}"
    bannerImportant "****** Old files are backedup in [${backupDir}] directory ******"
    for entry in $map;
    do  
        local outputCheckMapEntry="$(checkMapEntry "${entry}")"
        if [[ "${outputCheckMapEntry}" != "true" ]]; then
            warn "map entry [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}] is not in correct format, correct format i.e directoryName=fileName"
        fi
        local fileName="$(getSecondEntry "${entry}")"
        local directoryName="$(getFirstEntry "${entry}")"
        [[ -z "${fileName}" ]] && warn "File name value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
        [[ -z "${directoryName}" ]] && warn "Directory name value is empty for [${entry}] in [${MIGRATION_SYSTEM_YAML_INFO}]" && continue
        removeOldFiles "${backupDir}" "${directoryName}" "${fileName}"
        echo "";
    done 
}
_moveConfigFilesUnderOldDir () {
    local filePath="$1"
    local newFilepath="$2"
    local targetLink=

    [[ -z "$filePath"      || "$filePath" == "" ]] && return
    [[ -z "$newFilepath"   || "$newFilepath"  == "" ]] && return

    if [[ ! -f "${filePath}" ]]; then
        return
    fi
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" || "${INSTALLER}" == "${DOCKER_TYPE}" ]]; then
        removeSoftLinkAndCreateDir "${newFilepath}" "${JF_USER}" "${JF_USER}" "yes"
    elif [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        removeSoftLinkAndCreateDir "${newFilepath}" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
    fi

    targetLink="${filePath}"
    #   Check if source is a link and read filePath
    if [[ -L "${filePath}" ]]; then
        targetLink=$(readlink -f "${filePath}")
        rm "${filePath}"
    fi

    cp -rfp "${targetLink}" "${newFilepath}/" || warn "Could not copy [${targetLink}] to [${newFilepath}/]"
    rm -f "${targetLink}" || warn "Could not remove [${targetLink}]"
}

startMigration () {
    bannerSection "STARTING MIGRATION"
}

endMigration () {
    bannerSection "MIGRATION COMPLETED SUCCESSFULLY"
}

initialize () {
    setAppDir
    _pauseExecution "setAppDir"
    initHelpers
    _pauseExecution "initHelpers"
    checkMigrationInfoYaml
    _pauseExecution "checkMigrationInfoYaml"
    getProduct
    _pauseExecution "getProduct"
    getDataDir
    _pauseExecution "getDataDir"
}

main () {
    case $PRODUCT in
        artifactory)
            migrateArtifactory
        ;;
        distribution)
            migrateDistribution
        ;;
        xray)
            migrationXray
        ;;
    esac
    exit 0
}

# Ensures meta data is logged
LOG_BEHAVIOR_ADD_META="$FLAG_Y"


# Check Distribution product version
checkDistributionVersion () {
    local minProductVersion="1.6.0"
    local maxProductVersion="2.0.0"
    local propertyInDocker="DISTRIBUTION_VERSION"
    local property="last-configuration-version"

    if [[ "${INSTALLER}" ==  "${COMPOSE_TYPE}" ]]; then
        local newfilePath="${APP_DIR}/../.env"
        local oldfilePath="${OLD_DATA_DIR}/distribution-installer/version.current"
    else
        local newfilePath="${NEW_DATA_DIR}/etc/distribution/versions.properties"
        local oldfilePath="${OLD_DATA_DIR}/etc/versions.properties"
    fi
    
    getProductVersion "${minProductVersion}" "${maxProductVersion}" "${newfilePath}" "${oldfilePath}" "${propertyInDocker}" "${property}"
}

readCustomDataDir () {
    # read custom data directory
    local setEnvFile="/opt/jfrog/distribution/scripts/setenv.sh"
    if [[ -f "${setEnvFile}" ]]; then
        source ${setEnvFile}
    fi
}

getCustomDataDir_hook () {
    readCustomDataDir
    if [[ -z "${DISTRIBUTION_DATA}" ]]; then
        retrieveYamlValue "migration.oldDataDir" "oldDataDir" "Fail"
        OLD_DATA_DIR="${YAML_VALUE}"
    else
        OLD_DATA_DIR="${DISTRIBUTION_DATA}"
    fi
}

distributionInfoMessage () {

    addText "# yamlFile was generated from distribution.local.config.yml and distributor.local.config.yml config files." "${SYSTEM_YAML_PATH}"
}

removeFileOperation () {
    local backupDir="$1"
    local file="$2"
    if [[ "$(checkFileExists "${file}")" == "true" ]]; then
        cp -pf "${file}" "${backupDir}" || logger "Failed to copy file [${file}] to ${backupDir}"
        rm -f "${file}" || warn "Failed to remove file [${file}]"
    fi
}

_createBackupOfLogBackDir () {
    local backupDir="$1"
    local distributionLogbackFile="${NEW_DATA_DIR}/etc/distribution/logback.xml"
    local distributorLogbackFile="${NEW_DATA_DIR}/etc/distributor/logback.xml"
    if [[ "${INSTALLER}" == "${COMPOSE_TYPE}" ]]; then
        removeSoftLinkAndCreateDir "${backupDir}/logbackXmlFile" "${JF_USER}" "${JF_USER}" "yes"
        removeSoftLinkAndCreateDir "${backupDir}/logbackXmlFile/distribution" "${JF_USER}" "${JF_USER}" "yes"
        removeSoftLinkAndCreateDir "${backupDir}/logbackXmlFile/distributor" "${JF_USER}" "${JF_USER}" "yes"
    elif [[ "${INSTALLER}" == "${DEB_TYPE}" || "${INSTALLER}" == "${RPM_TYPE}" ]]; then
        removeSoftLinkAndCreateDir "${backupDir}/logbackXmlFile" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${backupDir}/logbackXmlFile/distribution" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
        removeSoftLinkAndCreateDir "${backupDir}/logbackXmlFile/distributor" "${USER_TO_CHECK}" "${GROUP_TO_CHECK}" "yes"
    fi
    removeFileOperation "${backupDir}/logbackXmlFile/distribution" "${distributionLogbackFile}"
    removeFileOperation "${backupDir}/logbackXmlFile/distributor" "${distributorLogbackFile}"
}

backupFiles_hook () { 
    local backupDirectory="$1"
    _createBackupOfLogBackDir "${backupDirectory}"
}
moveConfigFiles() {
    _moveConfigFilesUnderOldDir "${NEW_DATA_DIR}/etc/distribution/distribution.local.config.yml" "${NEW_DATA_DIR}/etc/distribution/old"
    _moveConfigFilesUnderOldDir "${NEW_DATA_DIR}/etc/distributor/distributor.local.config.yml" "${NEW_DATA_DIR}/etc/distributor/old"
}

migrateDistribution () {
    creationMigrateLog
    _pauseExecution "creationMigrateLog"
    checkDistributionVersion
    _pauseExecution "checkDistributionVersion"
    startMigration
    _pauseExecution "startMigration"
    setSystemYamlPath
    _pauseExecution "setSystemYamlPath"
    createRequiredDirs
    _pauseExecution "createRequiredDirs"
    symlinkDirectories
    _pauseExecution "symlinkDirectories"
    copyDirectories
    _pauseExecution "copyDirectories"
    moveDirectories
    _pauseExecution "moveDirectories"
    moveConfigFiles
    _pauseExecution "moveConfigFiles"
    migrateYamlFile
    _pauseExecution "migrateYamlFile"
    updateSystemYamlFile
    _pauseExecution "updateSystemYamlFile"
    cleanUpOldDataDirectories
    _pauseExecution "cleanUpOldDataDirectories"
    cleanUpOldFiles
    _pauseExecution "cleanUpOldFiles"
    distributionInfoMessage
    _pauseExecution "distributionInfoMessage"
    endMigration
}

initialize
main
