
define p_sys_pwd='&1'
define p_pdb='&2'
define p_usr='&3'
define p_pwd='&4'
define p_tipo_fr='&5'
define p_num_sitio ='&6'

Prompt Iniciando validacion para &&p_pdb. 

!rm -rf /tmp/bdd/p7
!mkdir -p /tmp/bdd/p7
!dd if=/dev/urandom of=/tmp/bdd/p7/p7-sample-1.bin bs=1 count=0 seek=1M
!dd if=/dev/urandom of=/tmp/bdd/p7/p7-sample-2.bin bs=1 count=0 seek=2M
!dd if=/dev/urandom of=/tmp/bdd/p7/p7-sample-3.bin bs=1 count=0 seek=3M
!dd if=/dev/urandom of=/tmp/bdd/p7/p7-sample-4.bin bs=1 count=0 seek=4M
!dd if=/dev/urandom of=/tmp/bdd/p7/p7-sample-5.bin bs=1 count=0 seek=5M
connect sys/&&p_sys_pwd@&&p_pdb as sysdba

create or replace directory bdd_p7_dir as '/tmp/bdd/p7';
grant read,write on directory bdd_p7_dir to &&p_usr; 

Prompt Iniciando creacion de procedimientos para &&p_pdb
connect &&p_usr/&&p_pwd@&&p_pdb


@s-00-funciones-validacion.plb
@s-00-load-blob-from-file.sql

create or replace procedure spv_valida_sinonimos wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
6b9 357
YZsMeajWgXpNnJijHXqE3l4HwKAwg2NcVScFfI4ZMmu7uLmJfOsq0QUOqB/cZniD4Axa3PLi
RsQjlci0bJ+Z1jQ9HDiW3zHxpK0IP5fKYCTBbrt92sHaRlJ7ak6Uxml67YWcMBMi28JaA3oM
v0J/cGVmX/JPaoOGAwLGTFvRlqZ1dOo3jhRmjndIGDov401WPcTfPMhAFA4VMHRxwSNXuS0M
VgSLGTTGXnPJ1dEWZG+ZzMHhLzD0F/NQKUkNhVCZS+9mlqOIA3LeptU3vncci5I/N5Q4to55
BEHKLcxQE6beW5ZuBXVn5gQRmaYV+7rggaNdoLqtwijiEFM13P2hEGXva+oSeBKxwoK7SpfL
yf7UAJi+KaK2OKx36NbZKWBSf8jXrw0oeBC5frkFIvy06U3RcV7C5Q9ez4AVIvto3I9FubBk
e/oKwJ8FvhqJ3nVBhesKxHwJVOi1fmIAa6t2ss6NueQ2O+1sWAq/7A1/V00Whpu+qQeRmfDb
IPsqNPvLWz8BDVXfyloDI3v/7yFFPAo8nT8fhhRfFHN6Zy5lZ7A+9cOBOGy+5XRAqwjuVxK2
bHvDbSVBmL1fyqOPS8S4PFkm00oid0KlCfVS+DhVqkAQmigKFNKqcnPOxXH+gQHdxt/pmdy7
bItum4ZfZIZ5vK4YYSlEepX4BPFRaMYBm3XU8qKleSwkufHYX53oQjmamkPIALvxEIcxGKBZ
eSZ2y2LQho0lTXkgraRJ8h6szmCUp2iusOCbEvz/D/KGblRfJJ4qE+g57Kc6F3yBtCdRsnKC
b2p/IbtIxu4oACdpaY19wSiQPrUJG5M9HcPqXZvmjZHkix8EijRA

/
show errors

create or replace procedure spv_valida_vistas wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
431 288
o8ubtSv6Sf8auV/9RqxDsJW5Vw0wgwK37UgFfC+p2luF2mhgiJSstITM26VnDLB1JlnTGhrK
tqh3HHQan/OYQZtlQvDYQi3IZpAJnz857tv4wb+AJqJAQjsvYar+yZoZZG87MWRhmJ+Z9CGU
txWOnqvlwohcjI7/cqYa7oFoESt/+zMgGCemWdoMK9ViibboOEVRe337Iad1XMroeCsE3MF1
rDJN/HCWiXWEO8yIu1Hun0BhOy9pVaFGvd4EGdMsZ0IcFx3UtiCmylecbCVxBHbxIXvwWpKL
756nf9zv8BqxPElX/tJZxoBsuX5cCEqXhTR9Jz9wiAIZWwtJE8sLxj5wWWApQ/Qu/XfTlNdi
17wFjmSIvxnGMeIbuDFjPop8iem2rhqO5pLfSuYGhr8EgzY49cJ/wwWzw/RFpYIDtw5s2WJo
yihAtXjE1aD4xAKV07m6fd/8noWvnqXOTdFRCJU54QoyxPQTt+cPkVD2LsXU1e8/bBoK4V0W
DVv8IqDVhkgsFZOzBV29dGvsqCQ4tijd4JIxQ2oJhupBJNQH5djnKu+nf7n6W5MlcvIa93ts
5EM6cps4hrTteq0wy+2q+tvvfa8jJGPWLIe1wHMSAxkAoG0vqj/JlmX5M56hD8u0

