
For calculating Prognostic Potential Predictability (PPP) on nostore-osl
==========

Do these before using the script
------

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


> Schematic figure on the signal-to-noise ratio 
>> markdown testing....

