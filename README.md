
Prognostic Potential Predictability (PPP)
==========
>> For calculating Prognostic Potential Predictability (PPP) on nostore-osl 

Author: Mao-Lin Shen

* The results (in global map) can be found in the following pages. Note that the results won't be shown if the PPP is smaller than __0.001__.

  * [__MICOM__] (docs/PPP_ocn.markdown)
  * [__CAM__] (docs/PPP_atm.markdown) 
  * [__CLM__] (docs/PPP_lnd.markdown)
  * [__CICE__] (docs/PPP_ice.markdown)
* Total figures: 202

* About this analysis:
  * We using NorESM
  * Applying full-field SST (HadISST2) assimilation (EnKF, 30 members) on ocean compartment only
  * From 1980-2007
  * Known issue: skill loose due to one-grid shift in preparing SST data
    * PPP cannot identify this skill loose because the noise is calculated base on the ensemble mean. 
    * Redefine the noise as the spread to observation (SST) can identify this skill loose. 

### Do these before using the script ###

* Change the following head parameters in "cheeck_Prognostic_SNR"
  * DIR="the main output path"
  * tempDIR="where the temporary files are saved"
  * casePrefix="a general case name for all ensemble members" 
  * MEyear="a year which must be existed in all ensemble members. For determining the file prefixes" 
  * DataDIR="dir for the outputs"
  * ModelCompartments="ocn atm ice lnd"

* Before running the script (some known issues)
  * Make sure the data are well-prepared (no missing ensemble member or missing years)
  * micom outputs are compressed format, and cannot be processed by "cdo" because each file has different factor and offset. Better convert the outputs to F32 format before using this script.
  * The script of CAM automatically keeps the output of previous simulation, of which the exported variables are highly possible different with any new simulation. So those files (NorCPM_F19_tn21_mem??.cam2.h0.1979-12.nc in this case) should be removed in advance.   




