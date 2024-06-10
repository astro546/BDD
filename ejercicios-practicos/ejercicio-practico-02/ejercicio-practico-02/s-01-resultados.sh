#!/bin/bash

fv_list_prefix(){
  p_index=$1;
  user=$USER;
  host=$HOSTNAME
  year=`date '+%Y'`
  month=`date '+%m'`
  day=`date '+%d'`
  time=`date '+%H:%M:%S'`
  host_length=`echo -n $host | wc -m`
  user_length=`echo -n $user | wc -m`
  total_length=$(($host_length+$user_length));

  if [ $p_index -eq "0" ]; then
    p_index=1
  fi;

  host_index=$p_index
  user_index=$p_index

  if [ $p_index -gt $host_length ]; then
    host_index=$(($host_index%$host_length))
  fi;

  if [ $p_index -gt $user_length ]; then
     user_index=$(($user_index%$user_length))
  fi;

  if [ $host_index -eq "0" ]; then
    host_index=$host_length;
  fi;

  if [ $user_index -eq "0" ]; then
    user_index=$user_length;
  fi;

  letter_host=$(echo $host | cut -c$host_index)
  letter_user=$(echo $user | cut -c$user_index)

  row=`echo 00$host_index | tail -c4`
  row+=`echo 00$total_length | tail -c4`
  row+="-"
  row+=`echo "$letter_user" | tr '[:lower:]' '[:upper:]'` 
  row+="$year-"
  row+=`echo 0$month | tail -c3`
  row+="-"
  row+=`echo 0$day | tail -c3`
  row+=`echo "$letter_host" | tr '[:lower:]' '[:upper:]'` 
  row+="$time"
  echo $row;
}

fv_header(){

  fecha=`date '+%Y-%m-%d %H:%M:%S'`
  host_length=${#HOSTNAME}
  user_length=${#USER}
  hash=$(($host_length+$user_length))
  configHosts=`cat /etc/hosts | grep "fi.unam"`
  configHostname=`cat /etc/hostname | grep "fi.unam"`

  echo "========== Validacion de resultados ========== ";
  echo "1. Fecha............................${fecha}"
  echo "2. Nombre del Host ................ ${HOSTNAME}"
  echo "3. Nombre del usuario ............. ${USER}"
  echo "4. Config /etc/hosts  ............. ${configHosts}"
  echo "5. Config /etc/hostname ........... ${configHostname}"
  echo "6. fv_hsh_user .................... ${hash}"
 
}

if [ "${USER}" = "oracle" -o "${USER}" = "root" ]; then
  echo "ERROR: Se esta empleando el usuario oracle o el usuario root "
  echo "Ejecutar con el usuario administrador creado en la instalación "
  exit;
fi

echo ""
fv_header

echo ""
echo "======== 1. Validando variables de entorno ============="

if  [ -d "${ORACLE_HOME}" ];  then
  echo "===> 1. "$(fv_list_prefix 1)" OK - Variable ORACLE_HOME"   
else
  echo "ERROR: directorio no encontrado para la variable ORACLE_HOME: ${ORACLE_HOME} "
fi;

if  [[ "${configHosts}" =~ fi\.unam ]]; then
  echo "===> 2. $(fv_list_prefix 2) OK Configuración en /etc/hosts contiene fi.unam"
else
  echo "ERROR: El archivo /etc/hosts no contiene el dominio fi.unam"
fi;

if  [[ "${configHostname}" =~ fi\.unam ]]; then
  echo "===> 3. $(fv_list_prefix 3) OK Configuración en /etc/hostname contiene fi.unam"
else
  echo "ERROR: El archivo /etc/hostname no contiene el dominio fi.unam"
fi;

param_kernel=`sysctl -q fs.aio-max-nr`
if [ "${param_kernel}" = "fs.aio-max-nr = 1048576" ]; then
  echo "===> 4. "$(fv_list_prefix 4)" OK - parametro del kernel fs.aio-max-nr "   
else
  echo "ERROR: valor invalido para parametro del kernel fs.aio-max-nr "
  echo "Se esperaba 'fs.aio-max-nr = 1048576', se obtuvo: ${param_kernel} "
fi;

file_size=`stat -c%s ${ORACLE_HOME}/bin/oracle`
if ! [ "${file_size}" = "0" ]; then
  echo "===> 5. "$(fv_list_prefix 5)" OK - Longitud del arhivo oracle: ${file_size}"   
else
  echo "ERROR: El archivo binario tiene 0 bytes. La práctica es inválida. "
  echo "Para corregir el error se deberá reinstalar el software "
fi;
echo ""
echo "======== 2. Mostrando rchivos de instalacion ============="
ls -l $ORACLE_HOME/bin/oracle
ls -l $ORACLE_HOME/bin/sqlplus
ls -l $ORACLE_HOME/bin/lsnrctl 
ls -l ~/.bashrc
echo "Listo !"
