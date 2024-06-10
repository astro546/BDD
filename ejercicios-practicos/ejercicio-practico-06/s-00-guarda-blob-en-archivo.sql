create or replace procedure guarda_blob_en_archivo (
  v_directory_name in varchar2,
  v_dest_file_name in varchar2,
  v_table_name in varchar2,
  v_blob_column_name in varchar2,
  v_pk1_column_name in varchar2,
  v_pk1_column_value in varchar2,
  v_pk2_column_name in varchar2,
  v_pk2_column_value in varchar2
) is
  v_file utl_file.FILE_TYPE;
  v_buffer_size number :=32767;
  v_buffer RAW(32767);
  v_blob blob;
  v_blob_length number;
  v_position number;
  v_query varchar2(2000);

begin
  v_query := 'select '
    ||v_blob_column_name
    ||' into :ph_blob '
    ||' from '
    ||v_table_name
    ||' where '
    ||v_pk1_column_name
    ||'= :pk1_value';

  if v_pk2_column_name is not null
    then
      v_query := v_query || ' and ' || v_pk2_column_name || '= :pk2_value';
  end if;

  --ejecuta query dinámico
  if v_pk2_column_name is not null then
    execute immediate v_query into v_blob using
      v_pk1_column_value, v_pk2_column_value;
  else
    execute immediate v_query into v_blob using
      v_pk1_column_value;
  end if;
    
  v_blob_length := dbms_lob.getlength(v_blob);
  v_position := 1;
  v_file := utl_file.fopen(v_directory_name,v_dest_file_name,'wb',32767);

  --lee el archivos por partes hasta completar
  while v_position < v_blob_length loop
    dbms_lob.read(v_blob,v_buffer_size,v_position,v_buffer);
    UTL_FILE.put_raw(v_file,v_buffer,TRUE);
    v_position := v_position+v_buffer_size;
  end loop;
  utl_file.fclose(v_file);

  -- cierra el archivo en caso de error y relanza la excepción.
  exception when others then
    --cerrar v_file en caso de error.
    if utl_file.is_open(v_file) then
      utl_file.fclose(v_file);
    end if;
  raise;

end;
/
show errors;