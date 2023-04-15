# cd-to-git
Change directory to a git repo with fzf

https://user-images.githubusercontent.com/4954051/232235250-63ea5a64-c910-4b8d-91a5-ec90941ae11f.mp4

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
zinit light ofirgall/cd-to-git
```

### Manual
Download and source `cdtogit.plugin.zsh`, add this to your zshrc:
```bash
if [[ ! -d ~/.cd-to-git ]]; then
  git clone https://github.com/ofirgall/cd-to-git ~/.cd-to-git
fi

# zsh
source ~/.cd-to-git/cdtogit.plugin.zsh

# bash
source ~/.cd-to-git/cdtogit.plugin.bash
```

## Config
```bash
export CD_TO_GIT_DEFAULT_DIR=~/workspace/
```
