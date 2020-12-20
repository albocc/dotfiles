#!/bin/bash

function escHtml() {
	sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g' <<< "$@"
}

METADATA=$(playerctl -p spotify metadata)

STATUS=$(playerctl -p spotify status | sed 's/Playing/▶️/; s/Paused/⏸️/')
ARTIST=$(escHtml $(awk '/:artist/ {$1=$2=""; print substr($0,3)}' <<< $METADATA))
TITLE=$(escHtml $(awk '/:title/ {$1=$2=""; print substr($0,3)}' <<< $METADATA))
ALBUM=$(escHtml $(awk '/:album / {$1=$2=""; print substr($0,3)}' <<< $METADATA))
DISC=$(awk '/:discNumber/ {$1=$2=""; print substr($0,3)}' <<< $METADATA)
TRACK=$(awk '/:trackNumber/ {$1=$2=""; print substr($0,3)}' <<< $METADATA)
LENGTH=$(date -d "00:00:00 $(awk '/:length/ {$1=$2=""; print substr($0,3)}' <<< $METADATA | paste - <(echo '/1000000') | bc -l) sec" '+%T' | sed 's/00://')

STATUS_TEXT="\"$STATUS  $ARTIST - $TITLE - $ALBUM\""
TOOLTIP_TEXT="\"Artist:\t$ARTIST\nTitle:\t$TITLE\nAlbum:\t$ALBUM\nLength:\t$LENGTH\nTrack:\t$TRACK\nDisc-No.:\t$DISC\""

echo "{\"text\": $STATUS_TEXT, \"tooltip\": $TOOLTIP_TEXT}"

