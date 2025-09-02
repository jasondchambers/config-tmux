#!/usr/bin/env sh

point_tmux_to_this_config() {
  config_file=$1
  echo "Pointing tmux to this config"
  if [ -L ~/.tmux.conf ]; then
    echo "tmux config already set - verifying it points to this config"
    local actual_resolved_path
    actual_resolved_path=$(readlink -f ~/.tmux.conf)
    if [ "$actual_resolved_path" = "$(pwd)/${config_file}" ]; then
      echo "tmux is already pointing to this config"
    else
      echo "tmux is pointing to another config: ${actual_resolved_path}"
      exit 1
    fi
  else
    if [ -f ~/.tmux.conf ]; then
      echo "tmux config already exists - moving it to backup"
      mv ~/.tmux.conf{,.bak}
    fi
    echo "Linking tmux to this config"
    ln -s $(pwd)/${config_file} ~/.tmux.conf
  fi
}

clone_tpm_if_necessary() {
  if [ -d ~/.tmux/plugins/tpm ]; then
    echo "Skipping clone of https://github.com/tmux-plugins/tpm"
  else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
}

main() {

  if [ -e tmux.conf ]; then
    clone_tpm_if_necessary
    point_tmux_to_this_config tmux.conf
  else
    echo "You need to run this script from within the config-tmux directory"
  fi
}

main
