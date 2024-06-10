#!/bin/bash
# @Autor         Gutierrez Galicia Anton Emiliano
# @Fecha         09/12/2023
# @Descripcion   Creacion del archivo de passwords

#!/bin/bash

echo "Creando archivo de passwords"
#Se debe de ubicar en ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}

#cambiar iniciales
export ORACLE_SID=aeggbdd

if [ -f "${ORACLE_HOME}/dbs/orapw${ORACLE_SID}" ]; then
  read -p "El archivo existe, [enter] para sobrescribir"
  echo respaldando archivo de passwords
  cp ${ORACLE_HOME}/dbs/orapw${ORACLE_SID} /home/${USER}/backups

  echo eliminando archivo de passwords
  rm ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}
fi;

echo creando archivo de passwords
orapwd \
  FORCE=Y \
  FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' \
  FORMAT=12.2 \
  SYS=password

echo "comprobando la creacion del archivo"
ls -l ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}
