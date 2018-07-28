# !/bin/bash

while true; do
	for f in /home/felipe/Imagens/*; do
		feh -z --bg-scale --no-fehbg "$f"
		sleep 60
	done
done
