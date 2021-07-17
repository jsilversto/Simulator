#! /bin/bash

TTY=/dev/ttygrbl
NOHUP=nohup_start_sim.out

# Switch to script directory
cd "$(dirname "$0")"

# Kill any already-running instances
sudo killall --quiet --signal SIGTERM grbl-pilase socat

# Start grbl-pilase, piping io through TTY, running in background with nohup
sudo nohup socat -d -d -d PTY,raw,link=$TTY,perm=0777,echo=0 "EXEC:'./grbl-pilase -n -s step.out -b block.out',pty,raw,echo=0,perm=0777" > $NOHUP 2>&1 &

# Report results
echo "GrblHAL (pilase) started successfully"
echo "Nohup socat output available at $NOHUP"
echo "Access grbl-pilase TTY at $TTY"


