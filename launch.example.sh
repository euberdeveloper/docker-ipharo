#!/bin/bash

arguments=(
    # Automatically generated with "generateLaunchSh.js"
	"LOG_LEVEL;None;Enum"
	"CONFIG;None;Unicode"
	"IP;None;Unicode"
	"PORT;None;Int"
	"PORT_RETRIES;None;Int"
	"SOCK;None;Unicode"
	"SOCK_MODE;None;Unicode"
	"TRANSPORT;None;CaselessStrEnum"
	"KEYFILE;None;Unicode"
	"CERTFILE;None;Unicode"
	"CLIENT_CA;None;Unicode"
	"NOTEBOOK_DIR;None;Unicode"
	"BROWSER;None;Unicode"
	"PYLAB;None;Unicode"
	"GATEWAY_URL;None;Unicode"
	"HELP_ALL;None;Boolean"
	"DEBUG;None;Boolean"
	"SHOW_CONFIG;None;Boolean"
	"SHOW_CONFIG_JSON;None;Boolean"
	"GENERATE_CONFIG;None;Boolean"
	"NO_BROWSER;None;Boolean"
	"PYLAB;None;Boolean"
	"NO_MATHJAX;None;Boolean"
	"ALLOW_ROOT;None;Boolean"
	"AUTORELOAD;None;Boolean"
	"SCRIPT;None;Boolean"
	"NO_SCRIPT;None;Boolean"
	"BROWSER;None;Boolean"
	"LOG_DATEFMT;Application;Unicode"
	"LOG_FORMAT;Application;Unicode"
	"LOG_LEVEL;Application;Enum"
	"SHOW_CONFIG;Application;Bool"
	"SHOW_CONFIG_JSON;Application;Bool"
	"ANSWER_YES;JupyterApp;Bool"
	"CONFIG_FILE;JupyterApp;Unicode"
	"CONFIG_FILE_NAME;JupyterApp;Unicode"
	"GENERATE_CONFIG;JupyterApp;Bool"
	"LOG_DATEFMT;JupyterApp;Unicode"
	"LOG_FORMAT;JupyterApp;Unicode"
	"LOG_LEVEL;JupyterApp;Enum"
	"SHOW_CONFIG;JupyterApp;Bool"
	"SHOW_CONFIG_JSON;JupyterApp;Bool"
	"ALLOW_CREDENTIALS;NotebookApp;Bool"
	"ALLOW_ORIGIN;NotebookApp;Unicode"
	"ALLOW_ORIGIN_PAT;NotebookApp;Unicode"
	"ALLOW_PASSWORD_CHANGE;NotebookApp;Bool"
	"ALLOW_REMOTE_ACCESS;NotebookApp;Bool"
	"ALLOW_ROOT;NotebookApp;Bool"
	"ANSWER_YES;NotebookApp;Bool"
	"AUTHENTICATE_PROMETHEUS;NotebookApp;Bool"
	"AUTORELOAD;NotebookApp;Bool"
	"BASE_PROJECT_URL;NotebookApp;Unicode"
	"BASE_URL;NotebookApp;Unicode"
	"BROWSER;NotebookApp;Unicode"
	"CERTFILE;NotebookApp;Unicode"
	"CLIENT_CA;NotebookApp;Unicode"
	"CONFIG_FILE;NotebookApp;Unicode"
	"CONFIG_FILE_NAME;NotebookApp;Unicode"
	"CONFIG_MANAGER_CLASS;NotebookApp;Type"
	"CONTENTS_MANAGER_CLASS;NotebookApp;TypeFromClasses"
	"COOKIE_SECRET;NotebookApp;Bytes"
	"COOKIE_SECRET_FILE;NotebookApp;Unicode"
	"CUSTOM_DISPLAY_URL;NotebookApp;Unicode"
	"DEFAULT_URL;NotebookApp;Unicode"
	"DISABLE_CHECK_XSRF;NotebookApp;Bool"
	"ENABLE_MATHJAX;NotebookApp;Bool"
	"FILE_TO_RUN;NotebookApp;Unicode"
	"GENERATE_CONFIG;NotebookApp;Bool"
	"IGNORE_MINIFIED_JS;NotebookApp;Bool"
	"IOPUB_DATA_RATE_LIMIT;NotebookApp;Float"
	"IOPUB_MSG_RATE_LIMIT;NotebookApp;Float"
	"IP;NotebookApp;Unicode"
	"KERNEL_MANAGER_CLASS;NotebookApp;Type"
	"KERNEL_SPEC_MANAGER_CLASS;NotebookApp;Type"
	"KEYFILE;NotebookApp;Unicode"
	"LOG_DATEFMT;NotebookApp;Unicode"
	"LOG_FORMAT;NotebookApp;Unicode"
	"LOG_JSON;NotebookApp;Bool"
	"LOG_LEVEL;NotebookApp;Enum"
	"LOGIN_HANDLER_CLASS;NotebookApp;Type"
	"LOGOUT_HANDLER_CLASS;NotebookApp;Type"
	"MATHJAX_CONFIG;NotebookApp;Unicode"
	"MATHJAX_URL;NotebookApp;Unicode"
	"MAX_BODY_SIZE;NotebookApp;Int"
	"MAX_BUFFER_SIZE;NotebookApp;Int"
	"MIN_OPEN_FILES_LIMIT;NotebookApp;Int"
	"NOTEBOOK_DIR;NotebookApp;Unicode"
	"OPEN_BROWSER;NotebookApp;Bool"
	"PASSWORD;NotebookApp;Unicode"
	"PASSWORD_REQUIRED;NotebookApp;Bool"
	"PORT;NotebookApp;Int"
	"PORT_RETRIES;NotebookApp;Int"
	"PYLAB;NotebookApp;Unicode"
	"QUIT_BUTTON;NotebookApp;Bool"
	"RATE_LIMIT_WINDOW;NotebookApp;Float"
	"RERAISE_SERVER_EXTENSION_FAILURES;NotebookApp;Bool"
	"SESSION_MANAGER_CLASS;NotebookApp;Type"
	"SHOW_CONFIG;NotebookApp;Bool"
	"SHOW_CONFIG_JSON;NotebookApp;Bool"
	"SHUTDOWN_NO_ACTIVITY_TIMEOUT;NotebookApp;Int"
	"SOCK;NotebookApp;Unicode"
	"SOCK_MODE;NotebookApp;Unicode"
	"TERMINALS_ENABLED;NotebookApp;Bool"
	"TOKEN;NotebookApp;Unicode"
	"TRUST_XHEADERS;NotebookApp;Bool"
	"USE_REDIRECT_FILE;NotebookApp;Bool"
	"WEBBROWSER_OPEN_NEW;NotebookApp;Int"
	"WEBSOCKET_COMPRESSION_OPTIONS;NotebookApp;Any"
	"WEBSOCKET_URL;NotebookApp;Unicode"
	"CONNECTION_FILE;ConnectionFileMixin;Unicode"
	"CONTROL_PORT;ConnectionFileMixin;Int"
	"HB_PORT;ConnectionFileMixin;Int"
	"IOPUB_PORT;ConnectionFileMixin;Int"
	"IP;ConnectionFileMixin;Unicode"
	"SHELL_PORT;ConnectionFileMixin;Int"
	"STDIN_PORT;ConnectionFileMixin;Int"
	"TRANSPORT;ConnectionFileMixin;CaselessStrEnum"
	"AUTORESTART;KernelManager;Bool"
	"CONNECTION_FILE;KernelManager;Unicode"
	"CONTROL_PORT;KernelManager;Int"
	"HB_PORT;KernelManager;Int"
	"IOPUB_PORT;KernelManager;Int"
	"IP;KernelManager;Unicode"
	"SHELL_PORT;KernelManager;Int"
	"SHUTDOWN_WAIT_TIME;KernelManager;Float"
	"STDIN_PORT;KernelManager;Int"
	"TRANSPORT;KernelManager;CaselessStrEnum"
	"BUFFER_THRESHOLD;Session;Int"
	"CHECK_PID;Session;Bool"
	"COPY_THRESHOLD;Session;Int"
	"DEBUG;Session;Bool"
	"DIGEST_HISTORY_SIZE;Session;Int"
	"ITEM_THRESHOLD;Session;Int"
	"KEY;Session;CBytes"
	"KEYFILE;Session;Unicode"
	"PACKER;Session;DottedObjectName"
	"SESSION;Session;CUnicode"
	"SIGNATURE_SCHEME;Session;Unicode"
	"UNPACKER;Session;DottedObjectName"
	"USERNAME;Session;Unicode"
	"DEFAULT_KERNEL_NAME;MultiKernelManager;Unicode"
	"KERNEL_MANAGER_CLASS;MultiKernelManager;DottedObjectName"
	"SHARED_CONTEXT;MultiKernelManager;Bool"
	"BUFFER_OFFLINE_MESSAGES;MappingKernelManager;Bool"
	"CULL_BUSY;MappingKernelManager;Bool"
	"CULL_CONNECTED;MappingKernelManager;Bool"
	"CULL_IDLE_TIMEOUT;MappingKernelManager;Int"
	"CULL_INTERVAL;MappingKernelManager;Int"
	"DEFAULT_KERNEL_NAME;MappingKernelManager;Unicode"
	"KERNEL_INFO_TIMEOUT;MappingKernelManager;Float"
	"KERNEL_MANAGER_CLASS;MappingKernelManager;DottedObjectName"
	"ROOT_DIR;MappingKernelManager;Unicode"
	"SHARED_CONTEXT;MappingKernelManager;Bool"
	"ENSURE_NATIVE_KERNEL;KernelSpecManager;Bool"
	"KERNEL_SPEC_CLASS;KernelSpecManager;Type"
	"ALLOW_HIDDEN;ContentsManager;Bool"
	"CHECKPOINTS;ContentsManager;Instance"
	"CHECKPOINTS_CLASS;ContentsManager;Type"
	"FILES_HANDLER_CLASS;ContentsManager;Type"
	"PRE_SAVE_HOOK;ContentsManager;Any"
	"ROOT_DIR;ContentsManager;Unicode"
	"UNTITLED_DIRECTORY;ContentsManager;Unicode"
	"UNTITLED_FILE;ContentsManager;Unicode"
	"UNTITLED_NOTEBOOK;ContentsManager;Unicode"
	"USE_ATOMIC_WRITING;FileManagerMixin;Bool"
	"ALLOW_HIDDEN;FileContentsManager;Bool"
	"CHECKPOINTS;FileContentsManager;Instance"
	"CHECKPOINTS_CLASS;FileContentsManager;Type"
	"DELETE_TO_TRASH;FileContentsManager;Bool"
	"FILES_HANDLER_CLASS;FileContentsManager;Type"
	"POST_SAVE_HOOK;FileContentsManager;Any"
	"PRE_SAVE_HOOK;FileContentsManager;Any"
	"ROOT_DIR;FileContentsManager;Unicode"
	"SAVE_SCRIPT;FileContentsManager;Bool"
	"UNTITLED_DIRECTORY;FileContentsManager;Unicode"
	"UNTITLED_FILE;FileContentsManager;Unicode"
	"UNTITLED_NOTEBOOK;FileContentsManager;Unicode"
	"USE_ATOMIC_WRITING;FileContentsManager;Bool"
	"ALGORITHM;NotebookNotary;Enum"
	"DATA_DIR;NotebookNotary;Unicode"
	"DB_FILE;NotebookNotary;Unicode"
	"SECRET;NotebookNotary;Bytes"
	"SECRET_FILE;NotebookNotary;Unicode"
	"STORE_FACTORY;NotebookNotary;Callable"
	"DEFAULT_KERNEL_NAME;AsyncMultiKernelManager;Unicode"
	"KERNEL_MANAGER_CLASS;AsyncMultiKernelManager;DottedObjectName"
	"SHARED_CONTEXT;AsyncMultiKernelManager;Bool"
	"BUFFER_OFFLINE_MESSAGES;AsyncMappingKernelManager;Bool"
	"CULL_BUSY;AsyncMappingKernelManager;Bool"
	"CULL_CONNECTED;AsyncMappingKernelManager;Bool"
	"CULL_IDLE_TIMEOUT;AsyncMappingKernelManager;Int"
	"CULL_INTERVAL;AsyncMappingKernelManager;Int"
	"DEFAULT_KERNEL_NAME;AsyncMappingKernelManager;Unicode"
	"KERNEL_INFO_TIMEOUT;AsyncMappingKernelManager;Float"
	"KERNEL_MANAGER_CLASS;AsyncMappingKernelManager;DottedObjectName"
	"ROOT_DIR;AsyncMappingKernelManager;Unicode"
	"SHARED_CONTEXT;AsyncMappingKernelManager;Bool"
	"BUFFER_OFFLINE_MESSAGES;GatewayKernelManager;Bool"
	"CULL_BUSY;GatewayKernelManager;Bool"
	"CULL_CONNECTED;GatewayKernelManager;Bool"
	"CULL_IDLE_TIMEOUT;GatewayKernelManager;Int"
	"CULL_INTERVAL;GatewayKernelManager;Int"
	"DEFAULT_KERNEL_NAME;GatewayKernelManager;Unicode"
	"KERNEL_INFO_TIMEOUT;GatewayKernelManager;Float"
	"KERNEL_MANAGER_CLASS;GatewayKernelManager;DottedObjectName"
	"ROOT_DIR;GatewayKernelManager;Unicode"
	"SHARED_CONTEXT;GatewayKernelManager;Bool"
	"ENSURE_NATIVE_KERNEL;GatewayKernelSpecManager;Bool"
	"KERNEL_SPEC_CLASS;GatewayKernelSpecManager;Type"
	"AUTH_TOKEN;GatewayClient;Unicode"
	"CA_CERTS;GatewayClient;Unicode"
	"CLIENT_CERT;GatewayClient;Unicode"
	"CLIENT_KEY;GatewayClient;Unicode"
	"CONNECT_TIMEOUT;GatewayClient;Float"
	"ENV_WHITELIST;GatewayClient;Unicode"
	"GATEWAY_RETRY_INTERVAL;GatewayClient;Float"
	"GATEWAY_RETRY_INTERVAL_MAX;GatewayClient;Float"
	"GATEWAY_RETRY_MAX;GatewayClient;Int"
	"HEADERS;GatewayClient;Unicode"
	"HTTP_PWD;GatewayClient;Unicode"
	"HTTP_USER;GatewayClient;Unicode"
	"KERNELS_ENDPOINT;GatewayClient;Unicode"
	"KERNELSPECS_ENDPOINT;GatewayClient;Unicode"
	"KERNELSPECS_RESOURCE_ENDPOINT;GatewayClient;Unicode"
	"REQUEST_TIMEOUT;GatewayClient;Float"
	"URL;GatewayClient;Unicode"
	"VALIDATE_CERT;GatewayClient;Bool"
	"WS_URL;GatewayClient;Unicode"
	"CULL_INACTIVE_TIMEOUT;TerminalManager;Int"
	"CULL_INTERVAL;TerminalManager;Int"
)

