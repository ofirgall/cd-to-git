relative_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function cg() {
    cd $($relative_dir/src/cd_to_git.sh $@)
}
