#!/bin/bash

if ls $HOME/EPNro1/entrada/*.txt ;then
	cat $HOME/EPNro1/entrada/*.txt >> $HOME/EPNro1/salida/$filename.txt
	mv $HOME/EPNro1/entrada/*.txt $HOME/EPNro1/procesado/
	echo $separador
fi
