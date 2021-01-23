capture log close
capture drop _all

pwd

set logtype text
log using hw_2.txt, replace

*********************************************************************************
*** Install package and check its guide notes
*********************************************************************************
ssc install binscatter, replace
help binscatter

sysuse nlsw88.dta, clear
twoway (scatter wage ttl_exp) (lfit wage ttl_exp, lpatt(dash)), title("Wage and total work experience, use 'scatter'") scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total work experience") ytitle("Wage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW2\q4p1.png", as(png) replace
binscatter wage ttl_exp,nq(20) title("Wage and total work experience, use 'binscatter'") scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total work experience") ytitle("Wage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW2\q4p2.png", as(png) replace
* Change the default number of bins in your binscatter plot to 40
binscatter wage ttl_exp,nq(40) title("Wage and total work experience, 40 bins") scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total work experience") ytitle("Wage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW2\q4p3.png", as(png) replace
*Produce a binscatter that connects the different bins (hint: use the linetype option)
binscatter wage ttl_exp,nq(40) title("Wage and total work experience, bin connected") linetype(connect) scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total work experience") ytitle("Wage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW2\q4p4.png", as(png) replace
*Compute two different binscatters
binscatter wage ttl_exp,by(married) nq(40) title("Wage and total work experience by marriage status (qfit)") linetype(qfit) scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total work experience") ytitle("Wage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW2\q4p5.png", as(png) replace
