#!/bin/sh
if [ $# -ne 1 ]
then
  echo "Usage: $0 deploy"
  echo "Usage: $0 destroy"
  echo "Usage: $0 test"
  exit
fi

case "$1" in
  deploy) echo "Powering ON: app1"
      cd ./infrastructure/app1/ && vagrant up
      echo "Powering ON: app2"
      cd ../app2/ && vagrant up
      echo "Powering ON: web"
      cd ../web/ && vagrant up && cd ../..
      ;;

  destroy) echo "Powering Down: app1"
        cd ./infrastructure/app1/ && vagrant destroy
        echo "Powering Down: app2"
        cd ../app2/ && vagrant destroy
        echo "Powering Down: web"
        cd ../web/ && vagrant destroy && cd ../..
        ;;

  test) i=1
        while [ $i -le 4 ]
        do
          echo "Testing: Iteration $i " 
          curl http://localhost:8080
          echo "\n"
          i=$((i+1))
        done
        ;;

  *) echo "Unknown parameter. Try: deploy, destory, test"
     ;;
esac
