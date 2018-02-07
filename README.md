
Prognostic Potential Predictability (PPP)
==========
>> For calculating Prognostic Potential Predictability (PPP) on nostore-osl 
>> Mainly evaluating if the system is well constrained. 

Author: Mao-Lin Shen (E-mail: maolin.shen@uib.no)

  * Figures of the PPP for different levels are not shown because there are too many levels and GitHub can only present the web-page if the page size is smaller than 1MB.

  * There are too many figures (over 32,000 figures and will be more). Therefore I have to seperate code and [the results (PPP-Results)] (https://github.com/TheEarnest/PPP-Results).


------------------
## Do these before using the script ##

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
  * MICOM & ICE outputs have to be regridded before ploting
  * Main scripts are sitting @norstore-osl:/norstore_osl/projects/NS9207K/earnest/Analysis/Prognostic-Potential-Predictabil

## Working Notes

  * change all set of figures from PPP to SNR 
  * should add a script to check PPP evolving (comparing spatial std in this case, and focus on SST only) (Note: fldvar/fldcorr is not helpful)
  * Should build a system to counter check the files
  * uploading the nc files of PPP as well??
  * From PPP to evaluate prediction barrier/uncertainty - comparing to ENSO prediction barrier 
  * add post process: skip some orginal output and adding more diag variables
  * the ploting script has to be revised to get a better presentation, ie thiner colorbar, grids lines (not urgent)
  * MICOM hy output is missing in the figure list (also fail plot the figures?)
  * Trouble in presenting local maximum predictability!!! (HDF error).
  * Should add the sctipt for calculating PPP with observation
  * Should add a matlab script for ploting results of vertical section (mainly for MICOM)
  * add a global map of SST bias or RMSE
  * add Seasonal, 5-year pantad, decadal pantad results
  * Sometime the model might write different number of variables when restart files were generated. (error handling is necessary) 
 
