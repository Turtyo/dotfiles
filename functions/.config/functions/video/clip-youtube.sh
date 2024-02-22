#!/usr/bin/env bash
#Arguments: URL, Time stamp -5 seconds, length of clip, video file name

help()
{
	echo 'Usage : clip-youtube.sh [-h] [-d DURATION] [-o output_file] [-v] <"url"> <START> (END)'
	echo ""
	echo 'All CAPSLOCKED arguments are times'
	echo 'Start should be at least 5 seconds before the part you are interested in'
	echo 'All time formats should be hh:mm:ss.ff with ff for frames'
	echo 'You can ommit the biggest part of the format if it is not needed, as well as frames if not needed'
	echo 'For example, if the time is 00:12:32.00, you could give 12:32'
	echo ""
	echo 'Options :'
	echo '-h : Print this help and exit'
	echo '-d : duration, should not be used as the same time as END, if no duration or END is given, END will be the length of the video'
	echo '-o : output_file, default is output.mp4'
	echo '-v : be more verbose'
}

calculate_duration()
{
	echo $(date -u -d @$(($(date -d "$2" '+%s') - $(date -d "$1" '+%s'))) '+%T') # with value2 > value1
}

duration=0
output_file='output.mp4'
bool_calculate_duration=true
verbose=false

while getopts ':hd:o:v' option; do
	case "$option" in
		h) # help
			help
			exit;;
		d) # duration
			duration=${OPTARG}
			bool_calculate_duration=false;;
		o) # output
			output_file=${OPTARG};;
		v) # verbose
			verbose=true;;
		?) # wrong arguments
			echo "Wrong arguments, you may want to use -h to see the help"
			exit 1;;
	esac
done			

shift $((OPTIND-1))

url=$1
start_time=$2
end_time="${3:-$(yt-dlp --get-duration "$url")}"

if [ $bool_calculate_duration == true ]
	then
	duration=$(calculate_duration $start_time $end_time)
	bool_calculate_duration=false
fi

if [ $verbose == true ]
	then
	echo "Verbose increased, printing values"
	echo "start time : $start_time"
	echo "end_time : $end_time"
	echo "duration : $duration"
	echo "output file : $output_file"
	echo "url : $url"
fi 

readarray -t urls <<< "$(yt-dlp --youtube-skip-dash-manifest -g "$url")"
ffmpeg -ss $start_time -i "${urls[0]}" -ss $start_time -i "${urls[1]}" -ss 5 -map 0:v -map 1:a -c:v libx264 -c:a aac -t "$duration" "$output_file"
