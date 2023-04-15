# zsh-cd-to-git
Change directory to a git repo with fzf

TODO: add demo

## Usage
```bash
cg ~/workspace/ # cd to a git repo in ~/workspace/
cg # cd to a git repo to $CD_TO_GIT_DEFAULT_DIR
```

## Install
Requirements:
- [fzf](https://github.com/junegunn/fzf)

### zinit
```bash
zinit ice wait lucid
zinit light ofirgall/zsh-cd-to-git
```

### Manual
Download and source `cdtogit.plugin.zsh`, add this to your zshrc:
```bash
if [[ ! -d ~/.zsh-cd-to-git ]]; then
  git clone https://github.com/ofirgall/zsh-cd-to-git ~/.zsh-cd-to-git
fi

source ~/.zsh-cd-to-git/cdtogit.plugin.zsh
```

## Config
```bash
CD_TO_GIT_DEFAULT_DIR=~/workspace/
```
