
languages=`echo "golang typescript php nodejs javascript"  | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk grep curl ssh scp" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
	_query = $query | tr ' ' '+'
	tmux neww bash -c "curl cht.sh/$selected/$_query & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected~$query/ & while [ : ]; do sleep 1; done"
fi
