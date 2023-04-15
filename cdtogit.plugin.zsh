relative_dir=${0:a:h}

function cg() {
    cd $(relative_dir/cd_to_git.sh $@)
}
