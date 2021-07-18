#! /bin/bash

TTY=/dev/ttygrbl
NOHUP=nohup_start_sim.out
EXE=/home/pi/pilase/grbl-pilase

# Switch to script directory
cd "$(dirname "$0")"

# Kill any already-running instances
sudo killall --quiet --signal SIGTERM grbl-pilase socat

# Start grbl-pilase, piping io through TTY, running in background with nohup
sudo nohup socat -d -d -d PTY,raw,link=$TTY,perm=0777,echo=0 "EXEC:'$EXE -n -s step.out -b block.out',pty,raw,echo=0,perm=0777" > $NOHUP 2>&1 &

# Wait for process to start, ports to open
sleep 0.1

# Report results
if [ "$(ps -a | grep grbl-pilase)" ] ; then
	echo "GrblHAL (pilase) started successfully"
	echo "Nohup socat output available at $NOHUP"
	echo "Access grbl-pilase TTY at $TTY"
else
	echo "GrblHAL (pilase) failed to start"
	echo "This is what happens when I tried:"
	$EXE
fi




