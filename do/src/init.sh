
function _do_init() {
  local repo="${DO_INSTALL_REPO}"
  local ver="${DO_VERSION}"

  if [ -z "${ver}" ]; then
    ver=$(curl --silent "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "v\K.*?(?=")')
  fi

  [ -d ".oh-my-ops" ] || {
    echo "Download op-my-ops ${ver} release."
    wget "https://github.com/${repo}/archive/v${ver}.zip" &&
    unzip "v${ver}.zip" &> /dev/null &&
    mv "oh-my-ops-${ver}" .oh-my-ops &> /dev/null &&
    rm "v${ver}.zip" &> /dev/null
  } || {
    echo "Cannot download oh-my-ops runtime."
    return 1
  }
}

function do-update() {
  _do_dir_push "$DO_HOME/.."
  {
    {
      [ ! -d ".oh-my-ops" ] || {
        echo "Remove old .oh-my-ops runtime."
        rm -rfd .oh-my-ops &> /dev/null
      }
    } &&
    _do_print_warn "Please exit and run source activate.sh again."
  } || {
    _do_print_error "Fail to upgrade."
  }
  _do_dir_pop
}

_do_init &&
source .oh-my-ops/activate.sh $@