/
show errors

create or replace procedure spv_crea_tablas_temporales wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
27c 18d
i9u0wC1llNI4GSPxZIkofO5CRMQwg5DILiCsZy9AEt8IJEcuWnoWsBtBo3XD00TWdSMFdEth
FN3xAWwImr+cKIHdY4efwfiQQsvMfVG/GC/sRQEmXduObEQqWQjCb/GeGamqRjqKtp3kZ7VO
iGcX/R2mcn1B4DaqnYBytVA8ZrdROYIC1gbw4CNprz62bfDerwNtB7QoB/m7Yjkv1LpfSg6a
qJ4vbp+YvCKl3xtQ1a6FWGOUB0/mFMPdS2E0LnlwgeuAnEOIw7Fl7iWjZKfVEjGwMuNj6oc+
rKeRkgwlLTy7CzNmiamibTcIecd3tfd3CWgw5TYKA9keVIdbm9ggAOI8GefbQqVTH66GZeOb
Yf09UogVGPLlwAh37rS/4Mn4xCTAlMJs

/
show errors

exec spv_crea_tablas_temporales


create or replace procedure spv_prepara_datos wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
108a 601
sp5rJBov3ZR3mM3asG1OAjp775wwg9fquiAGV44ZwfLkW51sWkHxV+4bw94uBqBIt1eeNwHB
bJenR9EKCS98jYuau1LTyhr7gzErq0YG2QhDz0/QJAU1FlbJ0IRA3wqcMA3c6vp79Bf6n77M
1lcGN+OQLy4REVWzyCHzLCriL+zbhOp09+R0q+qEn9kQk7KqE75W4IW9AgfhI9Xgi0TRjGHj
gTWG2JCRn7kOaqB4Wr2OjlUtfvVGtImTC33XANAxbubcWGOuKd/pmjzZRKNsqpaG9S0j8rcx
Zd+JfmeLBXwWkQ/XHBgkWJT0V0uQe8GXycDitVi8XaD6TYjCFek7+ld5l6Qm7AJqYrnrq3i/
p6P1idAnnHTl+j9BhBVz85nvWmbM0lwDRgW0wClGOA8wasjuL+DpztfYBUZFC98JMtgwXkQi
fpdi+4jlIU5UTUqhGXobr5cAsomK1c9aBzF1Kv+5Kcy/rQS8BDB4Bf/mEN+NM+X4AqQp3ZTC
fvRgxvm0Mg+GtMf5A+v3l/X3MI9nq68jvY9cMoPj8FFzK17+8+/BHBItKsk/oi3vZrN6YOiB
+EAxseOsTDXNfrHGZS/gB5hZXEBhpFtVtIuoaTT8PzEUwP4Qs2S17CTV17F9KGsjs1tGYC+/
K0b/IUcLm+f9koZKN3WNezcYfUSCtRPzyg+CLgMgL3MQX8gPX/fP2arnSTkre0yMgHROkMzg
z29JfUmhf/yUBg6XxrldE6c5UqZJzH2ZWIEYfn1UdUKJmM5BrdjCB/dok/4LxTL6lPv4xV6r
Jdh9JYcPHt5dr8dr5Lv+XTr+6WWqRT9x0Ynx6CEimqHnn21A4gShOhpYnNKfR2rIAZTSPFFz
HCl9OY4st4HrwF6bw52P6Ag4SObkLfRdudUCxVgtoudtkD1UrC4hXoL09WUQoeUcPJCH+MdM
VRco0Ytb0GqPe47HLPVUjkQH+Lgv8I+giLNr2Zd7yxwsCvwn7eT3IkicWiP9EasUfPSyMFzp
u6AhJWbsPFsFfjyjVqMkj7AhKC507WPZG3sm37OuCD9T98/KTZctoIAqR8yy2U1Hp+gMw+3Z
TV8ntqyhx8r+kpOR1MFWnMzhyUPd2NN8sqcKTJlZuVx+WrH2ala3jJtsXo3lRD7Rasj+SCL6
ildRHIG+TXEi0r/e4lj20RvsMfY8bhjGnAZ4mPUUlSCKif6tWsdC/OZBbfddvUoWaIYM71ET
VXnECD7b8b/TBdHjKqDRvlpWOjLjbLDj6YEGMOQaXtDZjyj+4Sa8ldG3i++/DC7QKswg9oMN
MdF5VgCxNe0SCV3c2mAil38dv9qDMrC6716QsWUBiuq80hjtvs5A17JOwS5FGebh5l5C+uVC
mcMmT3Klzy2j4sQ++aci+bfbJV+/J2zXY+jpFu0Urprrska//eKB8bgR52Rzw1xl1BKthqY7
Xy7UKueT19ar+aelehw1WC5ib6Kl07c544IsvamkSvKPhO5FhCcAdBhmejB1iikF1pr5HYN8
Z8Y=

