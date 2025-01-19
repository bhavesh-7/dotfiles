#! bash oh-my-bash.module
#
# One line prompt showing the following configurable information
# for git:
# time (virtual_env) username@hostname pwd git_char|git_branch git_dirty_status|→
#
# The → arrow shows the exit status of the last command:
# - bold green: 0 exit status
# - bold red: non-zero exit status
#
# Example outside git repo:
# 07:45:05 user@host ~ →
#
# Example inside clean git repo:
# 07:45:05 user@host .oh-my-bash ±|master|→
#
# Example inside dirty git repo:
# 07:45:05 user@host .oh-my-bash ±|master ✗|→
#
# Example with virtual environment:
# 07:45:05 (venv) user@host ~ →
#

TEAL="\033[1;36m"   # Bold Teal
GRAY="\033[1;37m"   # Bold Gray
RESET="\033[0m"     # Reset color

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_brown}✗"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=" ${_omb_prompt_green}|"
SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_green}|"
SCM_GIT_SHOW_MINIMAL_INFO=true
SCM_DOCKER_SHOW_MINIMAL_INFO=true

CLOCK_THEME_PROMPT_PREFIX=''
CLOCK_THEME_PROMPT_SUFFIX=' '
THEME_SHOW_CLOCK=${THEME_SHOW_CLOCK:-"true"}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$_omb_prompt_bold_teal"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"\uf017 %H:%M"}

OMB_PROMPT_VIRTUALENV_FORMAT='(%s) '
OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:=true}

function greetings(){
  # Get system information
  HOSTNAME=$(hostname)
  OS=$(cat /etc/os-release | grep '^NAME=' | cut -d '=' -f 2 | tr -d '"')
  KERNEL=$(uname -r | cut -d '-' -f 1)
  CPU=$(lscpu | grep 'Model name' | awk -F ': ' '{print $2}' | xargs)

  # Get memory information
  MEMORY_TOTAL=$(free -h | grep 'Mem:' | awk '{print $2}')
  MEMORY_USED=$(free -h | grep 'Mem:' | awk '{print $3}')
  MEMORY_FREE=$(free -h | grep 'Mem:' | awk '{print $4}')
  MEMORY_AVAILABLE=$(free -h | grep 'Mem:' | awk '{print $7}')

  # Calculate remaining memory (used - total)
  MEMORY_REMAINING=$(free -h | awk '/Mem:/ {print $2 - $3}')

  UPTIME=$(uptime -p | sed 's/up //')  # Using uptime command directly
  SHELL=$(basename "$SHELL")            # Extract the shell name

  # Greeting in Figlet with color
  NAME_GREET="$(figlet -f slant "Hey $(whoami)!")"
  printf "${TEAL}${NAME_GREET}\n\n"

  # Print system information in two lines
  printf "${TEAL}Hostname: ${RESET}${GRAY}${HOSTNAME} ${TEAL}OS: ${RESET}${GRAY}${OS} ${TEAL}Shell: ${RESET}${GRAY}${SHELL} ${TEAL}Uptime: ${RESET}${GRAY}${UPTIME}\n"
  printf "${TEAL}CPU: ${RESET}${GRAY}${CPU} ${TEAL}Kernel: ${RESET}${GRAY}${KERNEL} ${TEAL}Memory: ${RESET}${GRAY}${MEMORY_USED}/${MEMORY_TOTAL}\n"
}
function _omb_theme_PROMPT_COMMAND() {
  # This needs to be first to save last command return code
  local RC="$?"

  local hostname="${_omb_prompt_bold_teal}\u@\h"
  local fedoraIcon="${_omb_prompt_bold_teal} ${_omb_prompt_bold_gray}"
  local java_icon="${_omb_prompt_bold_teal}☕"
  local python_venv; _omb_prompt_get_python_venv
  local ifHome="$(if [[ $PWD == $HOME ]]; then echo "home"; else basename "\W"; fi)"
  python_venv=$_omb_prompt_white$python_venv

  # Set return status color
  if [[ ${RC} == 0 ]]; then
      ret_status="${_omb_prompt_bold_gray}"
  else
      ret_status="${_omb_prompt_bold_brown}"
  fi

  # Java version for Gradle project
  local java_version=""
  if [[ -f "gradle/wrapper/gradle-wrapper.properties" ]] || [[ -n $(ls *.java 2>/dev/null) ]]; then
    java_version="via ${java_icon} v$(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}') "
  fi

  # Append new history lines to history file
  history -a
  if [[ -n "$PROMPT_COMMAND_ALREADY_RUN" ]]; then
    PS1="\n${fedoraIcon} >> ${hostname} ${_omb_prompt_bold_gray}>> $(clock_prompt)${_omb_prompt_bold_gray}>> [${_omb_prompt_bold_teal}\W${_omb_prompt_bold_gray}] ${java_version}${_omb_prompt_bold_green}$(scm_prompt_char_info)\n${ret_status}→ ${_omb_prompt_normal}"
  else
    PS1="${fedoraIcon} >> ${hostname} ${_omb_prompt_bold_gray}>> $(clock_prompt)${_omb_prompt_bold_gray}>> [${_omb_prompt_bold_teal}\W${_omb_prompt_bold_gray}] ${java_version}${_omb_prompt_bold_green}$(scm_prompt_char_info)\n${ret_status}→ ${_omb_prompt_normal}"
  fi

  export PROMPT_COMMAND_ALREADY_RUN=true

}
#greetings
_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
