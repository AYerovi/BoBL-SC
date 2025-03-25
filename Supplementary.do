// SUPPLEMENTARY CALCULATIONS

local DF2 _V124 _V129 _V134 _V139 _V144 _V149 _V154 _V159 _V164 _V169

foreach x in `DF2'{
	replace `x' = 0 if `x' == 2
}


gen DISCR_SOCIAL_2 = _V19 + _V26 + _V33 + _V40 + _V47 + _V54 + _V75 + _V82 + _V89 + _V96 + _V103 + _V110 + _V117 + _V124 + _V129 + _V134 + _V139 + _V144 + _V149 + _V154 + _V159 + _V164 + _V169

gen DISCR_SOCIAL_II = DISCR_SOCIAL_2/23


/* --------------- Table S1 and Figure S1 - CORRELATIONS (SUPPLEMENTARY MATERIAL) ------------------*/

asdoc cor  S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P046 S3_P047 S3_P048 S3_P049 S3_P0410 S3_OTHER, save(corr.xls) title(CorrelationD)
corr S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P046 S3_P047 S3_P048 S3_P049 S3_P0410 S3_OTHER
putexcel set results_SM.xlsx, modify sheet(S1)
putexcel A1=matrix(r(C))

corr S3_P02A1 S3_P02A2 S3_P02A3 S3_P02A4 S3_P02A5 S3_P02A6 S3_P02A7 S3_P02B1 S3_P02B2 S3_P02B3 S3_P02B4 S3_P02B5 S3_P02C1 S3_P02C2 S3_P02C3 S3_P02C4 S3_P02C5 S3_P02C6 S3_P02C7 S3_P02C8 S3_P02D1 S3_P02D2 S3_P02D3 S3_P02D4 S3_P02D5 _V19 _V26 _V33 _V40 _V47 _V54 _V75 _V82 _V89 _V96 _V103 _V110 _V117 _V124 _V129 _V134 _V139 _V144 _V149 _V154 _V159 _V164 _V169
putexcel set results_SM.xlsx, modify sheet(S2)
putexcel A1=matrix(r(C))

/* -------------- S4 - PROBIT REGRESSIONS (SUPPLEMENTARY MATERIAL) ---------------*/

local X i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

