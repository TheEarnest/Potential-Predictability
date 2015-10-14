% read ECHAM data//
% by Mao-Lin Shen
format long;close all;
clearvars -except Cvname Svname Cfilename Sfilename CCLevelStepVar1 SCLevelStepVar1 CMinVal CMaxVal SMinVal SMaxVal


if ~isempty(strfind(computer,'MACI64')) || ~isempty(strfind(computer,'Darwin'))
	load /Users/earnestshen/Cloudsky/SkyDrive/Program/Matlab/work/Z_MatFiles/MacBook_Workaround
	addpath /Users/earnestshen/Cloudsky/SkyDrive/Program/Matlab/SelfDefine/export_fig
	addpath /Users/earnestshen/Cloudsky/SkyDrive/Program/Matlab/SelfDefine/m_map
	eval(['addpath ' SDpath])
elseif ~isempty(strfind(computer,'PCWIN64'))
	load D:\MyCloud\SkyDrive\Program\Matlab\work\Z_MatFiles\VAIO_Workaround
	addpath D:\MyCloud\SkyDrive\Program\Matlab\SelfDefine\export_fig
	addpath D:\MyCloud\SkyDrive\Program\Matlab\SelfDefine\m_map
	addpath D:\MyCloud\SkyDrive\Program\Matlab\SelfDefine\export_fig
	eval(['addpath ' SDpath])
elseif ~isempty(strfind(computer,'GLNXA64'))
  addpath /home/uib/earnest/tools/Matlab_SelfDefine
  addpath /home/uib/earnest/tools/Matlab_SelfDefine/m_map
  addpath /home/uib/earnest/tools/Matlab_SelfDefine/mlsDefined
  addpath /home/uib/earnest/tools/Matlab_SelfDefine/strings
else
	error(' No workaround for THIS Machine!!!!!!!!!!!!');
end
%% parameters
% =======================================================
DSep = '/';

imgpref = 'Profile2D';
% -----------------------------------------------------------------------
if ~exist('Cvname','var'), Cvname='templvl'; end
if ~exist('Svname','var'), Svname='templvl'; end
if ~exist('Cfilename','var'), Cfilename='/work/earnest/Analysis/NorCPM_F19_tn21_output/Bias_templvl/WP_templvl_NorCPM_F19_tn21_ensmean_1995_2004.nc'; end
if ~exist('Sfilename','var'), Sfilename='/work/earnest/Analysis/NorCPM_F19_tn21_output/Bias_templvl/WP_Bias_templvl_NorCPM_F19_tn21_ensmean_1995_2004.nc'; end
if ~exist('CMinVal','var'), CMinVal = 0; end
if ~exist('CMaxVal','var'), CMaxVal = 1; end
if ~exist('CCLevelStepVar1','var'), CCLevelStepVar1=0.1; end
if ~exist('SMinVal','var'), SMinVal = 0; end
if ~exist('SMaxVal','var'), SMaxVal = 1; end
if ~exist('SCLevelStepVar1','var'), SCLevelStepVar1=0.1; end

% -----------------------------------------------------------------------
MaxDepth =4000; 
ScreenPos = [74     56   1111    629];

temp = strsplit(Cfilename, DSep);
CaseName = temp{end}

Data = readnetcdf_one(Cfilename, Cvname); 
Cvar = Data.data(:,:,3); Cvar(Cvar > 100) = NaN;
%Clong = Data.lon; 
Clati = Data.lat; 
Cdepth = Data.depth_bnds(1,:);
%Cdepth = Data.depth;
%if (length(Clong) > 1)
%  [mCx, mCdepth] = meshgrid(Clong, Cdepth);
%elseif (length(Clati) > 1)
  [mCx, mCdepth] = meshgrid(Clati, Cdepth);
%end

Data = readnetcdf_one(Sfilename, Svname); 
%if ~exist('Data.att_add_offset','var')
%  Svar = Data.data.*double(Data.att_scale_factor) + double(Data.att_add_offset);
%  Svar(Svar < -100) = NaN;
%else
  Svar = Data.data(:,:,3); Svar(Svar > 100) = NaN;
%end
%Slong = Data.lon; 
Slati = Data.lat; 
Sdepth = Data.depth_bnds(1,:);
%if (length(Slong) > 1)
%  [mSx, mSdepth] = meshgrid(Slong, Sdepth);
%elseif (length(Slati) > 1)
  [mSx, mSdepth] = meshgrid(Slati, Sdepth);
%end
mCvar = squeeze(Cvar)';
mSvar = squeeze(Svar)';

% -----------------------------------------------------------------------
%% plot figure 
%
FigID = figure; hold on; set(FigID,'position', ScreenPos, 'color', [1 1 1], 'Visible', 'off');hold on;
%FigID = figure; hold on; set(FigID,'position', ScreenPos, 'color', [1 1 1], 'Visible', 'on');hold on;

