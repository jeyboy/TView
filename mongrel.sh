#!/bin/sh
# description: rails 3 
# processname:  ROR

start(){
cd /home/tview/ && RUBYOPT="" &>/dev/null 2>&1
cd /home/tview/ && rails s -d -p 80 &>/dev/null 2>&1
}

stop(){
echo "WTF"
}
restart(){
echo "nah"
}
case "$1" in
        start)
        start 
                ;;
        stop)
        stop        
		;;
        restart)
            restart    
                ;;
        *)
	start
	exit 64
                ;;

esac