local WBV S3_P041  S3_P042  S3_P043  S3_P044  S3_P045  S3_P046  S3_P047  S3_P048  S3_P049  S3_P0410 
foreach x in `WBV'{

}

putexcel set results_SM.xlsx, modify sheet(S4)

putexcel B4 = "", border(bottom, medium)
putexcel C4 = "[A]", border(bottom, medium)
putexcel D4 = "[B]", border(bottom, medium)
putexcel E4 = "[C]", border(bottom, medium)
putexcel F4 = "[D]", border(bottom, medium)
putexcel G4 = "[E]", border(bottom, medium)
putexcel H4 = "[F]", border(bottom, medium)
putexcel I4 = "[G]", border(bottom, medium)
putexcel J4 = "[H]", border(bottom, medium)
putexcel K4 = "[I]", border(bottom, medium)
putexcel L4 = "[J]", border(bottom, medium)

putexcel B4 = ""
putexcel B5 = "[A]"
putexcel B7 = "[B]"
putexcel B9 = "[C]"
putexcel B11 = "[D]"
putexcel B13 = "[E]"
putexcel B15 = "[F]"
putexcel B17 = "[G]"
putexcel B19 = "[H]"
putexcel B21 = "[I]"
putexcel B23 = "[J]"
putexcel B25 = "Constant"
putexcel B26:L26 = "", border(bottom)

quietly probit S3_P041  S3_P042  S3_P043  S3_P044  S3_P045  S3_P046  S3_P047  S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel C`k0' = results[`i',1], nformat(number_d3)
	putexcel C`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit S3_P042 S3_P041  S3_P043  S3_P044  S3_P045  S3_P046  S3_P047  S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel D`k0' = results[`i',1], nformat(number_d3)
	putexcel D`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit  S3_P043 S3_P041 S3_P042 S3_P044  S3_P045  S3_P046  S3_P047  S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel E`k0' = results[`i',1], nformat(number_d3)
	putexcel E`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit  S3_P044 S3_P041 S3_P042 S3_P043 S3_P045  S3_P046  S3_P047  S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel F`k0' = results[`i',1], nformat(number_d3)
	putexcel F`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit S3_P045 S3_P041 S3_P042 S3_P043 S3_P044 S3_P046  S3_P047  S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel G`k0' = results[`i',1], nformat(number_d3)
	putexcel G`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit S3_P046 S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P047  S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel H`k0' = results[`i',1], nformat(number_d3)
	putexcel H`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit S3_P047 S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P046 S3_P048  S3_P049  S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel I`k0' = results[`i',1], nformat(number_d3)
	putexcel I`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit S3_P048 S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P046 S3_P047  S3_P049 S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel J`k0' = results[`i',1], nformat(number_d3)
	putexcel J`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}


quietly probit S3_P049 S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P046 S3_P047 S3_P048 S3_P0410
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel K`k0' = results[`i',1], nformat(number_d3)
	putexcel K`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}

quietly probit S3_P0410 S3_P041 S3_P042 S3_P043 S3_P044 S3_P045 S3_P046 S3_P047 S3_P048 S3_P049
matrix results = r(table)'
local rows = rowsof(results)
local i = 1
local k0 = 5
local k1 = 6
while `i' <= `rows' {
    putexcel L`k0' = results[`i',1], nformat(number_d3)
	putexcel L`k1' = results[`i',2], nformat(number_d3)
	local i = `i' + 1
	local k0 = `k0' + 2
	local k1 = `k1' + 2
}






putexcel C5 = results[1,1], nformat(number_d3)
putexcel C6 = results[1,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel C15 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel C16 = `temp', nformat(number_d3)
putexcel C17 = matrix(e(N)), nformat(number_d3) 
putexcel C18 = matrix(e(p)), nformat(number_d3)


/* -------------- S5  ---------------*/

gen  log_S_W1 = log(S_W1+1)
gen  log_S_W2 = log(S_W2+1)
gen  log_D_W1 = log(D_W1+1)
gen  log_D_W2 = log(D_W2+1)
gen  log_D_W3 = log(D_W3+1)

putexcel set results_SM.xlsx, modify sheet(S5)

putexcel B4 = "", border(bottom, medium)
putexcel C4 = "[1]", border(bottom, medium)
putexcel D4 = "[2]", border(bottom, medium)
putexcel E4 = "[3]", border(bottom, medium)
putexcel F4 = "[4]", border(bottom, medium)
putexcel G4 = "[5]", border(bottom, medium)
putexcel H4 = "[6]", border(bottom, medium)

putexcel B5 = "Discrimination, weigthed (1)"
putexcel B7 = "Discrimination, weigthed (2)"
putexcel B9 = "Discrimination, weigthed (3)"
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

quietly reg log_S_W1 D_W1 INCOME AGE KIDS SB M `X'
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

quietly reg log_S_W1 D_W2 INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel D7 = results[1,1], nformat(number_d3)
putexcel D8 = results[1,2], nformat(number_d3)
putexcel D11 = results[2,1], nformat(number_d3)
putexcel D12 = results[2,2], nformat(number_d3)
putexcel D13 = results[3,1], nformat(number_d3)
putexcel D14 = results[3,2], nformat(number_d3)
putexcel D15 = results[4,1], nformat(number_d3)
putexcel D16 = results[4,2], nformat(number_d3)
putexcel D17 = results[5,1], nformat(number_d3)
putexcel D18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel D19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel D20 = `temp', nformat(number_d3)
putexcel D22 = matrix(e(N)), nformat(number_d3) 
putexcel D23 = matrix(e(r2)), nformat(number_d3)
putexcel D24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg log_S_W1 D_W3 INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel E9 = results[1,1], nformat(number_d3)
putexcel E10 = results[1,2], nformat(number_d3)
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

quietly reg log_S_W2 D_W1 INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel F5 = results[1,1], nformat(number_d3)
putexcel F6 = results[1,2], nformat(number_d3)
putexcel F11 = results[2,1], nformat(number_d3)
putexcel F12 = results[2,2], nformat(number_d3)
putexcel F13 = results[3,1], nformat(number_d3)
putexcel F14 = results[3,2], nformat(number_d3)
putexcel F15 = results[4,1], nformat(number_d3)
putexcel F16 = results[4,2], nformat(number_d3)
putexcel F17 = results[5,1], nformat(number_d3)
putexcel F18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel F19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel F20 = `temp', nformat(number_d3)
putexcel F22 = matrix(e(N)), nformat(number_d3) 
putexcel F23 = matrix(e(r2)), nformat(number_d3)
putexcel F24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

quietly reg log_S_W2 D_W2 INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel G7 = results[1,1], nformat(number_d3)
putexcel G8 = results[1,2], nformat(number_d3)
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

quietly reg log_S_W2 D_W3 INCOME AGE KIDS SB M `X'
matrix results = r(table)'
local rows = rowsof(results)
putexcel H9 = results[1,1], nformat(number_d3)
putexcel H10 = results[1,2], nformat(number_d3)
putexcel H11 = results[2,1], nformat(number_d3)
putexcel H12 = results[2,2], nformat(number_d3)
putexcel H13 = results[3,1], nformat(number_d3)
putexcel H14 = results[3,2], nformat(number_d3)
putexcel H15 = results[4,1], nformat(number_d3)
putexcel H16 = results[4,2], nformat(number_d3)
putexcel H17 = results[5,1], nformat(number_d3)
putexcel H18 = results[5,2], nformat(number_d3)
local temp = results[`rows', 1]
putexcel H19 = `temp', nformat(number_d3)
local temp = results[`rows', 2]
putexcel H20 = `temp', nformat(number_d3)
putexcel H22 = matrix(e(N)), nformat(number_d3) 
putexcel H23 = matrix(e(r2)), nformat(number_d3)
putexcel H24 = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3)

/* -------------------- S6 -------------------------------*/

local X INCOME KIDS M SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

putexcel set results_SM.xlsx, modify sheet(S6)

putexcel B1 = "", border(bottom, medium)
putexcel C1 = "S-W-1", border(bottom, medium)
putexcel D1 = "S-W-2", border(bottom, medium)
putexcel E1 = "D-W-1", border(bottom, medium)
putexcel F1 = "D-W-2", border(bottom, medium)
putexcel G1 = "D-W-3", border(bottom, medium)

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
	
	quietly reg log_S_W1 `x' `X'
	matrix results = r(table)
	putexcel C`i' = results[1,1], nformat(number_d3)
	putexcel C`j' = results[2,1], nformat(number_d3)
	putexcel C`k' = matrix(e(r2)), nformat(number_d3)
	putexcel C`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel C`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg log_S_W2 `x' `X'
	matrix results = r(table)
	putexcel D`i' = results[1,1], nformat(number_d3)
	putexcel D`j' = results[2,1], nformat(number_d3)
	putexcel D`k' = matrix(e(r2)), nformat(number_d3)
	putexcel D`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel D`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg log_D_W1 `x' `X'
	matrix results = r(table)
	putexcel E`i' = results[1,1], nformat(number_d3)
	putexcel E`j' = results[2,1], nformat(number_d3)
	putexcel E`k' = matrix(e(r2)), nformat(number_d3)
	putexcel E`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel E`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg log_D_W2 `x' `X'
	matrix results = r(table)
	putexcel F`i' = results[1,1], nformat(number_d3)
	putexcel F`j' = results[2,1], nformat(number_d3)
	putexcel F`k' = matrix(e(r2)), nformat(number_d3)
	putexcel F`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel F`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg log_D_W3 `x' `X'
	matrix results = r(table)
	putexcel G`i' = results[1,1], nformat(number_d3)
	putexcel G`j' = results[2,1], nformat(number_d3)
	putexcel G`k' = matrix(e(r2)), nformat(number_d3)
	putexcel G`l' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel G`m' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	local i = `i' + 5
	local j = `j' + 5
	local k = `k' + 5
	local l = `l' + 5
	local m = `m' + 5
	local y = `y' + 1
	
}


/* ------- S7 -------- */


local X INCOME KIDS M SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD
gen YOB_d = 2013 - AGE

putexcel set results_SM.xlsx, modify sheet(S7)
putexcel B1 = "", border(bottom, medium)
putexcel C1 = "Well Being index", border(bottom, medium)
putexcel D1 = "Discrimination P. index", border(bottom, medium)
putexcel E1 = "Family D. P. index", border(bottom, medium)
putexcel F1 = "Social D. P. index", border(bottom, medium)

local y = 1982
local i = 2
local j = 3
local k = 4
local l = 5

foreach x of varlist B_1982-B_1993 {
	

	local b = "Born on or after " + "`y'"
	putexcel B`i' = "`b'"
	putexcel B`j' = "Std. Error", right
	putexcel B`k' = "Prob. > F =", italic right nformat(number_d3) 
	putexcel B`l' = "N =", italic right nformat(number_d3) border(bottom)
	
	preserve
	drop if abs(YOB_d - `y') > 2
	
	quietly reg S `x' `X'
	matrix results = r(table)
	putexcel C`i' = results[1,1], nformat(number_d3)
	putexcel C`j' = results[2,1], nformat(number_d3)
	putexcel C`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel C`l' = matrix(e(N)), nformat(number_d3) border(bottom)

	quietly reg DISCR `x' `X'
	matrix results = r(table)
	putexcel D`i' = results[1,1], nformat(number_d3)
	putexcel D`j' = results[2,1], nformat(number_d3)
	putexcel D`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel D`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_FAM_I `x' `X'
	matrix results = r(table)
	putexcel E`i' = results[1,1], nformat(number_d3)
	putexcel E`j' = results[2,1], nformat(number_d3)
	putexcel E`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel E`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_SOCIAL_I `x' `X'
	matrix results = r(table)
	putexcel F`i' = results[1,1], nformat(number_d3)
	putexcel F`j' = results[2,1], nformat(number_d3)
	putexcel F`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel F`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	restore
	
	local i = `i' + 4
	local j = `j' + 4
	local k = `k' + 4
	local l = `l' + 4
	local m = `m' + 4
	local y = `y' + 1
	
}

/* ------- S8 -------- */


local X INCOME KIDS M SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

putexcel set results_SM.xlsx, modify sheet(S8)
putexcel B1 = "", border(bottom, medium)
putexcel C1 = "Well Being index", border(bottom, medium)
putexcel D1 = "Discrimination P. index", border(bottom, medium)
putexcel E1 = "Family D. P. index", border(bottom, medium)
putexcel F1 = "Social D. P. index", border(bottom, medium)

local y = 1983
local i = 2
local j = 3
local k = 4
local l = 5

foreach x of varlist B_1983-B_1992 {
	

	local b = "Born on or after " + "`y'"
	putexcel B`i' = "`b'"
	putexcel B`j' = "Std. Error", right
	putexcel B`k' = "Prob. > F =", italic right nformat(number_d3) 
	putexcel B`l' = "N =", italic right nformat(number_d3) border(bottom)
	
	preserve
	drop if abs(YOB_d - `y') > 3
	
	quietly reg S `x' `X'
	matrix results = r(table)
	putexcel C`i' = results[1,1], nformat(number_d3)
	putexcel C`j' = results[2,1], nformat(number_d3)
	putexcel C`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel C`l' = matrix(e(N)), nformat(number_d3) border(bottom)

	quietly reg DISCR `x' `X'
	matrix results = r(table)
	putexcel D`i' = results[1,1], nformat(number_d3)
	putexcel D`j' = results[2,1], nformat(number_d3)
	putexcel D`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel D`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_FAM_I `x' `X'
	matrix results = r(table)
	putexcel E`i' = results[1,1], nformat(number_d3)
	putexcel E`j' = results[2,1], nformat(number_d3)
	putexcel E`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel E`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_SOCIAL_I `x' `X'
	matrix results = r(table)
	putexcel F`i' = results[1,1], nformat(number_d3)
	putexcel F`j' = results[2,1], nformat(number_d3)
	putexcel F`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel F`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	restore
	
	local i = `i' + 4
	local j = `j' + 4
	local k = `k' + 4
	local l = `l' + 4
	local m = `m' + 4
	local y = `y' + 1
	
}



/* ------- S9 -------- */


local X INCOME KIDS M SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

putexcel set results_SM.xlsx, modify sheet(S9)
putexcel B1 = "", border(bottom, medium)
putexcel C1 = "Well Being index", border(bottom, medium)
putexcel D1 = "Discrimination P. index", border(bottom, medium)
putexcel E1 = "Family D. P. index", border(bottom, medium)
putexcel F1 = "Social D. P. index", border(bottom, medium)

local y = 1984
local i = 2
local j = 3
local k = 4
local l = 5

foreach x of varlist B_1984-B_1991 {
	

	local b = "Born on or after " + "`y'"
	putexcel B`i' = "`b'"
	putexcel B`j' = "Std. Error", right
	putexcel B`k' = "Prob. > F =", italic right nformat(number_d3) 
	putexcel B`l' = "N =", italic right nformat(number_d3) border(bottom)
	
	preserve
	drop if abs(YOB_d - `y') > 4
	
	quietly reg S `x' `X'
	matrix results = r(table)
	putexcel C`i' = results[1,1], nformat(number_d3)
	putexcel C`j' = results[2,1], nformat(number_d3)
	putexcel C`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel C`l' = matrix(e(N)), nformat(number_d3) border(bottom)

	quietly reg DISCR `x' `X'
	matrix results = r(table)
	putexcel D`i' = results[1,1], nformat(number_d3)
	putexcel D`j' = results[2,1], nformat(number_d3)
	putexcel D`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel D`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_FAM_I `x' `X'
	matrix results = r(table)
	putexcel E`i' = results[1,1], nformat(number_d3)
	putexcel E`j' = results[2,1], nformat(number_d3)
	putexcel E`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel E`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_SOCIAL_I `x' `X'
	matrix results = r(table)
	putexcel F`i' = results[1,1], nformat(number_d3)
	putexcel F`j' = results[2,1], nformat(number_d3)
	putexcel F`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel F`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	restore
	
	local i = `i' + 4
	local j = `j' + 4
	local k = `k' + 4
	local l = `l' + 4
	local m = `m' + 4
	local y = `y' + 1
	
}


/* ------- S10 -------- */


local X INCOME KIDS M SB i.S1_P02 i.S6_P05 i.S1_P04 i.UG_CIUD

putexcel set results_SM.xlsx, modify sheet(S10)
putexcel B1 = "", border(bottom, medium)
putexcel C1 = "Well Being index", border(bottom, medium)
putexcel D1 = "Discrimination P. index", border(bottom, medium)
putexcel E1 = "Family D. P. index", border(bottom, medium)
putexcel F1 = "Social D. P. index", border(bottom, medium)

local y = 1985
local i = 2
local j = 3
local k = 4
local l = 5

foreach x of varlist B_1985-B_1990 {
	

	local b = "Born on or after " + "`y'"
	putexcel B`i' = "`b'"
	putexcel B`j' = "Std. Error", right
	putexcel B`k' = "Prob. > F =", italic right nformat(number_d3) 
	putexcel B`l' = "N =", italic right nformat(number_d3) border(bottom)
	
	preserve
	drop if abs(YOB_d - `y') > 5
	
	quietly reg S `x' `X'
	matrix results = r(table)
	putexcel C`i' = results[1,1], nformat(number_d3)
	putexcel C`j' = results[2,1], nformat(number_d3)
	putexcel C`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel C`l' = matrix(e(N)), nformat(number_d3) border(bottom)

	quietly reg DISCR `x' `X'
	matrix results = r(table)
	putexcel D`i' = results[1,1], nformat(number_d3)
	putexcel D`j' = results[2,1], nformat(number_d3)
	putexcel D`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel D`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_FAM_I `x' `X'
	matrix results = r(table)
	putexcel E`i' = results[1,1], nformat(number_d3)
	putexcel E`j' = results[2,1], nformat(number_d3)
	putexcel E`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel E`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	quietly reg DISCR_SOCIAL_I `x' `X'
	matrix results = r(table)
	putexcel F`i' = results[1,1], nformat(number_d3)
	putexcel F`j' = results[2,1], nformat(number_d3)
	putexcel F`k' = matrix(Ftail(e(df_m), e(df_r), e(F))), nformat(number_d3) 
	putexcel F`l' = matrix(e(N)), nformat(number_d3) border(bottom)
	
	restore
	
	local i = `i' + 4
	local j = `j' + 4
	local k = `k' + 4
	local l = `l' + 4
	local m = `m' + 4
	local y = `y' + 1
	
}


