
Prognostic Potential Predictability (PPP)
==========
>> For calculating Prognostic Potential Predictability (PPP) on nostore-osl 


* The results (in global map) can be found in the following pages. Note that the results won't be shown if the PPP is smaller than 0.001

  * MICOM (docs/PPP_MICOM.markdown)
  * CAM (docs/PPP_MICOM.markdown) 
  * CLM (docs/PPP_MICOM.markdown)
  * CICE (docs/PPP_MICOM.markdown)

### Do these before using the script ###

*  Change the following head parameters in "cheeck_Prognostic_SNR"
  *  DIR="the main output path"
  *  tempDIR="where the temporary files are saved"
  *  casePrefix="a general case name for all ensemble members" 
  *  MEyear="a year which must be existed in all ensemble members. For determining the file prefixes" 
  *  DataDIR="dir for the outputs"

  *  ModelCompartments="ocn atm ice lnd"

* Make sure the data are well-prepared (no missing ensemble member or missing years)

* micom outputs are compressed format, and cannot be processed by "cdo" because each file has different factor and offset. Better convert the outputs to F32 format before using this script.

-------
> Schematic figure on the signal-to-noise ratio 
>> markdown testing....
>>> markdown another testing ...

