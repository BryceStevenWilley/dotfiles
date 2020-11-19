if [ "true" = "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ];
then
    echo -en "\033]0;$(git rev-parse --abbrev-ref HEAD)\a"
else
    echo -en "\033]0;$(basename $PWD)\a";
fi 
