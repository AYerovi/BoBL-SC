cd "D:\OneDrive - Escuela Politécnica Nacional\Adrian\Universitario\RA\Stata\data.dta"
 use "D:\OneDrive - Escuela Politécnica Nacional\Adrian\Universitario\RA\Stata\data.dta"

/*-------------------------SUMMARY STATISTICS-------------------------------*/

local cov_stats AGE INCOME KIDS i.S5_P03 i.S1_P03 i.S1_P04 i.S1_P02 i.S6_P05 i.IORG
summarize `cov_stats'


local var_stats S DISCR_FAM_I DISCR_SOCIAL_I DISCR D_W1 D_W2 D_W3 S_W1 S_W2
summarize `var_stats'

/* -------------- S ON DISCR AND OTHER CONTROLS (OLS) ---------------------- */

// Table 2: OLS ---------------------------------------------------------------

putexcel set results.xlsx, modify sheet(T3)

putexcel B4 = "", border(bottom, medium)
putexcel C4 = "[1]", border(bottom, medium)
putexcel D4 = "[2]", border(bottom, medium)
putexcel E4 = "[3]", border(bottom, medium)
putexcel F4 = "[4]", border(bottom, medium)
putexcel G4 = "[5]", border(bottom, medium)
putexcel H4 = "[6]", border(bottom, medium)

putexcel B5 = "Discrimination"
putexcel B7 = "Discrimination (family)"
putexcel B9 = "Discrimination (social)"
putexcel B11 = "log(Monthly Income)"
putexcel B13 = "Age"
putexcel B15 = "Has kids"
putexcel B17 = "Born woman"
putexcel B19 = "Constant"
putexcel B21:H21 = "", border(bottom)

putexcel B22 = "Observations"
putexcel B23 = "R squared"
putexcel B24 = "p > F"
putexcel B25:H25 = "",  border(bottom, medium)


local X i.S1_P02 i.S6_P05 S1_P04 i.S5_P03

