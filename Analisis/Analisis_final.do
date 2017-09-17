***************************************************************
**                                                           **
**   Validación de un instrumento para la evaluación         **
**   de habilidades quirúrgicas de sutura en estudiantes     **
**   de medicina                                             **
**                                                           **
**   Kevin Martinez-Folgar                                   **
**                                                           **
**   Guatemala,  10Sept17                                    **
***************************************************************

use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear


** Alfa de Cronbach 
by evaluador, sort : alpha item1 item2 item3 item4 item5 item6 item7 item8 item9

alpha item1 item2 item3 item4 item5 item6 item7 item8 item9


** Esferacidad de Bartlett
factortest item1 item2 item3 item4 item5 item6 item7 item8 item9
factortest item1 item2 item3 item4 item5 item6 item7 item8 item9 if evaluador==1
factortest item1 item2 item3 item4 item5 item6 item7 item8 item9 if evaluador==2


** Indice de Kappa
** Item 1
drop item2 item3 item4 item5 item6 item7 item8 item9
reshape wide item1, i(num_video) j(evaluador)
kap item11 item12
kap item11 item12, wgt(w)


** Item 2
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item3 item4 item5 item6 item7 item8 item9
reshape wide item2, i(num_video) j(evaluador)
kap item21 item22
kap item21 item22, wgt(w)


** Item 3
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item4 item5 item6 item7 item8 item9
reshape wide item3, i(num_video) j(evaluador)
kap item31 item32
kap item31 item32, wgt(w)


** Item 4
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item3 item5 item6 item7 item8 item9
reshape wide item4, i(num_video) j(evaluador)
kap item41 item42 
kap item41 item42, wgt(w)

** Item 5
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item3 item4 item6 item7 item8 item9
reshape wide item5, i(num_video) j(evaluador)
kap item51 item52
kap item51 item52, wgt(w)

** Item 6
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item3 item4 item5 item7 item8 item9
reshape wide item6, i(num_video) j(evaluador)
kap item61 item62 
kap item61 item62, wgt(w)

** Item 7
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item3 item4 item5 item6 item8 item9
reshape wide item7, i(num_video) j(evaluador)
kap item71 item72
kap item71 item72, wgt(w)

** Item 8
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item3 item4 item5 item6 item7 item9
reshape wide item8, i(num_video) j(evaluador)
kap item81 item82
kap item81 item82, wgt(w)
 
 
** Item 9
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
drop item1 item2 item3 item4 item5 item6 item7 item8
reshape wide item9, i(num_video) j(evaluador)
kap item91 item92
kap item91 item92, wgt(w)


** Test de Kruskal Wallis
use "C:\Users\Kevin Martinez\Desktop\Dropbox (Personal)\TESIS SUTURA\Tesis Validación Instrumento\Trabajo de Campo\DB_Clean_10Sept2017.dta", clear
egen nota_total=rowtotal(item1-item9)
kwallis nota_total, by(evaluador)

