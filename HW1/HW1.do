clear
clear matrix
capture log close
set memory 500m
set matsize 5000
set more off

cd "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW1\"
use "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW1\mroz_ps0.dta"
gen OUTPATH = "D:\INSEAD\Course\P3\Econometrics A\Econometrics-A-2021\HW1\"
//https://lukestein.github.io/stata-latex-workflows/gallery/
tabstat inlf hours kidslt6 kidsge6 age educ wage repwage hushrs husage huseduc huswage faminc mtr motheduc fatheduc unem city exper nwifeinc, stat(n mean cv q) col(stat)


label var inlf "Frac (\%)"
label var hours "Frac (\%)"
label var kidslt6 "Frac (\%)"
label var kidsge6 "Frac (\%)"
label var age "Frac (\%)"
label var educ "Frac (\%)"

eststo clear
eststo: quietly estpost summarize	inlf hours kidslt6 kidsge6 age educ ///

esttab using "${OUTPATH}summstat_bds_sy.tex", replace ///
		cells("mean(fmt(2)) sd(fmt(2)) p50(fmt(2)) p25(fmt(2)) p75(fmt(2))") label booktab nonumber nomtitles
eststo clear
