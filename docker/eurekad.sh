#!/bin/bash
SERVICE_NAME=EurekaDiscoveryService
PATH_TO_JAR=/DiscoveryServer-0.0.1-SNAPSHOT.war
PROCESSCNT=$(ps x | grep -v grep | grep -c "DiscoveryServer-0.0.1-SNAPSHOT.war")
PID=$(ps aux | grep "DiscoveryServer-0.0.1-SNAPSHOT.war" | grep -v grep | awk '{print $2}')
case $1 in
    start)
	if [ $PROCESSCNT == 0 ]; then
	    echo "Starting $SERVICE_NAME ..."
	    nohup java -jar $PATH_TO_JAR 2>> /dev/null >> /dev/null &
	    echo "$SERVICE_NAME started ..."
	else
	    echo "$SERVICE_NAME is already running ..."
	fi
    ;;
    stop)
        if [ $PROCESSCNT != 0 ]; then
            echo "$SERVICE_NAME stopping ..."
            kill $PID;
                        sleep 2s
            echo "$SERVICE_NAME stopped ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac

