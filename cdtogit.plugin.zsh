relative_dir=${0:a:h}

function cg() {
    cd $($relative_dir/src/cd_to_git.sh $@)
}