arg_name_from_name_and_scope() {
    if [ -z "$1" ]
    then
        echo "arg_name_from_name_and_scope - missing argument name"
    fi
    
    if [ -z "$2" ]
    then
        echo "arg_name_from_name_and_scope - missing argument scope"
    fi
    
    name=$1
    scope=$2
    
    name_lower=$(echo $name | tr '[:upper:]' '[:lower:]')
    
    if [ "$scope" = "None" ]
    then
        arg_name_from_name_and_scope_result=$(echo $name_lower | sed 's/_/-/g')
    else
        arg_name_from_name_and_scope_result="${scope}.${name_lower}"
    fi
}

var_name_from_name_and_scope() {
    if [ -z "$1" ]
    then
        echo "arg_name_from_name_and_scope - missing argument"
    fi
    
    if [ -z "$2" ]
    then
        echo "arg_name_from_name_and_scope - missing argument scope"
    fi
    
    name=$1
    scope=$2
    
    if [ "$scope" = "None" ]
    then
        var_name_from_name_and_scope_result="$name"
    else
        scope_snake_cased=$(echo $scope | sed 's/\([a-z0-9]\)\([A-Z]\)/\1_\L\2/g')
		scope_snake_cased_upper=$(echo $scope_snake_cased | tr '[:lower:]' '[:upper:]')
        var_name_from_name_and_scope_result="${scope_snake_cased_upper}_${name}"
	fi
}

