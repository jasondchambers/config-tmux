## config-tmux

### Pre-requisites

Ensure TPM is installed as follows (this is handled automatically via the install.sh):

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### CLI 

In the [utils](https://github.com/jasondchambers/utils) repo, there are some handy CLI scripts to improve the experience using tmux:


| Command | Description |
| --------|------------ |
| $ tls | Shorthand for tmux ls        |
| $ tn \<session\> | Shorthand for tmux new -s \<session>             |
| $ ta | fzf powered wrapper for tmux a -t \<session>               |
| $ tk | fzf powered wrapper for tmux kill-session -t \<session>    |

### Keybindings

Leader key is C-b

| Key | Binding |
|-----|---------|
| **General** | |
| \<leader> r | reload conf |
| \<leader> [ | Enter copy mode, navigate with vim motions, v, then y to copy|
| \<leader> g | Launch GitHub in the browser|
| C-h,j,k,l | navigate panes (consistent with Neovim) |
| **Panes** | |
| \<leader> \| | new vertical pane |
| \<leader> - | new horizontal pane |
| \<leader> j,k,l,h | resize pane |
| \<leader> m | toggle maximize pane |
| \<leader> x | Kill pane |
| **Windows** | |
| \<Leader> c | created                  |
| \<Leader> w | see all panes/sessions |
| \<leader> x | Kill window |
| **Sessions** | |
| \<Leader> d | detach                   |
| \<Leader> s | switch                   |

### TODO

Continue building out config from https://www.youtube.com/watch?v=U-omALWIBos 

### Installation 

    ./install.sh

