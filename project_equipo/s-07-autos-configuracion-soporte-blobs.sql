--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Main create views on PDB's

Prompt Creacion de objetos para leer blobs 
set serveroutput on
Prompt Creando directorios 
create or replace directory proyecto_final_autos_dir 
    as '/tmp/bdd/proyecto-final/imagenes/autos';
create or replace directory proyecto_final_recibos_dir 
    as '/tmp/bdd/proyecto-final/imagenes/recibos';

Prompt Creando funcion para leer datos blob 
create or replace function fx_carga_blob(
    p_directory_name    in varchar2,
    p_src_file_name     in varchar2 ) return blob is 

--Variables 
v_src_blob bfile := bfilename(upper(p_directory_name), p_src_file_name);
v_dest_blob blob := empty_blob();
v_src_offset number := 1;
v_dest_offset number := 1;
v_src_blob_size number;

begin 
    if dbms_lob.fileexists(v_src_blob) = 0 then 
        raise_application_error(-20001, 'El archivo '
            ||''''
            ||p_src_file_name
            ||''''
            ||' No existe en el directorio configurado: '
            ||p_directory_name);
    end if;

    --Abriendo el archivo
    if dbms_lob.isopen(v_src_blob) = 0 then 
        dbms_lob.open(v_src_blob, dbms_lob.LOB_READONLY);
    end if;

    v_src_blob_size := dbms_lob.getlength(v_src_blob);
    
    --dbms_output.put_line('Linea prueba');
    --Crear un objeto lob temporal 
    dbms_lob.createtemporary(
        lob_loc => v_dest_blob,
        cache   => true,
        dur     => dbms_lob.call
    );

    --Leer el archivo y escribirlo en el blob 
    dbms_lob.loadblobfromfile(
        dest_lob    => v_dest_blob,
        src_bfile   => v_src_blob,
        amount      => dbms_lob.getlength(v_src_blob),
        dest_offset => v_dest_offset,
        src_offset  => v_src_offset
    );

    --Cerramos el blob 
    dbms_lob.close(v_src_blob);

    if v_src_blob_size <> dbms_lob.getlength(v_dest_blob) then 
        raise_application_error(-20104, 'Invalid blob size. Expected: '
            ||v_src_blob_size
            ||', actual: '
            ||dbms_lob.getlength(v_dest_blob));
    end if;
    return v_dest_blob;
end;
/
show errors 