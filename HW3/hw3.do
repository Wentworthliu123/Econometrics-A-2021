capture log close
capture drop _all

pwd
cd "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW3"
set logtype text
log using hw3.txt, replace

use NLS80, clear
eststo clear

eststo: regress lwage educ, r
eststo: regress lwage educ iq kww, r
eststo: regress lwage educ iq kww age, r
eststo: regress lwage educ iq kww age exper, r
eststo: regress lwage educ iq kww age exper hours, r
eststo: regress lwage educ iq kww age exper hours married, r
eststo: regress lwage educ iq kww age exper hours married black south urban, r

*Latex output

esttab using q4_tab1e.tex, replace fragment cells(b(star fmt(3)) se(par fmt(3))) collabels(none) stats(N r2 r2_a, fmt(%9.0f 3) label("No. of Observations" "\$R^2\$" "Adjusted \$R^2\$")) nonumber msign(--) nonotes star(* 0.10 ** 0.05 *** 0.01) label  title("OLS regression with heteroskedastic standard error") prehead("\begin{center}" "\begin{threeparttable}\caption{\textbf{@title}}\label{q3tab1}" "\begin{tabular}{l*{@M}{cc}}" "\toprule") posthead(\hline) prefoot(\hline) postfoot("\bottomrule" "\end{tabular}" "\begin{tablenote}""\small{\textit{Notes:} {Standard errors in parentheses.\\* for p$<$0.1, ** for p$<$0.05, and *** for p$<$0.01.}" "\end{tablenote}" "\end{threeparttable}""\end{center}")


test black=south=urban=0

test educ=0.5

predict wage_predicted

predict residual, residual


regress lwage educ iq kww age exper hours married black south urban
estat hettest

eststo clear
eststo: regress lwage educ iq kww age exper hours black south urban if (married==1), r
eststo: regress lwage educ iq kww age exper hours black south urban if (married==0), r

#delimit
esttab using q4_tab1e2.tex, replace fragment cells(b(star fmt(3)) se(par fmt(3)))
 collabels(none) stats(N r2 r2_a, fmt(%9.0f 3) label("No. of Observations" "\$R^2\$" "Adjusted \$R^2\$")) 
 nonumber msign(--) nonotes star(* 0.10 ** 0.05 *** 0.01) label  title("OLS regression with heteroskedastic standard error") 
 mlabels("Married" "Unmerried",span prefix(\multicolumn{@span}{c}{) suffix(})) 
 prehead("\begin{center}" "\begin{threeparttable}\caption{\textbf{@title}}\label{q3tab1}" "\begin{tabular}{l*{@M}{cc}}" "\toprule") posthead(\hline) prefoot(\hline) postfoot("\bottomrule" "\end{tabular}" "\begin{tablenote}""\small{\textit{Notes:} {Standard errors in parentheses.\\* for p$<$0.1, ** for p$<$0.05, and *** for p$<$0.01.}" "\end{tablenote}" "\end{threeparttable}""\end{center}")
;
twoway (scatter lwage educ) (lfit lwage educ, lpatt(dash)), title("lwage and years of education, without controls, use 'scatter'") scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total years of education") ytitle("lwage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW3\q4p1.png", as(png) replace
binscatter lwage educ,nq(40) title("lwage and years of education, without controls")  scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total years of education") ytitle("lwage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW3\q4p2.png", as(png) replace
binscatter lwage educ,nq(40) title("lwage and years of education, with controls") controls(iq kww age exper hours married black south urban) scheme(s2color) plotregion(style(none)) ylabel(,angle(0)) xtitle("Total years of education") ytitle("lwage")
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW3\q4p3.png", as(png) replace

pwcorr lwage educ iq kww age exper hours married black south urban 
graph matrix lwage educ iq kww age exper hours married black south urban, half 
graph export "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW3\q4p4.png", as(png) replace
