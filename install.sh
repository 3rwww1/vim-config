#!/bin/en sh
set -e

COLOR_RESET="\e[00m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"
COLOR_BLUE="\e[34m"
BOLD="\e[1m"
DONE="${BOLD}${COLOR_GREEN}✓${COLOR_RESET}"
FAIL="${BOLD}${COLOR_RED}✗${COLOR_RESET}"
WORK="${BOLD}${COLOR_BLUE}⥁${COLOR_RESET}"

MY_VIM_INSTALL_DIR=${MY_ZSH_INSTALL_DIR:-"${HOME}/Code/tools/"}
MY_VIM="${MY_VIM_INSTALL_DIR}/vim-config"

echo "${BOLD}Welcome back, Erwan !${COLOR_RESET}"
echo "${BOLD}Have you been a good boy and installed the correct dependencies ;) ?${COLOR_RESET}"

which vim > /dev/null
if [ "$?" != "0" ]
then
  echo "${FAIL} You need vim installed to continue, sucker!"
  exit 1
else
  echo "${DONE} vim is installed! Maybe there's hope for you after all!"
fi

if [ ! -d "${MY_ZSH_INSTALL_DIR}" ]
then
  echo "${WORK} Creating the installation directory"
  mkdir -p ${MY_ZSH_INSTALL_DIR}
  git clone https://github.com/3rwww1/vim-config
else
  echo "${WORK} Pulling latest configuration..."
  pushd ${MY_VIM}
    git checkout master
    git pull
  popd
fi

pushd ${MY_VIM}/zsh-config
  mkdir -p ${HOME}/.vim
  rm ${HOME}/.vim/vimrc
  ln -sf vimrc ${HOME}/vim/.vimrc
  vim +PluginInstall +qall
popd

echo "${DONE} You're all set! Come back to me if you need anything ;)"

