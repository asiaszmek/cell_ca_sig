#!/bin/bash
python mesh.py $1
if [ -f cell_* ] 
then 
	mv cell_* cell
fi
if [ -f shell_* ] 
then
	mv shell_* shell
fi

smoldyn prototype.txt
