#!/bin/sh

arguments=(
    "PORT;false"
    "KEYFILE;true"
    "CERTFILE;false"
    "CERT_CA;false"
    "NOTEBOOK_DIR;false"
    "ALLOW_CREDENTIALS;false"
    "ALLOW_ROOT;true"
    "ALLOW_ORIGIN;true"
    "NO_BROWSER;true"
    "IP;false"
    "ALLOW_ORIGIN_PAT;true"
    "ALLOW_PASSWORD_CHANGE;true"
    "ALLOW_REMOTE_ACCESS;true"
    "ANSWER_YES;true"
    "PASSWORD;false"
    "PASSWORD_REQUIRED;true"
    "TOKEN;false"
)


arg_name_from_env_name() {
    if [ -z "$1" ]
    then
        echo "arg_name_from_env_name - missing argument"
    fi
    
    env_name=$1
    env_name_lower=$(echo $env_name | tr '[:upper:]' '[:lower:]')
    env_name_with_dashes=$(echo $env_name_lower | sed 's/_/-/g')
    arg_name_from_env_name_result=$env_name_with_dashes
}

arg_assignment_from_env_var() {
    if [ -z "$1" ]
    then
        echo "arg_assignment_from_env_var - missing argument env_name"
    fi
    
    if [ -z "$2" ]
    then
        echo "arg_assignment_from_env_var - missing argument is_boolean"
    fi
    
    env_name=$1
    is_boolean=$2
    
    env_value=${!1}
    
    if [ -z "$env_value" ]
    then
        arg_assignment_from_env_var_result=""
    else
        arg_name_from_env_name $env_name
        if [ "$is_boolean" = true ]
        then
            arg_assignment_from_env_var_result=" --$arg_name_from_env_name_result"
        else
            arg_assignment_from_env_var_result=" --$arg_name_from_env_name_result=$env_value"
        fi
    fi
}

command="jupyter notebook"
for raw_tuple in "${arguments[@]}"
do
    tuple=(${raw_tuple//;/ })
    arg_name=${tuple[0]}
    arg_is_boolean=${tuple[1]}
    
    arg_assignment_from_env_var $arg_name $arg_is_boolean
    command="${command}${arg_assignment_from_env_var_result}"
done

$command