while true; do 
 ssh -p 443 -R0:localhost:9001 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 -t qB7BJamSnPS+force+qr@pro.pinggy.io x:https ; 
sleep 10; done