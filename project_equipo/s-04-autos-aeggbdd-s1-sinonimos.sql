--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Synonym for aeggbdd_s1

Prompt pais
create or replace synonym pais_f1 for PAIS_F1_RDVG_S1@rdvgbdd_s1;
create or replace synonym pais_f2 for PAIS_F2_RDVG_S2@rdvgbdd_s2;

Prompt sucursal 
create or replace synonym sucursal_f1 for SUCURSAL_F1_AEGG_S1;
create or replace synonym sucursal_f2 for SUCURSAL_F2_RDVG_S1@rdvgbdd_s1;
create or replace synonym sucursal_f3 for SUCURSAL_F3_RDVG_S2@rdvgbdd_s2;

Prompt auto 
create or replace synonym auto_f1 for AUTO_F1_AEGG_S2@aeggbdd_s2;
create or replace synonym auto_f2 for AUTO_F2_RDVG_S1@rdvgbdd_s1;
create or replace synonym auto_f3 for AUTO_F3_RDVG_S2@rdvgbdd_s2;

Prompt auto_particular 
create or replace synonym auto_particular_f1 for AUTO_PARTICULAR_F1_RDVG_S1@rdvgbdd_s1;
create or replace synonym auto_particular_f2 for AUTO_PARTICULAR_F2_RDVG_S2@rdvgbdd_s2;

Prompt auto_carga 
create or replace synonym auto_carga_f1 for AUTO_CARGA_F1_RDVG_S1@rdvgbdd_s1;
create or replace synonym auto_carga_f2 for AUTO_CARGA_F2_RDVG_S2@rdvgbdd_s2;

Prompt Historico_status_auto 
create or replace synonym HISTORICO_STATUS_AUTO_F1 for HISTORICO_STATUS_AUTO_F1_AEGG_S2@aeggbdd_s2;
create or replace synonym HISTORICO_STATUS_AUTO_F2 for HISTORICO_STATUS_AUTO_F2_AEGG_S1;

Prompt marca 
create or replace synonym marca_r1 for MARCA_R_AEGG_S1;
create or replace synonym marca_r2 for MARCA_R_RDVG_S1@rdvgbdd_s1;
create or replace synonym marca_r3 for MARCA_R_RDVG_S2@rdvgbdd_s2;
create or replace synonym marca_r4 for MARCA_R_AEGG_S2@aeggbdd_s2;

Promp modelo 
create or replace synonym modelo_r1 for MODELO_R_AEGG_S1;
create or replace synonym modelo_r2 for MODELO_R_RDVG_S1@rdvgbdd_s1;
create or replace synonym modelo_r3 for MODELO_R_RDVG_S2@rdvgbdd_s2;
create or replace synonym modelo_r4 for MODELO_R_AEGG_S2@aeggbdd_s2;

Prompt cliente 
create or replace synonym cliente_f1 for CLIENTE_F1_RDVG_S2@rdvgbdd_s2;
create or replace synonym cliente_f2 for CLIENTE_F2_AEGG_S1;
create or replace synonym cliente_f3 for CLIENTE_F3_AEGG_S2@aeggbdd_s2;

Prompt tarjeta_cliente 
create or replace synonym tarjeta_cliente_f1 for TARJETA_CLIENTE_F1_RDVG_S2@rdvgbdd_s2;
create or replace synonym tarjeta_cliente_f2 for TARJETA_CLIENTE_F2_AEGG_S1;

Prompt pago_auto 
create or replace synonym pago_auto_f1 for PAGO_AUTO_F1_RDVG_S2@rdvgbdd_s2;
create or replace synonym pago_auto_f2 for PAGO_AUTO_F2_AEGG_S1;
create or replace synonym pago_auto_f3 for PAGO_AUTO_F3_AEGG_S2@aeggbdd_s2;