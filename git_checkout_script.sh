repoPaths=( 
    "$HOME/work/web/" 
    "$HOME/work/libs/"
    "$HOME/work/api/"
    "$HOME/work/api-doc/"
    "$HOME/work/models/"
    "$HOME/work/admin/"
)


for path in ${repoPaths[@]}; do
    echo ${path}
    cd `echo $path | tr -d '\r'`
    git reset --hard
    git checkout $1
    # if branch exsit
    if [ $? == 0 ]; then
        git pull
    fi
done