%pcolor(mSx, mSdepth, mSvar); shading interp; hold on
%[SCC, SMHC] = contour(mSx, mSdepth, mSvar, 'Fill', 'on');
%HB = colorbar;
%caxis([SMinVal SMaxVal])
if CMaxVal > 10
  %CLevel = [CMinVal:CCLevelStepVar1/4:(4-CCLevelStepVar1/4)  4:CCLevelStepVar1:CMaxVal]; 
  CLevel = [CMinVal:CCLevelStepVar1:CMaxVal];
else
  CLevel = CMinVal:CCLevelStepVar1:CMaxVal;
end
[CC, MHC] = contour(mCx, mCdepth, mCvar, 'k-', 'LevelList', CLevel, 'ShowText','on'); 
%[CC, MHC] = contour(mlon, mlat, mmvar, 'k-', 'LevelList', MinVal:CLevelStepVar1:MaxVal);
% -----------------------------------------------------------------------
nLines = numel(get(MHC,'Children'));  % get the number of contour lines
pH = get(MHC,'Children'); % control of each contour line
clear CDV; CDV = zeros(1).*NaN;
for iL = 1:nLines
  %CDV(iL) = {[(min(get(pH(iL),'Cdata'))+max(get(pH(iL),'Cdata')))/2]}; % take the value of contour
  if strcmp(get(pH(iL),'type'), 'patch')
    CDV(iL) = (min(get(pH(iL),'Cdata'))+max(get(pH(iL),'Cdata')))/2;  % take the value of contour
  else
    set(pH(iL),'fontsize', 10)
  end
end
% find CP == 0  ---------------------------------------------------
ZeroHD = pH(CDV>=0);
for izh = 1:length(ZeroHD)
  %zhLo = get(ZeroHD(izh),'XData');zhLa = get(ZeroHD(izh),'YData');
  %HP = plot(zhLo,zhLa,'k');
  %set(HP, 'LineStyle','--', 'LineWidth', 3)
  set(ZeroHD(izh), 'LineWidth', 1.5, 'linestyle', '-')
end
% find CP < 0  ---------------------------------------------------
ZeroHD = pH(CDV<0);
for izh = 1:length(ZeroHD)
  %zhLo = get(ZeroHD(izh),'XData');zhLa = get(ZeroHD(izh),'YData');
  %HP = plot(zhLo,zhLa,'k');
  %set(HP, 'LineStyle','--', 'LineWidth', 3)
  set(ZeroHD(izh), 'LineWidth', 1.5, 'linestyle', '--')
end
% -----------------------------------------------------------------------
pcolor(mSx, mSdepth, mSvar); shading interp
%[SCC, SMHC] = contourf(mSx, mSdepth, mSvar);
HB = colorbar;
caxis([SMinVal SMaxVal])
shadingIntDiv = (SMaxVal-SMinVal)/SCLevelStepVar1;
lim = get(gca,'clim');
%mycmap = redblue((lim(2)-lim(1))*4*shadingIntDiv);
mycmap = redblue(4*shadingIntDiv);
acmap = mycmap(1:4:end,:); %acmap(end/2:(end/2+1),:) = 1;
colormap(acmap);

yHL = ylabel('Depth (m)', 'fontsize', 16);
%if (length(Clong) > 1)
%  set(gca, 'XTick', -170:10:170)
%  set(gca, 'XTickLabel', ['170W';'160W';'150W';'140W';'130W';'120W';'110W'; ...
%                          '110W';'100W';' 90W';' 80W';' 70W';' 60W';' 50W'; ...
%                          ' 40W';' 30W';' 20W';' 10W';'   0';' 10E';' 20E'; ...
%                          ' 30E';' 40E';' 50E';' 60E';' 70E';' 80E';' 90E'; ...
%                          '100E';'110E';'120E';'130E';'140E';'150E';'160E'; ...
%                          '170E'])
%elseif (length(Clati) > 1)
  set(gca, 'XTick', -70:10:70)
  set(gca, 'XTickLabel', ['70S';'60S';'50S';'40S';'30S';'20S';'10S';'  0'; ...
                          '10N';'20N';'30N';'40N';'50N';'60N';'70N'; ...
                          ])
%end

axis([min(mCx(:)) max(mCx(:)) 0 MaxDepth])
box on;
set(gca, 'fontsize', 14, 'YDir', 'reverse', 'linewidth', 2)
%return

title(Cfilename);


figfilename = [imgpref '_' Cvname '_' CaseName '.png']
%mlstightmargin(gca, 0.5);
%IMG_now = getframe(gcf); imwrite(IMG_now.cdata, filename);
set(gcf,'PaperPositionMode','auto')
eval(['print -dpng ' figfilename ])

%eval(['export_fig(''' num2str(FigID) ''', ''' filename(1:end-3)  'pdf'' )']);
%eval(['print -f' num2str(1) '  -dpdf -r300 -opengl ''' filename(1:end-3)  'pdf'' ']); 


