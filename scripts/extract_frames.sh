#!/usr/bin/env bash
# Estrae FRAMES fotogrammi (larghezza 540 px) dai MAXV video piu' recenti in brand/uploads/recordings/.
# Output: brand/uploads/_frames/<nome>/frame_XX.jpg (cartella ignorata da git).
set -u
FRAMES=${FRAMES:-8}; MAXV=${MAXV:-5}
SRC=brand/uploads/recordings; OUT=brand/uploads/_frames
command -v ffmpeg >/dev/null || { echo "ffmpeg non disponibile, salto"; exit 0; }
rm -rf "$OUT"; mkdir -p "$OUT"
ls -t "$SRC"/*.mp4 "$SRC"/*.mov "$SRC"/*.webm 2>/dev/null | head -n "$MAXV" | while read -r v; do
  name=$(basename "${v%.*}"); mkdir -p "$OUT/$name"
  dur=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$v" 2>/dev/null | cut -d. -f1)
  dur=${dur:-0}; [ "$dur" -lt 1 ] && dur=1
  ffmpeg -v error -y -i "$v" -vf "fps=${FRAMES}/${dur},scale=540:-2" -frames:v "$FRAMES" -q:v 4 "$OUT/$name/frame_%02d.jpg"
  echo "$name: $(ls "$OUT/$name" | wc -l) fotogrammi"
done
exit 0
