#rsync -uav --progress --remove-source-files --rsh='ssh -o NoneSwitch=yes -o NoneEnabled=yes' --port=2200 earnest@vilje.hpc.ntnu.no:/work/earnest/UPData/input .

rsync -uav --progress  --rsh='ssh  ' --port=2200 earnest@login.norstore.uio.no:/projects/NS9207K/earnest/Analysis/Prognostic-Potential-Predictability/* .

rsync -uav --progress  --rsh='ssh  ' --port=2200 * earnest@login.norstore.uio.no:/projects/NS9207K/earnest/Analysis/Prognostic-Potential-Predictability/

#rsync -uav --progress  --rsh='ssh  ' --port=2200 earnest@hexagon.bccs.uib.no:/work/earnest/archive/archive_FF00_temp .

