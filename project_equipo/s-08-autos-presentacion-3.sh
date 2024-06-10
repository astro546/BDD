#!/bin/bash 
#@author: Ricardo Vega
#@date: 1-06-2024
#@Description: Script to copy binary files 

#Si encuentra directorio, extre contenido del zip 
echo "Imagenes autos"
if [ ! -d "/tmp/bdd/proyecto-final/imagenes/autos" ]; then 
    echo "Copiando zip de autos"
    mkdir -p /tmp/bdd/proyecto-final/imagenes/autos
    chmod 755 /tmp/bdd/proyecto-final
    chmod 755 /tmp/bdd/proyecto-final/imagenes
    chmod 755 /tmp/bdd/proyecto-final/imagenes/autos
    unzip carga-inicial/imagenes/autos.zip -d /tmp/bdd/proyecto-final/imagenes

else 
    echo "Las imagenes de autos ya han sido copiadas."
fi 

echo "Imagenes recibos pago"
if [ ! -d "/tmp/bdd/proyecto-final/imagenes/recibos" ]; then 
    echo "Copiando zip de recibos de pago"
    mkdir -p /tmp/bdd/proyecto-final/imagenes/recibos 
    chmod 755 /tmp/bdd/proyecto-final/imagenes/recibos 
    unzip carga-inicial/imagenes/recibos.zip -d /tmp/bdd/proyecto-final/imagenes

else 
    echo "Las imagenes de recibos ya han sido copiadas. "
fi 

chmod 755 /tmp/bdd/proyecto-final
chmod 755 /tmp/bdd/proyecto-final/imagenes
chmod 755 /tmp/bdd/proyecto-final/imagenes/autos
chmod 755 /tmp/bdd/proyecto-final/imagenes/recibos 