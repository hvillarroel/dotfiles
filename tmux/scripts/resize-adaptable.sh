lflag=
pflag=
tflag=
while getopts l:p:t: name;
do
    case $name in
    l)    lflag=1
      layout_name=$OPTARG;;
    p)    pflag=1
          percentage="$OPTARG";;
    t)    tflag=1
          target="$OPTARG";;
    ?)   printf "Usage: %s: [-l layout-name] [-p percentage] [-t target-window]\n" $0
          exit 2;;
    esac
done

if [ ! -z "$pflag" ]; then
    if ! [ "$percentage" -eq "$percentage" ] 2> /dev/null; then
        printf "Percentage (-p) must be an integer" >&2
        exit 1
    fi
fi
if [ ! -z "$lflag" ]; then
    if [ $layout_name != 'main-horizontal' ] && [ $layout_name != 'main-vertical' ] ; then
        printf "layout name must be main-horizontal or main-vertical" >&2
        exit 1
    fi
fi

if [ "$layout_name" = "main-vertical" ]; then
    MAIN_PANE_SIZE=$(expr $(tmux display -p '#{window_width}') \* $percentage \/ 100)
    MAIN_SIZE_OPTION='main-pane-width'

fi

if [ "$layout_name" = "main-horizontal" ]; then
    MAIN_PANE_SIZE=$(expr $(tmux display -p '#{window_height}') \* $percentage \/ 100)
    MAIN_SIZE_OPTION='main-pane-height'
fi

if [ ! -z "$target" ]; then
    tmux setw -t $target $MAIN_SIZE_OPTION $MAIN_PANE_SIZE; tmux select-layout -t $target $layout_name
else
    tmux setw $MAIN_SIZE_OPTION $MAIN_PANE_SIZE; tmux select-layout $layout_name
fi

exit 0