/
show errors 


create or replace procedure spv_consulta_datos wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1196 55e
LP7eS8gAL0UkLOWr+ZGysuhnDxUwgzsr10gTZy+5vgmaOEiPGxiXYe3bm68kHjY9yfOPoACo
4LZbvdZEtAljNFlPa9BQHx6mbbLJ+7BSFNp1WDozE5Agyep4tHXcbzkCMJjEnDgvu+TbLerc
09TCSPZtvnnlp5emT2B3fTcnPzAopciT0msnwIS1zqcuPS3lsh45VXAkKbTg12+6T1lEPO6k
AylxT7Puoi9WwhpP/jHq/CoB5wCMg5AyIBMkDcIL19yNn4I+R8/3Xlttk2ox81HykRFfuz0H
VtffIuF4+2L3H63GCmBSorvDO7Tft/9LjnzJmdfxJOCvKthUJhle1teoEPy/MB97heHO0OJ1
1qKbXM5kx4xlOsNm63iQs5RCCNLyZEUGCmuNTcCBray+ddm3s2igF371x4A7NBvAxWsZ+zOi
Sz7mHVepewLAT8tn+x5ByX9YpKn5DoYC6TWQcimipAa3iboLsb+cvduY8DQjaNthLCIZ2FXb
v9Yym1YkAqHjiTTKve6f+Nhdf67MU/u/A4FMF5SD4mb0V14CDLVRdOPI+/OCym77kFigFWM8
ucTWkkr+JOPPoQMgYYnfryeOLppcCAkLHJmWiuSEOtnlIrkIQytmUEuO7vj7H0xk2IrymU7b
ZRFhS9ICMtYsEugnw6d0v82VoY7Ujzkwh2zz5cqLI+crqIqz/NsJu2lvXqrdvTchfjMup2e/
NLTwNdK/mSXZ2VJ3Qy9J7or6uiM36/P/xkxklpEvAp1pgThbHbzv47PIxqs9cgUObNAlFLYb
ogIvsFc7L+nmM5+Bd5Bp6G0803IVcM1smJSn3kMVJTF+LRXvjljD25AvSxXbCDhG6x0lWKjK
uCUDFSHczHFjsgLFwTfIKy8lkPe2Yk/tc1LHrV9Ta0VXja8l5OyvRU4KcPcrViXarcLyHxj7
z+HJpk98PZjWhZ9T73TKAyvwjWrPyrgWKKvzz2wEzpPsEhq6OFX9ipgustaIwolzmETrAqV/
Mc2EX+PLhr3EJlOugORTHTBC992/4CJjSN24CPr0paTOKdW4rNvwNHx7Wu0j5aBorQh+CSL3
liwDlpO+ZupPEhdoHQo4D+K8p5StIS4nVMBzngAvzFM5sy1YEycvsb5kNunEhPGhmdpBmdVA
gG6gU4h/h/szqqr4GZc3eV2pHsGEqB58JreWQQggGgyNDC2V6NrWfEKCOMCtFRo4/Dw3zLp/
fpCronmKAYkCBVAW6zWGpAZFtInotB5Kheq7zGxqJY6J0fElNX5k1321XIOJaYyjD5C2Oppu
hUPHI7cO2VrP5Xh2Iyr3LOojuM9ykyOqtTYp8y3Sv4V1txVSmqr+KCY4PTg=

/
show errors

exec spv_print_header
host sha256sum &&p_script_validador
exec spv_prepara_datos(trim(upper('&&p_tipo_fr')));
exec spv_valida_sinonimos(trim(upper('&&p_tipo_fr')),&&p_num_sitio);
exec spv_valida_vistas(trim(upper('&&p_tipo_fr')),&&p_num_sitio);
exec spv_consulta_datos(&&p_num_sitio);

