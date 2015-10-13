
Prognostic Potential Predictability (PPP)
==========
>> For calculating Prognostic Potential Predictability (PPP) on nostore-osl 
>> Mainly evaluating if the system is well constrained. 

Author: Mao-Lin Shen (E-mail: maolin.shen@uib.no)

  * Figures of the PPP for different levels are not shown because there are too many levels and GitHub can only present the web-page if the page size is smaller than 1MB.


## Analysis:
--------------------------------------
* ### Full Profile assimilated Ocean and State-nudged Atmosphere of NorESM (1st version)

  * About this analysis:
    * __Finished on ?? ?? 2016__
    * Have to wait for Yiguo Wang's work on full profiled assimilation
    * More details can be found in the [description page] (docs/FrontPage.markdown)
    * PPP of SST ![] (figures/FFSSTwiNudA_ini_1st_try/PPP_PPP-08.cam2.h0.SST.png)

--------------------------------------
* ### Full Profile assimilated Ocean of NorESM (1st version)

  * About this analysis:
    * __Finished on ?? ?? 2016__
    * Have to wait for Yiguo Wang's work on full profiled assimilation
    * More details can be found in the [description page] (docs/FrontPage.markdown)
    * PPP of SST ![] (figures/FFSSTwiNudA_ini_1st_try/PPP_PPP-08.cam2.h0.SST.png)


--------------------------------------
* ### Full field SST assimilated Ocean of NorESM (2nd version)

  * About this analysis:
    * __Finished on ?? ?? 2015__
    * More details can be found in the [description page] (docs/FrontPage.markdown)
    * PPP of SST ![] (figures/FF_ini_2nd_try/PPP_PPP-08.cam2.h0.SST.png)

--------------------------------------
* ### [Full field SST assimilated Ocean of NorESM (1st version)] (docs/FrontPage_FF_ini_try.markdown)

  * About this analysis:
   * __Finished on 18 Apr. 2015__
   * More details can be found in the [description page] (docs/FrontPage_FF_ini_try.markdown)
   * PPP of SST ![] (figures/FF_ini_try/PPP_PPP-08.cam2.h0.SST.png)

--------------------------------------
* ### [Uninitialized NorESM (histrical forcing only)] (docs/FrontPage_Historical_forcing_ens.markdown)

  * About this analysis:
   * __Finished on 10 Mar. 2014__
   * More details can be found in the [description page] (docs/FrontPage_Historical_forcing_ens.markdown)
   * PPP of SST ![] (figures/Historical_forcing_ens/PPP_PPP-08.cam2.h0.SST.png)


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
  * Main scripts are sitting @norstore-osl:/norstore_osl/projects/NS9207K/earnest/Analysis/Prognostic-Potential-Predictabil

## Working Notes

  * ./cheeck_Prognostic_SNR[65]: .: line 31: 24098: Memory fault(coredump) for historical ensemble
  * MICOM hy output is missing in the figure list (also fail plot the figures?)
  * Trouble in presenting local maximum predictability!!! (HDF error).
  * Should add the sctipt for calculating PPP with observation
  * Should add a matlab script for ploting results of vertical section (mainly for MICOM)
  * add a global map of SST bias or RMSE


