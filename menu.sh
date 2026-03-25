#!/bin/bash
echo "Bienvenido al menu selecciona una opcion "
separador="____________________________________"
opcion=0
filename="FILENAME"
export filename
export separador

until [ $opcion -eq 6 ]

do
echo " "
echo "------MENU------"
echo " "
echo "Escriba 1 para crear entorno"
echo " "
echo "Escriba 2 para procesar los archivos"
echo " "
echo "Escriba 3 para ordenar los alumnos por padron de menor a mayor"
echo ""
echo "Escriba 4 para mostrar las 10 mejores notas "
echo " "
echo "Escriba 5 para buscar un alumno por numero de padron"
echo ""
echo "Escriba 6 para cerrar"
echo " "
echo "Elija una opcion"
echo $separador
read opcion

	case $opcion in 
	
	1)mkdir -p $HOME/EPNro1/entrada
      mkdir -p $HOME/EPNro1/salida
      mkdir -p $HOME/EPNro1/procesado
	  echo " "
	  echo "-----Entorno creado"
	  mv $HOME/consolidar.sh $HOME/EPNro1/
	  echo $separador
	  ;;
	2)
	  bash $HOME/EPNro1/consolidar.sh &
	  echo "-----Procesando archivos"
	  echo $separador
	  ;;
	3)if ls $HOME/EPNro1/salida/$filename.txt; then
		echo $separador
		echo "-----Alumnos ordenados por padron: "
		sort -n $HOME/EPNro1/salida/$filename.txt|column -t
	  else
		echo "-----No hay archivos para ordenar"
	  fi
	  ;;
	4)if ls $HOME/EPNro1/salida/$filename.txt; then
		echo $separador
		echo "-----Los alumnos con mejores notas son: "
		sort -n -r -k 5,5 $HOME/EPNro1/salida/$filename.txt |head -n 10|column -t
	  else 
		echo "-----No hay archivos para ordenar"
	  fi
	  ;;
	5)if ls $HOME/EPNro1/salida/$filename.txt; then
		echo $separador
		echo "-----Ingrese el padron del alumno que desea buscar"
		read padron_del_alumno
		echo " "
		grep -w $padron_del_alumno $HOME/EPNro1/salida/$filename.txt|column -t
	  else 
		echo "-----No se encontro un archivo para buscar"
	  fi
	  ;;
	6)echo "-----Cerrando menu" 
	  ;;
	
	*)echo "-----Opcion no valida"
	  ;;

	esac

done
