#!/usr/bin/env bash
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

RED="1;31m"
GREEN="0;32m"
CYAN="0;36m"
YELLOW="1;33m"
DARK_GREY="1;30m"

colorStart() {
	echo -e -n "\033[$1"
}

colorEnd() {
	echo -e -n "\033[0m"
}

colorEcho() {
	colorStart $1
	echo $2
	colorEnd
}

echoDashedLine() {
	[[ -z $1 ]] && COLOUR=${YELLOW} || COLOUR=$1
	colorEcho ${COLOUR} "-------------------------------"
}

script_dir=$(dirname $0)

colorEcho  ${GREEN} "-- cheking if virtual environment exists --"
if [[ ! -d ${script_dir}/.venv ]]; then
	python3 -m venv ${script_dir}/.venv
fi

colorEcho  ${GREEN} "-- activate virtual environment --"
source ${script_dir}/.venv/bin/activate
colorEcho  ${GREEN} "-- update pip in virtual environment --"
pip install -U pip

colorEcho  ${GREEN} "-- install dependencies in virtual environment --"
if [[ -f ${script_dir}/requirements.txt ]] ; then
	colorEcho  ${GREEN} "-- Checking if dependencies have changed --"
	sha512sum -c ${script_dir}/requirements.sha512sum
	if [[ $? -ne 0 ]] ; then
		colorEcho  ${GREEN} "-- Dependencies changed, installing... --"
		pip install -r ${script_dir}/requirements.txt
		sha512sum ${script_dir}/requirements.txt > requirements.sha512sum
	fi
fi

colorEcho  ${GREEN} "-- Running yamllint --"
yamllint ${script_dir}
if [[ $? -ne 0 ]] ; then
	colorStart ${RED}
	read -n 1 -p "Yaml lint failed, still want to continue? [Y/y/anyCharacterToExit] : " YL_ANSWER
	echo ""
	if [[ "x${YL_ANSWER,,}" = "xy" ]] ; then
		echo "Continuing anyway ...."
	else
		exit 10
	fi
	colorEnd
fi

colorEcho  ${GREEN} "-- Running ansible-lint --"
ansible-lint ${script_dir}/local-setup/post_install.yml
if [[ $? -ne 0 ]] ; then
	colorStart ${RED}
	read -n 1 -p "ansible lint failed, still want to continue? [Y/y/anyCharacterToExit] : " AL_ANSWER
	echo ""
	if [[ "x${AL_ANSWER,,}" = "xy" ]] ; then
		echo "Continuing anyway ...."
	else
		exit 10
	fi
	colorEnd
fi

colorEcho  ${GREEN} "-- deactivate virtual environment --"
deactivate


colorEcho  ${GREEN} "Looks like everything is ok...."
read -n 1 -p "run the local-setup/post_install.yml ? [Y/y/anyCharacterToExit] : " ANSWER
echo ""
if [[ "x${ANSWER,,}" = "xy" ]] ; then
	ansible-playbook -K local-setup/post_install.yml
fi
