mind () {
	d="/home/humanerror/Documentos/projects/mind-threads" 
	f="$d/$(date +'%y/%m/%d')" 
	clip="$d/clip" 
	p="$d/$(date +'%y/%m')" 
	m="$d/$(date +'%y/%m')" 
	y="$d/$(date +'%y')" 
	[ ! -d "$p" ] && mkdir -p "$p"
	{
		[ ! -f "$f" ] && {
			[ -z "$1" ] || [ "$1" = "-a" ]
		}
	} && {
		cp "$clip" "$f" && echo -e "\e\n[38;2;0;255;0mSuccessfully created\e[0m"
	}
	[ "$1" = "-a" ] && echo "$2 $3 '$4'" >> "$f"
	[ "$1" = "-d" ] && bash "$m/$2"
	[ "$1" = "-m" -a "$3" = "-d" ] && bash "$y/$2/$4"
	[ -z "$1" ] && bash "$f"
}
