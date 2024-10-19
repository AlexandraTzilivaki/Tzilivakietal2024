#!/bin/bash

for a in $(seq 1 15);do

		
 	export LPARAMS=" -c runs=${a}"  
 ./x86_64/special -nogui  $LPARAMS run.hoc &
	


done