arg_assignment_from_env_var() {
    if [ -z "$1" ]
    then
        echo "arg_assignment_from_env_var - missing argument name"
    fi
    
    if [ -z "$2" ]
    then
        echo "arg_assignment_from_env_var - missing argument scope"
    fi
    
    if [ -z "$3" ]
    then
        echo "arg_assignment_from_env_var - missing argument type"
    fi
    
    name=$1
    scope=$2
    type=$3
    
    var_name_from_name_and_scope $name $scope
    var_name=$var_name_from_name_and_scope_result
    env_value=${!var_name}
    
    if [ -z "$env_value" ]
    then
        arg_assignment_from_env_var_result=""
    else
        arg_name_from_name_and_scope $name $scope
        arg_name=$arg_name_from_name_and_scope_result
        if [ "$type" = "Boolean" ] && [ "$scope" = "None" ]
        then
            arg_assignment_from_env_var_result=" --$arg_name"
        else
            arg_assignment_from_env_var_result=" --$arg_name=$env_value"
        fi
    fi
}

command="jupyter notebook"
for raw_tuple in "${arguments[@]}"
do
    tuple=(${raw_tuple//;/ })
    arg_name=${tuple[0]}
    arg_scope=${tuple[1]}
    arg_type=${tuple[2]}
    
    arg_assignment_from_env_var $arg_name $arg_scope $arg_type
    command="${command}${arg_assignment_from_env_var_result}"
done

$command