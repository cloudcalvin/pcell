;;; CDF GENERATION OF tg_inv

strCellName="ind_sdual";   The Cell Name is called inductor

cellId = ddGetObj(strLibName strCellName)
if(g_cdfDataId = cdfGetBaseCellCDF(cellId)
then
        ret = cdfDeleteCDF(g_cdfDataId)
        fprintf(stderr "*** CDF of %L deleted (%L)\n" strCellName ret)
)

g_cdfDataId = cdfCreateBaseCellCDF(cellId ?fieldWidth 580 ?fieldHeight 35 ?buttonFieldWidth 340 ?promptWidth 300)

cdfCreateParam(g_cdfDataId ?name "OD_STR" ?type "string" ?defValue "50u" ?prompt "Outer Diameter" ?display "t" ?editable "t" 
		?storeDefault nil  ?callback "" ?parseAsCEL "yes" ?units "lengthMetric" ?parseAsNumber "yes") 
cdfCreateParam(g_cdfDataId ?name "W_STR" ?type "string" ?defValue "2u" 	?prompt "Width" ?display "t" ?editable "t" 
		?storeDefault nil  ?callback "" ?parseAsCEL "yes" ?units "lengthMetric" ?parseAsNumber "yes") 

cdfCreateParam(g_cdfDataId ?name "GND_ME_STR" ?type "cyclic" ?defValue "3" ?choices list("1" "2" "3" "4" "5" "6" "7" "8" "9") ?prompt "Ground Metal" ?display "t" ?editable "t" 
	?storeDefault nil  ?callback "cdfgData->GND_ME->value = atoi(cdfgData->GND_ME_STR->value)" )
cdfCreateParam(g_cdfDataId ?name "GND_ME" ?type "int" ?defValue 3 ?prompt "Turns(int)" ?display "nil" ?editable "nil" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "NT_N" ?type "boolean" ?defValue nil ?prompt "Native N-TYPE doping" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "short1" ?type "boolean" ?defValue nil ?prompt "Short Port 1" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "gnd1" ?type "boolean" ?defValue nil ?prompt "GND Port 1" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "short2" ?type "boolean" ?defValue nil ?prompt "Short Port 2" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "gnd2" ?type "boolean" ?defValue nil ?prompt "GND Port 2" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sig1" ?type "boolean" ?defValue nil ?prompt "SIGNAL Port 1" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "sig2" ?type "boolean" ?defValue nil ?prompt "SIGNAL Port 2" ?display "t" ?editable "t" ?storeDefault nil ?parseAsCEL "no" ?callback "")
cdfCreateParam(g_cdfDataId ?name "LEAD" ?type "float" ?defValue 10.0	?prompt "Lead Length" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "L1" ?type "string" ?defValue "488p" ?prompt "Main Inductance" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R1" ?type "string" ?defValue "2.1305" ?prompt "R1" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "L2" ?type "string" ?defValue "1.4836n" ?prompt "Secondary Inductance" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "inductance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "R2" ?type "string" ?defValue "11.904" ?prompt "R2" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "C12" ?type "string" ?defValue "14.67f" ?prompt "C12" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS1" ?type "string" ?defValue "17.67f" ?prompt "CS1" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS3" ?type "string" ?defValue "17.824f" ?prompt "CS3" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS5" ?type "string" ?defValue "3.427k" ?prompt "RS5" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS5" ?type "string" ?defValue "2.32f" ?prompt "CS5" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")

cdfCreateParam(g_cdfDataId ?name "RS7" ?type "string" ?defValue "3.36k" ?prompt "RS7" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "resistance" ?parseAsNumber "yes" ?callback "")
cdfCreateParam(g_cdfDataId ?name "CS7" ?type "string" ?defValue "2.5f" ?prompt "CS7" ?display "t" ?editable "t"
    ?storeDefault nil ?parseAsCEL "yes" ?units "capacitance" ?parseAsNumber "yes" ?callback "")


cdfCreateParam(g_cdfDataId ?name "SS_Gap1" ?type "float" ?defValue 3.0	
	?prompt "Signal to Signal Gap 1" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "SG_Gap1" ?type "float" ?defValue 3.0	
	?prompt "Signal to Grounp Gap 1" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "SS_Gap2" ?type "float" ?defValue 3.0	
	?prompt "Signal to Signal Gap 2" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")
cdfCreateParam(g_cdfDataId ?name "SG_Gap2" ?type "float" ?defValue 3.0	
	?prompt "Signal to Grounp Gap 2" ?display "t" ?editable "t" ?storeDefault nil  ?callback "")

cdfCreateParam(g_cdfDataId ?name "strName" ?type "string" ?defValue "ind_dual" ?prompt "instance name" ?display "nil" ?editable "nil" 	?storeDefault nil ?parseAsCEL "no"  ?callback "")



g_cdfDataId->simInfo = list( nil )
cdfSaveCDF( g_cdfDataId )

;libpath = dbFullLibPath(strLibName)
;cdfDump(strLibName strcat(libpath "/" strCellName ".cdf") ?cellName strCellName ?level 'base ?edit nil)
