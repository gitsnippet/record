
    usage(){
        echo "usage for push to github  a:f:mh  or account:,file:,messages:,help \n"
    }

    OPTS=`getopt -o a:f:m:h  --long account:,file:,messages:,help   -- "$@"`
    if [ $? != 0 ] ; then 
         usage >&2 
         exit 1 
    fi
    echo "$OPTS"
    eval set -- "$OPTS"

 
while true; do
  case "$1" in
    -a | --account ) 
        user=$2
        echo $user
        shift 2;;
    -f | --file )   
        file=$2
        shift 2;;
    -m | --messages ) 
        info=$2
        shift 2;;
    -h| --help)
        echo "upload only html and js practice file into my github"
        echo "set ssh login for github, create new repo 'htmlcssjs' for all accounts"
        echo " push  a:f:m:h ,accounts : gitsnippet and hwypengsir "
        shift;;
    -- ) 
        echo "end of it 1"
        shift;; 

    *)
        echo "end of it 2"
        echo $OPTIND
        echo $1
        break;;
  esac
done
upload(){
rm -rf .git
git init
git add  $1/
git remote rm origin
git remote add origin https://$2@github.com/$2/htmlcssjs.git 
git commit -m  $3
git push -u origin master
}

upload $file $user $info

