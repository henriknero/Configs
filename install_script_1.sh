#! /bin/bash

asdf="apt-get install"
cat manual_installs | while read line 
do 
	
	echo "Y" | apt-get install $line
done 
