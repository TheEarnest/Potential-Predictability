
Prognostic Potential Predictability (PPP)
==========
>> For calculating Prognostic Potential Predictability (PPP) on nostore-osl 

Author: Mao-Lin Shen (E-mail: maolin.shen@uib.no)

  * Notes for Script Developing: 
    * Should noted where is the main scripts sitting
    * Should add the sctipt for calculating PPP with observation 
    * Should add a matlab script for ploting results of vertical section (mainly for MICOM)
    * Figures of the PPP for different levels are not shown because there are too many levels and GitHub can only present the web-page if the page size is smaller than 1MB.


## Analysis:

--------------------------------------
* ### Full field SST assimilated Ocean of NorESM (2nd version)

  * The results (in global map) can be found in the following pages. Note that the results won't be shown if the PPP is smaller than __0.001__.

    * [__MICOM__] (docs/FF_ini_2nd_try/PPP_ocn.markdown), total figures in ocn (FF_ini_2nd_try): __0__
    * [__CAM__] (docs/FF_ini_2nd_try/PPP_atm2.markdown), total figures in atm (FF_ini_2nd_try): __0__
    * [__CLM__] (docs/FF_ini_2nd_try/PPP_lnd.markdown), total figures in lnd (FF_ini_2nd_try): __0__
    * [__CICE__] (docs/FF_ini_2nd_try/PPP_ice.markdown), total figures in ice (FF_ini_2nd_try): __0__

  * About this analysis:
    * __Finished on ?? ?? 2015__
    * Data is kept @Norstore-osl:
    * We using [ Norwegian Earth System Model (NorESM)] (http://folk.uib.no/ngfhd/EarthClim/)
    * Applying full-field SST ([HadISST2](http://www.metoffice.gov.uk/hadobs/hadisst2/)) assimilation ([EnKF](http://enkf.nersc.no/), 30 members) on ocean compartment only
    * From __1970-2010__ (or to 2015, depend on the period of HadISST2)
    * PPP of SST ![] (figures/FF_ini_2nd_try/PPP_PPP-08.cam2.h0.SST.png)
    * PPP (to observation) of SST ![] (figures/FF_ini_2nd_try/Glabal2D_sst_NorCPM_F19_tn21_PP08.nc.png)
    * Prediction Skill of SST ![] (figures/FF_ini_2nd_try/Glabal2D_corr_ACC_SST_r008_08.nc.png)
    * Notes on this prediction:

--------------------------------------
* ### Full field SST assimilated Ocean of NorESM (1st version)

  * The results (in global map) can be found in the following pages. Note that the results won't be shown if the PPP is smaller than __0.001__.

    * [__MICOM__] (docs/FF_ini_try/PPP_ocn.markdown), total figures in ocn (FF_ini_try): __84__
    * [__CAM__] (docs/FF_ini_try/PPP_atm2.markdown), total figures in atm (FF_ini_try): __1066__
    * [__CLM__] (docs/FF_ini_try/PPP_lnd.markdown), total figures in lnd (FF_ini_try): __141__
    * [__CICE__] (docs/FF_ini_try/PPP_ice.markdown), total figures in ice (FF_ini_try): __104__

  * About this analysis:
    * __Finished on 18 Apr. 2015__
    * Data is kept @Norstore-osl:/tape/NS9207K/earnest/NorCPM/FF_ini_try_tar/
    * We using [ Norwegian Earth System Model (NorESM)] (http://folk.uib.no/ngfhd/EarthClim/)
    * Applying full-field SST ([HadISST2](http://www.metoffice.gov.uk/hadobs/hadisst2/)) assimilation ([EnKF](http://enkf.nersc.no/), 30 members) on ocean compartment only
    * From __1980-2007__
    * Known issue: skill lost due to one-grid shift in preparing SST data. It also implies that the PPP of ensemble members is not really robust. 
    * PPP cannot identify this skill loose because the noise is calculated base on the ensemble mean. 
    * Redefine the noise as the spread to observation (SST) can identify this skill loose. 
   * PPP of SST ![] (figures/FF_ini_try/PPP_PPP-08.cam2.h0.SST.png)
   * PPP (to observation) of SST ![] (figures/FF_ini_try/Glabal2D_sst_NorCPM_F19_tn21_PP08.nc.png)
   * Prediction Skill of SST ![] (figures/FF_ini_try/Glabal2D_corr_ACC_SST_r008_08.nc.png)
   * Notes on this prediction:

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


## Working Notes

  * add a global map of SST bias or RMSE
  * Main scripts are sitting @norstore-osl:/norstore_osl/projects/NS9207K/earnest/Analysis/Prognostic-Potential-Predictabil


