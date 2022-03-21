#!/bin/bash

arguments=(
    {{ARGUMENTS}}
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