quietly reg S DISCR `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel C5 = results[1,1], nformat(number_d3)
putexcel C6 = results[1,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel C19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel C20 = `temp', nformat(number_d3)
putexcel C22 = matrix(e(N)), nformat(number_d3) 
putexcel C23 = matrix(e(r2)), nformat(number_d3)
putexcel C24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel D7 = results[1,1], nformat(number_d3)
putexcel D8 = results[1,2], nformat(number_d3)
putexcel D9 = results[2,1], nformat(number_d3)
putexcel D10 = results[2,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel D19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel D20 = `temp', nformat(number_d3)
putexcel D22 = matrix(e(N)), nformat(number_d3) 
putexcel D23 = matrix(e(r2)), nformat(number_d3)
putexcel D24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel E5 = results[1,1], nformat(number_d3)
putexcel E6 = results[1,2], nformat(number_d3)
putexcel E11 = results[2,1], nformat(number_d3)
putexcel E12 = results[2,2], nformat(number_d3)
putexcel E13 = results[3,1], nformat(number_d3)
putexcel E14 = results[3,2], nformat(number_d3)
putexcel E15 = results[4,1], nformat(number_d3)
putexcel E16 = results[4,2], nformat(number_d3)
putexcel E17 = results[5,1], nformat(number_d3)
putexcel E18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel E19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel E20 = `temp', nformat(number_d3)
putexcel E22 = matrix(e(N)), nformat(number_d3) 
putexcel E23 = matrix(e(r2)), nformat(number_d3)
putexcel E24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel F7 = results[1,1], nformat(number_d3)
putexcel F8 = results[1,2], nformat(number_d3)
putexcel F9 = results[2,1], nformat(number_d3)
putexcel F10 = results[2,2], nformat(number_d3)
putexcel F11 = results[3,1], nformat(number_d3)
putexcel F12 = results[3,2], nformat(number_d3)
putexcel F13 = results[4,1], nformat(number_d3)
putexcel F14 = results[4,2], nformat(number_d3)
putexcel F15 = results[5,1], nformat(number_d3)
putexcel F16 = results[5,2], nformat(number_d3)
putexcel F17 = results[6,1], nformat(number_d3)
putexcel F18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel F19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel F20 = `temp', nformat(number_d3)
putexcel F22 = matrix(e(N)), nformat(number_d3) 
putexcel F23 = matrix(e(r2)), nformat(number_d3)
putexcel F24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR INCOME AGE KIDS SB M `X' i.UG_CIUD
matrix results = r(table)'
local rows = rowsof(results)
putexcel G5 = results[1,1], nformat(number_d3)
putexcel G6 = results[1,2], nformat(number_d3)
putexcel G11 = results[2,1], nformat(number_d3)
putexcel G12 = results[2,2], nformat(number_d3)
putexcel G13 = results[3,1], nformat(number_d3)
putexcel G14 = results[3,2], nformat(number_d3)
putexcel G15 = results[4,1], nformat(number_d3)
putexcel G16 = results[4,2], nformat(number_d3)
putexcel G17 = results[5,1], nformat(number_d3)
putexcel G18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel G19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel G20 = `temp', nformat(number_d3)
putexcel G22 = matrix(e(N)), nformat(number_d3) 
putexcel G23 = matrix(e(r2)), nformat(number_d3)
putexcel G24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I INCOME AGE KIDS SB M `X' i.UG_CIUD
matrix results = r(table)'
local rows = rowsof(results)
putexcel H7 = results[1,1], nformat(number_d3)
putexcel H8 = results[1,2], nformat(number_d3)
putexcel H9 = results[2,1], nformat(number_d3)
putexcel H10 = results[2,2], nformat(number_d3)
putexcel H11 = results[3,1], nformat(number_d3)
putexcel H12 = results[3,2], nformat(number_d3)
putexcel H13 = results[4,1], nformat(number_d3)
putexcel H14 = results[4,2], nformat(number_d3)
putexcel H15 = results[5,1], nformat(number_d3)
putexcel H16 = results[5,2], nformat(number_d3)
putexcel H17 = results[6,1], nformat(number_d3)
putexcel H18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel H19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel H20 = `temp', nformat(number_d3)
putexcel H22 = matrix(e(N)), nformat(number_d3) 
putexcel H23 = matrix(e(r2)), nformat(number_d3)
putexcel H24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

// Table 3: OLS by subsamples -------------------------------------------------

putexcel set results.xlsx, modify sheet(T4)

putexcel D3 = "", border(bottom, medium)
putexcel C2 = "Base sample", border(bottom)
putexcel D3 = "", border(bottom)
putexcel C4 = "[1]", border(bottom, medium)
putexcel D4 = "[2]", border(bottom, medium)

putexcel E2 = "By membership", border(bottom)
putexcel E3 = "Organization members", border(bottom)
putexcel F3 = "", border(bottom)
putexcel E4 = "[3]", border(bottom, medium)
putexcel F4 = "[4]", border(bottom, medium)
putexcel G3 = "Non-members", border(bottom)
putexcel G4 = "[5]", border(bottom, medium)
putexcel H4 = "[6]", border(bottom, medium)


putexcel I2 = "By sexual identity", border(bottom)
putexcel I3 = "Gays and Lesbians", border(bottom)
putexcel J3 = "", border(bottom)
putexcel I4 = "[7]", border(bottom, medium)
putexcel J4 = "[8]", border(bottom, medium)
putexcel K3 = "Trans", border(bottom)
putexcel K4 = "[9]", border(bottom, medium)
putexcel L3 = "", border(bottom)
putexcel L4 = "[10]", border(bottom, medium)

putexcel B5 = "Discrimination"
putexcel B7 = "Discrimination (family)"
putexcel B9 = "Discrimination (social circle)"
putexcel B11 = "log Monthly Income"
putexcel B13 = "Age"
putexcel B15 = "Has kids"
putexcel B17 = "Born woman"
putexcel B19 = "Constant"
putexcel B21:L21 = "", border(bottom)

putexcel B22 = "Observations"
putexcel B23 = "R squared"
putexcel B24 = "p > F"
putexcel B25:L25 = "",  border(bottom, medium)

local X INCOME AGE KIDS SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

quietly reg S DISCR `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel C5 = results[1,1], nformat(number_d3)
putexcel C6 = results[1,2], nformat(number_d3)
putexcel C11 = results[2,1], nformat(number_d3)
putexcel C12 = results[2,2], nformat(number_d3)
putexcel C13 = results[3,1], nformat(number_d3)
putexcel C14 = results[3,2], nformat(number_d3)
putexcel C15 = results[4,1], nformat(number_d3)
putexcel C16 = results[4,2], nformat(number_d3)
putexcel C17 = results[5,1], nformat(number_d3)
putexcel C18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel C19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel C20 = `temp', nformat(number_d3)
putexcel C22 = matrix(e(N)), nformat(number_d3) 
putexcel C23 = matrix(e(r2)), nformat(number_d3)
putexcel C24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel D7 = results[1,1], nformat(number_d3)
putexcel D8 = results[1,2], nformat(number_d3)
putexcel D9 = results[2,1], nformat(number_d3)
putexcel D10 = results[2,2], nformat(number_d3)
putexcel D11 = results[3,1], nformat(number_d3)
putexcel D12 = results[3,2], nformat(number_d3)
putexcel D13 = results[4,1], nformat(number_d3)
putexcel D14 = results[4,2], nformat(number_d3)
putexcel D15 = results[5,1], nformat(number_d3)
putexcel D16 = results[5,2], nformat(number_d3)
putexcel D17 = results[6,1], nformat(number_d3)
putexcel D18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel D19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel D20 = `temp', nformat(number_d3)
putexcel D22 = matrix(e(N)), nformat(number_d3) 
putexcel D23 = matrix(e(r2)), nformat(number_d3)
putexcel D24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

/* SUBSAMPLE Members */
preserve

drop if M == 0
quietly reg S DISCR `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel E5 = results[1,1], nformat(number_d3)
putexcel E6 = results[1,2], nformat(number_d3)
putexcel E11 = results[2,1], nformat(number_d3)
putexcel E12 = results[2,2], nformat(number_d3)
putexcel E13 = results[3,1], nformat(number_d3)
putexcel E14 = results[3,2], nformat(number_d3)
putexcel E15 = results[4,1], nformat(number_d3)
putexcel E16 = results[4,2], nformat(number_d3)
putexcel E17 = results[5,1], nformat(number_d3)
putexcel E18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel E19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel E20 = `temp', nformat(number_d3)
putexcel E22 = matrix(e(N)), nformat(number_d3) 
putexcel E23 = matrix(e(r2)), nformat(number_d3)
putexcel E24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel F7 = results[1,1], nformat(number_d3)
putexcel F8 = results[1,2], nformat(number_d3)
putexcel F9 = results[2,1], nformat(number_d3)
putexcel F10 = results[2,2], nformat(number_d3)
putexcel F11 = results[3,1], nformat(number_d3)
putexcel F12 = results[3,2], nformat(number_d3)
putexcel F13 = results[4,1], nformat(number_d3)
putexcel F14 = results[4,2], nformat(number_d3)
putexcel F15 = results[5,1], nformat(number_d3)
putexcel F16 = results[5,2], nformat(number_d3)
putexcel F17 = results[6,1], nformat(number_d3)
putexcel F18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel F19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel F20 = `temp', nformat(number_d3)
putexcel F22 = matrix(e(N)), nformat(number_d3) 
putexcel F23 = matrix(e(r2)), nformat(number_d3)
putexcel F24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)
restore

/* SUBSAMPLE Non members */ 
preserve

drop if M == 1
quietly reg S DISCR `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel G5 = results[1,1], nformat(number_d3)
putexcel G6 = results[1,2], nformat(number_d3)
putexcel G11 = results[2,1], nformat(number_d3)
putexcel G12 = results[2,2], nformat(number_d3)
putexcel G13 = results[3,1], nformat(number_d3)
putexcel G14 = results[3,2], nformat(number_d3)
putexcel G15 = results[4,1], nformat(number_d3)
putexcel G16 = results[4,2], nformat(number_d3)
putexcel G17 = results[5,1], nformat(number_d3)
putexcel G18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel G19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel G20 = `temp', nformat(number_d3)
putexcel G22 = matrix(e(N)), nformat(number_d3) 
putexcel G23 = matrix(e(r2)), nformat(number_d3)
putexcel G24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel H7 = results[1,1], nformat(number_d3)
putexcel H8 = results[1,2], nformat(number_d3)
putexcel H9 = results[2,1], nformat(number_d3)
putexcel H10 = results[2,2], nformat(number_d3)
putexcel H11 = results[3,1], nformat(number_d3)
putexcel H12 = results[3,2], nformat(number_d3)
putexcel H13 = results[4,1], nformat(number_d3)
putexcel H14 = results[4,2], nformat(number_d3)
putexcel H15 = results[5,1], nformat(number_d3)
putexcel H16 = results[5,2], nformat(number_d3)
putexcel H17 = results[6,1], nformat(number_d3)
putexcel H18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel H19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel H20 = `temp', nformat(number_d3)
putexcel H22 = matrix(e(N)), nformat(number_d3) 
putexcel H23 = matrix(e(r2)), nformat(number_d3)
putexcel H24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

restore

/* SUBSAMPLE Gays, Lesbians, Bisexuals */
preserve

drop if SEX_INCLIN == 4 | SEX_INCLIN == 5 | SEX_INCLIN == 6 
quietly reg S DISCR `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel I5 = results[1,1], nformat(number_d3)
putexcel I6 = results[1,2], nformat(number_d3)
putexcel I11 = results[2,1], nformat(number_d3)
putexcel I12 = results[2,2], nformat(number_d3)
putexcel I13 = results[3,1], nformat(number_d3)
putexcel I14 = results[3,2], nformat(number_d3)
putexcel I15 = results[4,1], nformat(number_d3)
putexcel I16 = results[4,2], nformat(number_d3)
putexcel I17 = results[5,1], nformat(number_d3)
putexcel I18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel I19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel I20 = `temp', nformat(number_d3)
putexcel I22 = matrix(e(N)), nformat(number_d3) 
putexcel I23 = matrix(e(r2)), nformat(number_d3)
putexcel I24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel J7 = results[1,1], nformat(number_d3)
putexcel J8 = results[1,2], nformat(number_d3)
putexcel J9 = results[2,1], nformat(number_d3)
putexcel J10 = results[2,2], nformat(number_d3)
putexcel J11 = results[3,1], nformat(number_d3)
putexcel J12 = results[3,2], nformat(number_d3)
putexcel J13 = results[4,1], nformat(number_d3)
putexcel J14 = results[4,2], nformat(number_d3)
putexcel J15 = results[5,1], nformat(number_d3)
putexcel J16 = results[5,2], nformat(number_d3)
putexcel J17 = results[6,1], nformat(number_d3)
putexcel J18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel J19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel J20 = `temp', nformat(number_d3)
putexcel J22 = matrix(e(N)), nformat(number_d3) 
putexcel J23 = matrix(e(r2)), nformat(number_d3)
putexcel J24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)
restore

/* SUBSAMPLE Trans */ 
preserve

drop if SEX_INCLIN == 1 | SEX_INCLIN == 2 | SEX_INCLIN == 3  
quietly reg S DISCR `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel K5 = results[1,1], nformat(number_d3)
putexcel K6 = results[1,2], nformat(number_d3)
putexcel K11 = results[2,1], nformat(number_d3)
putexcel K12 = results[2,2], nformat(number_d3)
putexcel K13 = results[3,1], nformat(number_d3)
putexcel K14 = results[3,2], nformat(number_d3)
putexcel K15 = results[4,1], nformat(number_d3)
putexcel K16 = results[4,2], nformat(number_d3)
putexcel K17 = results[5,1], nformat(number_d3)
putexcel K18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel K19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel K20 = `temp', nformat(number_d3)
putexcel K22 = matrix(e(N)), nformat(number_d3) 
putexcel K23 = matrix(e(r2)), nformat(number_d3)
putexcel K24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg S DISCR_FAM_I DISCR_SOCIAL_I `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel L7 = results[1,1], nformat(number_d3)
putexcel L8 = results[1,2], nformat(number_d3)
putexcel L9 = results[2,1], nformat(number_d3)
putexcel L10 = results[2,2], nformat(number_d3)
putexcel L11 = results[3,1], nformat(number_d3)
putexcel L12 = results[3,2], nformat(number_d3)
putexcel L13 = results[4,1], nformat(number_d3)
putexcel L14 = results[4,2], nformat(number_d3)
putexcel L15 = results[5,1], nformat(number_d3)
putexcel L16 = results[5,2], nformat(number_d3)
putexcel L17 = results[6,1], nformat(number_d3)
putexcel L18 = results[6,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel L19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel L20 = `temp', nformat(number_d3)
putexcel L22 = matrix(e(N)), nformat(number_d3) 
putexcel L23 = matrix(e(r2)), nformat(number_d3)
putexcel L24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)
restore


/*------------ T5 Differences between the young and old ----------------------- */
/* The hypothesis here is that there should be no systematical differences */
/* This suggests that treatment (born after the policy) was somewhat random */

// The youngest were born in '95.

local YY 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995


gen Y_Birth = 2013 - AGE

foreach x in `YY' {
	gen B_`x' = .
	replace B_`x' = 0 if AGE > 2013 - `x' 
	replace B_`x' = 1 if AGE <= 2013 - `x'
}


local X INCOME KIDS M SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD
putexcel set results.xlsx, modify sheet(T5)
putexcel B1 = "", border(bottom, medium)
putexcel C1 = "Well Being index", border(bottom, medium)
putexcel D1 = "Discrimination P. index", border(bottom, medium)
putexcel E1 = "Family D. P. index", border(bottom, medium)
putexcel F1 = "Social D. P. index", border(bottom, medium)

local y = "1980"
local i = 2
local j = 3
local k = 4
local l = 5
local m = 6
local n = 7
foreach x of varlist B_1980-B_1995 {
	
	local b = "Born on or after " + "`y'"
	putexcel B`i' = "`b'"
	putexcel B`j' = "Std. Error", right
	putexcel B`k' = "R-sq. =", italic right nformat(number_d3) 
	putexcel B`l' = "Prob. > F =", italic right nformat(number_d3) 
	putexcel B`m' = "N =", italic right nformat(number_d3) border(bottom)
	
	quietly reg S `x' `X'
	matrix results = r(table)
	putexcel C`i' = results[1,1], nformat(number_d3)
	putexcel C`j' = results[2,1], nformat(number_d3)
	putexcel C`k' = matrix(e(r2)), nformat(number_d3)
	putexcel C`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel C`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR `x' `X'
	matrix results = r(table)
	putexcel D`i' = results[1,1], nformat(number_d3)
	putexcel D`j' = results[2,1], nformat(number_d3)
	putexcel D`k' = matrix(e(r2)), nformat(number_d3)
	putexcel D`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel D`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_FAM_I `x' `X'
	matrix results = r(table)
	putexcel E`i' = results[1,1], nformat(number_d3)
	putexcel E`j' = results[2,1], nformat(number_d3)
	putexcel E`k' = matrix(e(r2)), nformat(number_d3)
	putexcel E`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel E`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_SOCIAL_I `x' `X'
	matrix results = r(table)
	putexcel F`i' = results[1,1], nformat(number_d3)
	putexcel F`j' = results[2,1], nformat(number_d3)
	putexcel F`k' = matrix(e(r2)), nformat(number_d3)
	putexcel F`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel F`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	local i = `i' + 5
	local j = `j' + 5
	local k = `k' + 5
	local l = `l' + 5
	local m = `m' + 5
	local y = `y' + 1
	
}

local X i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

putexcel set results.xlsx, modify sheet(T5)
putexcel G1 = "log(Monthly income)", border(bottom, medium)
putexcel H1 = "Kids", border(bottom, medium)
putexcel I1 = "Membership to organization", border(bottom, medium)
putexcel J1 = "Sex at birth", border(bottom, medium)

local y = 1980
local i = 2
local j = 3
local k = 4
local l = 5
local m = 6
local n = 7


foreach x of varlist B_1980-B_1995 {
	
	quietly reg INCOME `x' `X'
	matrix results = r(table)
	putexcel G`i' = results[1,1], nformat(number_d3)
	putexcel G`j' = results[2,1], nformat(number_d3)
	putexcel G`k' = matrix(e(r2)), nformat(number_d3)
	putexcel G`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel G`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly probit KIDS `x' `X'
	matrix results = r(table)
	putexcel H`i' = results[1,1], nformat(number_d3)
	putexcel H`j' = results[2,1], nformat(number_d3)
	putexcel H`k' = matrix(e(r2_p)), nformat(number_d3)
	putexcel H`l' = matrix(e(p)), nformat(number_d3) 
	putexcel H`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly probit M `x' `X'
	matrix results = r(table)
	putexcel I`i' = results[1,1], nformat(number_d3)
	putexcel I`j' = results[2,1], nformat(number_d3)
	putexcel I`k' = matrix(e(r2_p)), nformat(number_d3)
	putexcel I`l' = matrix(e(p)), nformat(number_d3) 
	putexcel I`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly probit SB `x' `X'
	matrix results = r(table)
	putexcel J`i' = results[1,1], nformat(number_d3)
	putexcel J`j' = results[2,1], nformat(number_d3)
	putexcel J`k' = matrix(e(r2_p)), nformat(number_d3)
	putexcel J`l' = matrix(e(p)), nformat(number_d3) 
	putexcel J`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	local i = `i' + 5
	local j = `j' + 5
	local k = `k' + 5
	local l = `l' + 5
	local m = `m' + 5
	local y = `y' + 1

}



