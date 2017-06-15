#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

while true; do
  [[ -t 0 ]] && { read -t 10 -n 2 -p $'\e[1;32mInstall athame? [y/n]\e[0m\n' resp || resp="y" ; }
  response=`echo $resp | sed -r 's/(.*)$/\1=/'`

  if [[ $response =~ ^(y|Y)=$ ]]
  then

    # compile athame from sources
    cd $APP_PATH/../../submodules/athame

    ./readline_athame_setup.sh
    ./readline_athame_setup.sh --libdir=/lib/x86_64-linux-gnu
    ./bash_readline_setup.sh

    while true; do
      [[ -t 0 ]] && { read -t 10 -n 2 -p $'\e[1;32mUse athame by default? [y/n]\e[0m\n' resp || resp="n" ; }
      response=`echo $resp | sed -r 's/(.*)$/\1=/'`

      if [[ $response =~ ^(y|Y)=$ ]]
      then

        # put $USE_ATHAME into bashrc
        num=`cat ~/.bashrc | grep "USE_ATHAME" | wc -l`
        if [ "$num" -lt "1" ]; then

            echo "
# want to use athame?
export USE_ATHAME=true" >> ~/.bashrc

        fi

        break

      elif [[ $response =~ ^(n|N)=$ ]]
      then

        # put $USE_ATHAME into bashrc
        num=`cat ~/.bashrc | grep "USE_ATHAME" | wc -l`
        if [ "$num" -lt "1" ]; then

          echo "
# want to use athame?
export USE_ATHAME=false" >> ~/.bashrc

        fi
        break

      else
        echo " What? \"$resp\" is not a correct answer. Try y+Enter."
      fi

    done

    # put $ATHAME_SHOW_MODE into bashrc
    num=`cat ~/.bashrc | grep "ATHAME_SHOW_MODE" | wc -l`
    if [ "$num" -lt "1" ]; then

      echo "
# should athame show vim mode sign?
export ATHAME_SHOW_MODE=0" >> ~/.bashrc

    fi

    break
  elif [[ $response =~ ^(n|N)=$ ]]
  then
    break
  else
    echo " What? \"$resp\" is not a correct answer. Try y+Enter."
  fi

done
