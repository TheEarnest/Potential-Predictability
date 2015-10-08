Full field SST assimilated Ocean of NorESM (1st version)
==========

  * The results (in global map) can be found in the following pages. Note that the results won't be shown if the PPP is smaller than __0.001__.

    * [__MICOM__] (FF_ini_try/PPP_ocn.markdown), total figures in ocn (FF_ini_try): __84__
    * [__CAM__] (FF_ini_try/PPP_atm2.markdown), total figures in atm (FF_ini_try): __1066__
    * [__CLM__] (FF_ini_try/PPP_lnd.markdown), total figures in lnd (FF_ini_try): __141__
    * [__CICE__] (FF_ini_try/PPP_ice.markdown), total figures in ice (FF_ini_try): __104__

  * About this analysis:
    * __Finished on 18 Apr. 2015__
    * Data is kept @Norstore-osl:/tape/NS9207K/earnest/NorCPM/FF_ini_try_tar/
    * We using [ Norwegian Earth System Model (NorESM)] (http://folk.uib.no/ngfhd/EarthClim/)
    * Applying full-field SST ([HadISST2](http://www.metoffice.gov.uk/hadobs/hadisst2/)) assimilation ([EnKF](http://enkf.nersc.no/), 30 members) on ocean compartment only
    * From __1980-2007__
    * Known issue: skill lost due to one-grid shift in preparing SST data. It also implies that the PPP of ensemble members is not really robust. 
    * PPP cannot identify this skill loose because the noise is calculated base on the ensemble mean. 
    * Redefine the noise as the spread to observation (SST) can identify this skill loose. 
   * PPP of SST ![] (../figures/FF_ini_try/PPP_PPP-08.cam2.h0.SST.png)
   * PPP (against observation) of SST ![] (../figures/FF_ini_try/Glabal2D_sst_NorCPM_F19_tn21_PP08.nc.png)
   * Prediction Skill of SST ![] (../figures/FF_ini_try/Glabal2D_corr_ACC_SST_r008_08.nc.png)
   * Notes on this prediction:

