#!/bin/bash
# @Autor         Gutierrez Galicia Anton Emiliano
# @Fecha         09/12/2023
# @Descripcion   Creacion del pfile

echo "Creando un pfile"
export ORACLE_SID=aeggbdd

pfile="${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"

if [ -f "${pfile}" ]; then
  read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;

echo \
"
db_name='${ORACLE_SID}'
db_domain=${ORACLE_SID}.fi.unam
sga_target=768M
sga_max_size=1024M
db_recovery_file_dest_size=20480M
db_recovery_file_dest=/unam-bda/d16
db_flashback_retention_target=7200
" > ${pfile} 

echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}
