
% CorrCountMac v 1.2, Randall Marrett copyright 2016

function varargout = CorrCountMac(varargin)
%CORRCOUNTMAC M-file for CorrCountMac.fig
%      CORRCOUNTMAC, by itself, creates a new CORRCOUNTMAC or raises the existing
%      singleton*.
%
%      H = CORRCOUNTMAC returns the handle to a new CORRCOUNTMAC or the handle to
%      the existing singleton*.
%
%      CORRCOUNTMAC('Property','Value',...) creates a new CORRCOUNTMAC using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to CorrCountMac_OpeningFcn.  This calling syntax produces
%      a warning when there is an existing singleton*.
%
%      CORRCOUNTMAC('CALLBACK') and CORRCOUNTMAC('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CORRCOUNTMAC.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CorrCountMac

% Last Modified by GUIDE v2.5 24-Oct-2016 00:41:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CorrCountMac_OpeningFcn, ...
                   'gui_OutputFcn',  @CorrCountMac_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before CorrCountMac is made visible.
function CorrCountMac_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% UIWAIT makes CorrCountMac wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Choose default command line output for CorrCountMac
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Set default control values
handles.inputpath = 0;
% handles.Statistics = {'Current File = ' 'Scanline Length/Time = ' ...
%     'Feature Count = ' 'Spacing Count = ' 'Separation Count = ' ...
%     'Extension = ' 'Mean Spacing = ' 'Standard Deviation = ' 'Cv = '};
handles.Statistics = {'Current File = ' 'Feature Pairs = ' ...
    '     Count = ' '     Sum = ' '     Cv = ' '     Mean = ' ...
    'Spacing Count = ' '     Sum = ' '     Cv = ' '     Mean = '};
set(handles.StatisticsText, 'String', handles.Statistics);
handles.InsertFeatures = 1;
set(handles.InsertFeaturesOn, 'Value', handles.InsertFeatures);

handles.ScanSubdomain = 0;
handles.StartScan = 0;
handles.EndScan = 100;

set(handles.ScanSubdomainOn, 'Value', handles.ScanSubdomain);
set(handles.StartScanEdit, 'String', [num2str(handles.StartScan) ' ']);
set(handles.StartScanEdit, 'Value', handles.StartScan);
set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
set(handles.EndScanEdit, 'Value', handles.EndScan);
set(handles.StartScanEdit,'Enable','off');
set(handles.EndScanEdit,'Enable','off');

handles.SizeSubset = 0;
handles.MinSize = 0;
handles.MaxSize = 100;

set(handles.SizeSubsetOn, 'Value', handles.SizeSubset);
set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
set(handles.MinSizeEdit, 'Value', handles.MinSize);
set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
set(handles.MinSizeEdit,'Enable','off');
set(handles.MaxSizeEdit,'Enable','off');

handles.Analytical = 1;
handles.MonteCarlo = 0;
handles.ConfidenceInterval = 2;
handles.Confidence = '95% confidence limits';
handles.ZeeScore = 1.96;
handles.RandomIterations = 100;
handles.NeedNewRandom = 0;

set(handles.AnalyticalOn, 'Value', handles.Analytical);
% set(handles.AnalyticalOn,'Enable','off');
set(handles.MonteCarloOn, 'Value', handles.MonteCarlo);
set(handles.ConfidenceIntervalPopup, 'Value', handles.ConfidenceInterval);
set(handles.RandomIterationsEdit, 'String', ...
	[num2str(handles.RandomIterations) ' ']);
set(handles.RandomIterationsEdit, 'Value', handles.RandomIterations);
set(handles.RandomIterationsEdit,'Enable','off');
set(handles.CalcRandomButton,'Enable','off');
set(handles.SaveRandomButton,'Enable','off');

handles.Graduations = 1;
handles.NumLags = 100;
handles.MinLag = 0;
handles.MaxLag = 100;

set(handles.GraduationsPopup, 'Value', handles.Graduations);
set(handles.NumLagsEdit, 'String', [num2str(handles.NumLags) ' ']);
set(handles.NumLagsEdit, 'Value', handles.NumLags);
set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
set(handles.MinLagEdit, 'Value', handles.MinLag);
set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
set(handles.MaxLagEdit, 'Value', handles.MaxLag);

handles.UserAxes = 0;
handles.MinY = 0.1;
handles.MaxY = 10;
handles.MinX = 0.1;
handles.MaxX = 10;

set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
set(handles.MinYEdit, 'Value', handles.MinY);
set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
set(handles.MaxYEdit, 'Value', handles.MaxY);
set(handles.MinYEdit,'Enable','off');
set(handles.MaxYEdit,'Enable','off');

set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
set(handles.MinXEdit, 'Value', handles.MinX);
set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
set(handles.MaxXEdit, 'Value', handles.MaxX);
set(handles.MinXEdit,'Enable','off');
set(handles.MaxXEdit,'Enable','off');

handles.Units = 2;
handles.UnitLabel = 'm';
handles.XLabel = 'Length Scale (m)';
handles.Windowing = 0;
handles.Normalized = 1;
handles.Weighted = 0;
handles.Switch = 2;

set(handles.UnitsPopup, 'Value', handles.Units);
set(handles.WindowingEdit, 'String', [num2str(handles.Windowing) ' ']);
set(handles.WindowingEdit, 'Value', handles.Windowing);
set(handles.NormalizedOn, 'Value', handles.Normalized);
set(handles.WeightedOn, 'Value', handles.Weighted);

set(handles.CCButton,'Enable','on');
set(handles.CSButton,'Enable','off');
set(handles.IntensityButton,'Enable','on');
set(handles.StaircaseButton,'Enable','off');
set(handles.DiscSpacingButton,'Enable','off');
set(handles.CumSpacingButton,'Enable','off');

set(handles.FourierButton,'Enable','on');
set(handles.WaveletButton,'Enable','off');
set(handles.IntervalCountButton,'Enable','off');
set(handles.SemivarioButton,'Enable','off');

set(handles.SaveGraphButton,'Enable','off');
set(handles.SaveDataButton,'Enable','off');

set(handles.PlotAxes,'Visible','off');

handles.PlotType = 0;

guidata(hObject,handles);


% --- Outputs from this function are returned to the command line.
function varargout = CorrCountMac_OutputFcn(~, ~, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, ~, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

guidata(hObject,handles);




% --- Executes on button press in OkayButton.
function OkayButton_Callback(hObject, ~, handles)
% hObject    handle to OkayButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.OkayButton,'Visible','off');
set(handles.IntroText,'Visible','off');
set(handles.IntroPanel,'Visible','off');

% open input file and read data
if handles.inputpath ~= 0
	cd(handles.inputpath);
end

[handles.inputfile, handles.inputpath] = uigetfile('*.txt', ...
	'Choose an INPUT .txt file:');
[inputID, message] = fopen([handles.inputpath, handles.inputfile], 'r');
if inputID == -1
	disp(message)
end

input = fscanf(inputID, '%g %g', [2 inf]);
input = input';

% check for aborted fscanf due to non-numeric input
D = textscan(inputID, '%s');
TestSize = size(D{1,1});
Test = TestSize(1,1);

% close input file
fclose(inputID);

set(handles.PlotAxes,'Visible','on');

if handles.MonteCarlo == 1
	handles.NeedNewRandom = 1;
end

% check for spacings of zero, negative inputs, NaN
if min(input(1:size(input),1)) <= 0 || min(input(1:size(input),2)) < 0 ...
		|| Test ~= 0
	
	message = sprintf('One or more of your input values is problematic:\nspacing <= 0, feature size < 0, or non-numeric input.');
	warndlg(message, 'Uh oh ...', 'modal');
	
else

% determine number of input fracture apertures and spacings
handles.SpacingCount = size(input,1);
handles.ApertureCount = handles.SpacingCount - 1;

% parse fracture aperture and spacing data
handles.Spacing(1:handles.SpacingCount,1) = ...
	input(1:handles.SpacingCount,1);
handles.Aperture(1:handles.ApertureCount,1) = ...
	input(1:handles.ApertureCount,2);

% calculate descriptive statistics of fracture data set
handles.SeparationCount = ...
	handles.ApertureCount*(handles.ApertureCount-1)/2;
handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount) ...
	.* handles.Aperture(1:handles.ApertureCount));
handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
	/ mean(handles.Aperture(1:handles.ApertureCount));
if handles.InsertFeatures == 1
	handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
else
	handles.ScanlineLength = handles.SumSpacing;	
end
if handles.InsertFeatures == 1
	handles.Extension = handles.SumAperture / handles.SumSpacing;
else
	handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
end
handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) ...
	/ mean(handles.Spacing(1:handles.SpacingCount));

% calculate size distribution of fracture apertures and spacings
[handles.SpacingSize, handles.SpacingNum] = ...
	SizeDistribution(handles.Spacing, handles.SpacingCount);
[handles.ApertureSize, handles.ApertureNum] = ...
	SizeDistribution(handles.Aperture, handles.ApertureCount);

%reserve full data set in memory
handles.FullSpacing = handles.Spacing;
handles.FullAperture = handles.Aperture;

handles.FullSpacingCount = handles.SpacingCount;
handles.FullApertureCount = handles.ApertureCount;

handles.FullSpacingNum = handles.SpacingNum;
handles.FullApertureNum = handles.ApertureNum;

handles.FullMinSize = handles.ApertureSize(handles.ApertureNum,1);
handles.FullMaxSize = handles.ApertureSize(1,1);

handles.DomainMinSize = handles.FullMinSize;
handles.DomainMaxSize = handles.FullMaxSize;

handles.FullScanlineLength = handles.ScanlineLength;

% update StatisticsText
handles.Statistics = {['Current File = ' handles.inputfile] ...
    sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
    sprintf('     Count = %7.0f', handles.ApertureCount) ...
    sprintf('     Sum = %12.4f', handles.SumAperture) ...
    sprintf('     Cv = %7.2f', handles.CvAp) ...
    sprintf('     Mean = %10.4f', ...
        mean(handles.Aperture(1:handles.ApertureCount))) ...
    sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
    sprintf('     Sum = %12.4f', handles.SumSpacing) ...
    sprintf('     Cv = %7.2f', handles.Cv), ...
    sprintf('     Mean = %10.4f', ...
		mean(handles.Spacing(1:handles.SpacingCount)))};
% handles.Statistics = {['Current File = ' handles.inputfile] ...
%     sprintf('Scanline Length/Time = %12.4f', handles.ScanlineLength) ...
%     sprintf('Feature Count = %7.0f', handles.ApertureCount) ...
%     sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
%     sprintf('Separation Count = %12.0f', handles.SeparationCount) ...
%     sprintf('Extension = %8.6f', handles.Extension) ...
%     sprintf('Mean Spacing = %10.4f', ...
% 		mean(handles.Spacing(1:handles.SpacingCount))) ...
%     sprintf('Standard Deviation = %10.4f', ...
% 		std(handles.Spacing(1:handles.SpacingCount))) ...
%     sprintf('Cv = %7.4f', handles.Cv)};
set(handles.StatisticsText, 'String', handles.Statistics);

% set default control values
handles.ScanSubdomain = 0;
handles.StartScan = 0;
handles.EndScan = handles.ScanlineLength;

set(handles.ScanSubdomainOn, 'Value', handles.ScanSubdomain);
set(handles.StartScanEdit, 'String', [num2str(handles.StartScan) ' ']);
set(handles.StartScanEdit, 'Value', handles.StartScan);
set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
set(handles.EndScanEdit, 'Value', handles.EndScan);
set(handles.StartScanEdit,'Enable','off');
set(handles.EndScanEdit,'Enable','off');

handles.SizeSubset = 0;
handles.MinSize = handles.FullMinSize;
handles.MaxSize = handles.FullMaxSize;

set(handles.SizeSubsetOn, 'Value', handles.SizeSubset);
set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
set(handles.MinSizeEdit, 'Value', handles.MinSize);
set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
set(handles.MinSizeEdit,'Enable','off');
set(handles.MaxSizeEdit,'Enable','off');

handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
handles.MaxLag = handles.ScanlineLength;

set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
set(handles.MinLagEdit, 'Value', handles.MinLag);
set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
set(handles.MaxLagEdit, 'Value', handles.MaxLag);

handles.UserAxes = 0;
handles.MinY = 0.1;
handles.MaxY = 10;
handles.MinX = 0.1;
handles.MaxX = 10;

set(handles.UserAxesOn, 'Value', handles.UserAxes);

set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
set(handles.MinYEdit, 'Value', handles.MinY);
set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
set(handles.MaxYEdit, 'Value', handles.MaxY);
set(handles.MinYEdit,'Enable','off');
set(handles.MaxYEdit,'Enable','off');

set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
set(handles.MinXEdit, 'Value', handles.MinX);
set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
set(handles.MaxXEdit, 'Value', handles.MaxX);
set(handles.MinXEdit,'Enable','off');
set(handles.MaxXEdit,'Enable','off');

end

guidata(hObject, handles);


% --- Executes on button press in OpenFileButton.
function OpenFileButton_Callback(hObject, ~, handles)
% hObject    handle to OpenFileButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% open input file and read data
if handles.inputpath ~= 0
    originalpath = cd;
	cd(handles.inputpath);
end

[handles.inputfile, handles.inputpath] = uigetfile('*.txt', ...
	'Choose an INPUT .txt file:');
[inputID, message] = fopen([handles.inputpath, handles.inputfile], 'r');
if inputID == -1
	disp(message)
end

input = fscanf(inputID, '%g %g', [2 inf]);
input = input';

% check for aborted fscanf due to non-numeric input
D = textscan(inputID, '%s');
TestSize = size(D{1,1});
Test = TestSize(1,1);

% close input file
fclose(inputID);

% reset directory to original %this and following 2 lines %2016-09-06-1.00
%if handles.inputpath ~= 0
%	cd(originalpath);
%end

% reset directory to original
cd(originalpath);

%if handles.MonteCarlo == 1 %this and following 2 lines %2016-09-06-1.00
%	handles.NeedNewRandom = 1;
%end

% check for spacings of zero, negative inputs, NaN
if min(input(1:size(input),1)) <= 0 || min(input(1:size(input),2)) < 0 ...
		|| Test ~= 0
	
	message = sprintf('One or more of your input values is problematic:\nspacing <= 0, feature size < 0, or non-numeric input.');
	warndlg(message, 'Uh oh ...', 'modal');
	
else

% clear Spacing and Aperture arrays before starting
handles.FullSpacing = zeros(1,1);
handles.FullAperture = zeros(1,1);

handles.Spacing = zeros(1,1);
handles.Aperture = zeros(1,1);

handles.SpacingSize = zeros(1,2);
handles.ApertureSize = zeros(1,2);

% determine number of input fracture apertures and spacings
handles.SpacingCount = size(input,1);
handles.ApertureCount = handles.SpacingCount - 1;

% parse fracture aperture and spacing data
handles.Spacing(1:handles.SpacingCount,1) = ...
	input(1:handles.SpacingCount,1);
handles.Aperture(1:handles.ApertureCount,1) = ...
	input(1:handles.ApertureCount,2);

% calculate descriptive statistics of fracture data set
handles.SeparationCount = ...
	handles.ApertureCount*(handles.ApertureCount-1)/2;
handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount) ...
	.* handles.Aperture(1:handles.ApertureCount));
handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
	/ mean(handles.Aperture(1:handles.ApertureCount));
if handles.InsertFeatures == 1
	handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
else
	handles.ScanlineLength = handles.SumSpacing;	
end
if handles.InsertFeatures == 1
	handles.Extension = handles.SumAperture / handles.SumSpacing;
else
	handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
end
handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
	mean(handles.Spacing(1:handles.SpacingCount));

% calculate size distribution of fracture apertures and spacings
[handles.SpacingSize, handles.SpacingNum] = ...
	SizeDistribution(handles.Spacing, handles.SpacingCount);
[handles.ApertureSize, handles.ApertureNum] = ...
	SizeDistribution(handles.Aperture, handles.ApertureCount);

%reserve full data set in memory
handles.FullSpacing = handles.Spacing;
handles.FullAperture = handles.Aperture;

handles.FullSpacingCount = handles.SpacingCount;
handles.FullApertureCount = handles.ApertureCount;

handles.FullSpacingNum = handles.SpacingNum;
handles.FullApertureNum = handles.ApertureNum;

handles.FullMinSize = handles.ApertureSize(handles.ApertureNum,1);
handles.FullMaxSize = handles.ApertureSize(1,1);

handles.DomainMinSize = handles.FullMinSize;
handles.DomainMaxSize = handles.FullMaxSize;

handles.FullScanlineLength = handles.ScanlineLength;

% update StatisticsText
handles.Statistics = {['Current File = ' handles.inputfile] ...
    sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
    sprintf('     Count = %7.0f', handles.ApertureCount) ...
    sprintf('     Sum = %12.4f', handles.SumAperture) ...
    sprintf('     Cv = %7.2f', handles.CvAp) ...
    sprintf('     Mean = %10.4f', ...
        mean(handles.Aperture(1:handles.ApertureCount))) ...
    sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
    sprintf('     Sum = %12.4f', handles.SumSpacing) ...
    sprintf('     Cv = %7.2f', handles.Cv), ...
    sprintf('     Mean = %10.4f', ...
		mean(handles.Spacing(1:handles.SpacingCount)))};
set(handles.StatisticsText, 'String', handles.Statistics);

% set default control values
handles.ScanSubdomain = 0;
handles.StartScan = 0;
handles.EndScan = handles.ScanlineLength;

set(handles.ScanSubdomainOn, 'Value', handles.ScanSubdomain);
set(handles.StartScanEdit, 'String', [num2str(handles.StartScan) ' ']);
set(handles.StartScanEdit, 'Value', handles.StartScan);
set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
set(handles.EndScanEdit, 'Value', handles.EndScan);
set(handles.StartScanEdit,'Enable','off');
set(handles.EndScanEdit,'Enable','off');

handles.SizeSubset = 0;
handles.MinSize = handles.FullMinSize;
handles.MaxSize = handles.FullMaxSize;

set(handles.SizeSubsetOn, 'Value', handles.SizeSubset);
set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
set(handles.MinSizeEdit, 'Value', handles.MinSize);
set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
set(handles.MinSizeEdit,'Enable','off');
set(handles.MaxSizeEdit,'Enable','off');

handles.Analytical = 1; %this and following 14 lines %2016-09-05-23.55
handles.MonteCarlo = 0;
%handles.ConfidenceInterval = 2;
%handles.RandomIterations = 100;
handles.NeedNewRandom = 0;

set(handles.AnalyticalOn, 'Value', handles.Analytical);
set(handles.MonteCarloOn, 'Value', handles.MonteCarlo);
%set(handles.ConfidenceIntervalPopup, 'Value', handles.ConfidenceInterval);
%set(handles.RandomIterationsEdit, 'String', ...
%	[num2str(handles.RandomIterations) ' ']);
%set(handles.RandomIterationsEdit, 'Value', handles.RandomIterations);
%set(handles.RandomIterationsEdit,'Enable','off');
set(handles.CalcRandomButton,'Enable','off');
set(handles.SaveRandomButton,'Enable','off');

handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
handles.MaxLag = handles.ScanlineLength;

set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
set(handles.MinLagEdit, 'Value', handles.MinLag);
set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
set(handles.MaxLagEdit, 'Value', handles.MaxLag);

handles.UserAxes = 0;
handles.MinY = 0.1;
handles.MaxY = 10;
handles.MinX = 0.1;
handles.MaxX = 10;

set(handles.UserAxesOn, 'Value', handles.UserAxes);

set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
set(handles.MinYEdit, 'Value', handles.MinY);
set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
set(handles.MaxYEdit, 'Value', handles.MaxY);
set(handles.MinYEdit,'Enable','off');
set(handles.MaxYEdit,'Enable','off');

set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
set(handles.MinXEdit, 'Value', handles.MinX);
set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
set(handles.MaxXEdit, 'Value', handles.MaxX);
set(handles.MinXEdit,'Enable','off');
set(handles.MaxXEdit,'Enable','off');

set(handles.CCButton,'Enable','on');
set(handles.CSButton,'Enable','off');
set(handles.IntensityButton,'Enable','on');
set(handles.StaircaseButton,'Enable','off');
set(handles.DiscSpacingButton,'Enable','off');
set(handles.CumSpacingButton,'Enable','off');

set(handles.FourierButton,'Enable','on');
set(handles.WaveletButton,'Enable','off');
set(handles.IntervalCountButton,'Enable','off');
set(handles.SemivarioButton,'Enable','off');

end

guidata(hObject, handles);


% --- Executes on button press in DefaultAnalysisButton.
function DefaultAnalysisButton_Callback(hObject, ~, handles)
% hObject    handle to DefaultAnalysisButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% reset input to full Spacing and Aperture arrays
handles.Spacing = zeros(handles.FullSpacingCount,1);
handles.Aperture = zeros(handles.FullApertureCount,1);

handles.SpacingSize = zeros(1,2);
handles.ApertureSize = zeros(1,2);

handles.Spacing = handles.FullSpacing;
handles.Aperture = handles.FullAperture;

handles.SpacingCount = handles.FullSpacingCount;
handles.ApertureCount = handles.FullApertureCount;

% recalculate descriptive statistics of full fracture data set
handles.SeparationCount = ...
	handles.ApertureCount*(handles.ApertureCount-1)/2;
handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount) ...
	.* handles.Aperture(1:handles.ApertureCount));
handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
	/ mean(handles.Aperture(1:handles.ApertureCount));
if handles.InsertFeatures == 1
	handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
else
	handles.ScanlineLength = handles.SumSpacing;	
end
if handles.InsertFeatures == 1
	handles.Extension = handles.SumAperture / handles.SumSpacing;
else
	handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
end
handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
	mean(handles.Spacing(1:handles.SpacingCount));

% recalculate size distribution of fracture apertures and spacings
[handles.SpacingSize, handles.SpacingNum] = ...
	SizeDistribution(handles.Spacing, handles.SpacingCount);
[handles.ApertureSize, handles.ApertureNum] = ...
	SizeDistribution(handles.Aperture, handles.ApertureCount);

% update StatisticsText
handles.Statistics = {['Current File = ' handles.inputfile] ...
    sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
    sprintf('     Count = %7.0f', handles.ApertureCount) ...
    sprintf('     Sum = %12.4f', handles.SumAperture) ...
    sprintf('     Cv = %7.2f', handles.CvAp) ...
    sprintf('     Mean = %10.4f', ...
        mean(handles.Aperture(1:handles.ApertureCount))) ...
    sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
    sprintf('     Sum = %12.4f', handles.SumSpacing) ...
    sprintf('     Cv = %7.2f', handles.Cv), ...
    sprintf('     Mean = %10.4f', ...
		mean(handles.Spacing(1:handles.SpacingCount)))};
set(handles.StatisticsText, 'String', handles.Statistics);

% reset default control values
handles.InsertFeatures = 1;
set(handles.InsertFeaturesOn, 'Value', handles.InsertFeatures);

handles.ScanSubdomain = 0;
handles.StartScan = 0;
handles.EndScan = handles.ScanlineLength;

set(handles.ScanSubdomainOn, 'Value', handles.ScanSubdomain);
set(handles.StartScanEdit, 'String', [num2str(handles.StartScan) ' ']);
set(handles.StartScanEdit, 'Value', handles.StartScan);
set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
set(handles.EndScanEdit, 'Value', handles.EndScan);
set(handles.StartScanEdit,'Enable','off');
set(handles.EndScanEdit,'Enable','off');

handles.SizeSubset = 0;
handles.MinSize = handles.ApertureSize(handles.ApertureNum,1);
handles.MaxSize = handles.ApertureSize(1,1);

set(handles.SizeSubsetOn, 'Value', handles.SizeSubset);
set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
set(handles.MinSizeEdit, 'Value', handles.MinSize);
set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
set(handles.MinSizeEdit,'Enable','off');
set(handles.MaxSizeEdit,'Enable','off');
     
handles.Analytical = 1;
handles.MonteCarlo = 0;
handles.ConfidenceInterval = 2;
handles.RandomIterations = 100;
handles.NeedNewRandom = 0;

set(handles.AnalyticalOn, 'Value', handles.Analytical);
set(handles.MonteCarloOn, 'Value', handles.MonteCarlo);
set(handles.ConfidenceIntervalPopup, 'Value', handles.ConfidenceInterval);
set(handles.RandomIterationsEdit, 'String', ...
	[num2str(handles.RandomIterations) ' ']);
set(handles.RandomIterationsEdit, 'Value', handles.RandomIterations);
set(handles.RandomIterationsEdit,'Enable','off');
set(handles.CalcRandomButton,'Enable','off');
set(handles.SaveRandomButton,'Enable','off');

handles.Graduations = 1;
handles.NumLags = 100;
handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
handles.MaxLag = handles.ScanlineLength;

set(handles.GraduationsPopup, 'Value', handles.Graduations);
set(handles.NumLagsEdit, 'String', [num2str(handles.NumLags) ' ']);
set(handles.NumLagsEdit, 'Value', handles.NumLags);
set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
set(handles.MinLagEdit, 'Value', handles.MinLag);
set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
set(handles.MaxLagEdit, 'Value', handles.MaxLag);

handles.UserAxes = 0;
handles.MinY = 0.1;
handles.MaxY = 10;
handles.MinX = 0.1;
handles.MaxX = 10;

set(handles.UserAxesOn, 'Value', handles.UserAxes);

set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
set(handles.MinYEdit, 'Value', handles.MinY);
set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
set(handles.MaxYEdit, 'Value', handles.MaxY);
set(handles.MinYEdit,'Enable','off');
set(handles.MaxYEdit,'Enable','off');

set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
set(handles.MinXEdit, 'Value', handles.MinX);
set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
set(handles.MaxXEdit, 'Value', handles.MaxX);
set(handles.MinXEdit,'Enable','off');
set(handles.MaxXEdit,'Enable','off');

handles.Windowing = 0;
handles.Normalized = 1;
handles.Weighted = 0;
handles.Switch = 2;

set(handles.WindowingEdit, 'String', [num2str(handles.Windowing) ' ']);
set(handles.WindowingEdit, 'Value', handles.Windowing);
set(handles.NormalizedOn, 'Value', handles.Normalized);
set(handles.WeightedOn, 'Value', handles.Weighted);

set(handles.CCButton,'Enable','on');
set(handles.CSButton,'Enable','off');
set(handles.IntensityButton,'Enable','on');
set(handles.StaircaseButton,'Enable','off');
set(handles.DiscSpacingButton,'Enable','off');
set(handles.CumSpacingButton,'Enable','off');

set(handles.FourierButton,'Enable','on');
set(handles.WaveletButton,'Enable','off');
set(handles.IntervalCountButton,'Enable','off');
set(handles.SemivarioButton,'Enable','off');

handles.PlotType = 0;

guidata(hObject,handles);


% --- Executes on button press in QuitProgramButton.
function QuitProgramButton_Callback(~, ~, ~)
% hObject    handle to QuitProgramButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%finishdlg;
close;


% --- Executes on selection change in StatisticsText.
function StatisticsText_Callback(hObject, ~, handles)
% hObject    handle to StatisticsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StatisticsText contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StatisticsText

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function StatisticsText_CreateFcn(hObject, ~, ~)
% hObject    handle to StatisticsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in InsertFeaturesOn.
function InsertFeaturesOn_Callback(hObject, ~, handles)
% hObject    handle to InsertFeaturesOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of InsertFeaturesOn

handles.InsertFeatures = get(hObject,'Value');

OldValue = handles.ScanlineLength;

% recalculate scanline length
if handles.ScanSubdomain ~= handles.FullScanlineLength
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
end

% recalculate extension
if handles.InsertFeatures == 1
	handles.Extension = handles.SumAperture / handles.SumSpacing;
else
	handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
end

% update StatisticsText
handles.Statistics = {['Current File = ' handles.inputfile] ...
    sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
    sprintf('     Count = %7.0f', handles.ApertureCount) ...
    sprintf('     Sum = %12.4f', handles.SumAperture) ...
    sprintf('     Cv = %7.2f', handles.CvAp) ...
    sprintf('     Mean = %10.4f', ...
        mean(handles.Aperture(1:handles.ApertureCount))) ...
    sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
    sprintf('     Sum = %12.4f', handles.SumSpacing) ...
    sprintf('     Cv = %7.2f', handles.Cv), ...
    sprintf('     Mean = %10.4f', ...
		mean(handles.Spacing(1:handles.SpacingCount)))};
set(handles.StatisticsText, 'String', handles.Statistics);

% update MaxLag if needed
if handles.ScanSubdomain ~= handles.FullScanlineLength
	if handles.MaxLag == OldValue
		handles.MaxLag = handles.ScanlineLength;
		set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
		set(handles.MaxLagEdit, 'Value', handles.MaxLag);
	end
end

% update EndScan if needed
if handles.ScanSubdomain ~= handles.FullScanlineLength
	if handles.EndScan == OldValue
		handles.EndScan = handles.ScanlineLength;
		set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
		set(handles.EndScanEdit, 'Value', handles.EndScan);
	end
end

if handles.MonteCarlo == 1
	handles.NeedNewRandom = 1;
    set(handles.CalcRandomButton,'Enable','on');
    set(handles.SaveRandomButton,'Enable','off');
end

guidata(hObject,handles);


% --- Executes on selection change in UnitsPopup.
function UnitsPopup_Callback(hObject, ~, handles)
% hObject    handle to UnitsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns UnitsPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from UnitsPopup

handles.Units = get(hObject,'Value');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

% regraph results
if handles.PlotType > 0
	xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
	ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function UnitsPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to UnitsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in ScanSubdomainOn.
function ScanSubdomainOn_Callback(hObject, ~, handles)
% hObject    handle to ScanSubdomainOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ScanSubdomainOn

handles.ScanSubdomain = get(hObject,'Value');

if handles.ScanSubdomain == 1
    
    set(handles.StartScanEdit,'Enable','on');
    set(handles.EndScanEdit,'Enable','on');
    
    guidata(hObject,handles);
    
else
    
    set(handles.StartScanEdit,'Enable','off');
    set(handles.EndScanEdit,'Enable','off');
    
    % reset data and statistics to full scanline
    if handles.SizeSubset == 1
        [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
            SizeRangeSubset(handles.FullAperture, handles.FullSpacing, ...
            handles.FullApertureCount, handles.MinSize, handles.MaxSize, ...
			handles.InsertFeatures);
    else
        handles.Spacing = handles.FullSpacing;
        handles.Aperture = handles.FullAperture;
        handles.ApertureCount = handles.FullApertureCount;
    end
    
	% recalculate descriptive statistics of fracture data set
	handles.SpacingCount = handles.ApertureCount + 1;
	handles.SeparationCount = ...
		handles.ApertureCount*(handles.ApertureCount-1)/2;
	
	handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
	handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
	handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount).* ...
        handles.Aperture(1:handles.ApertureCount));
	handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
		/ mean(handles.Aperture(1:handles.ApertureCount));
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
	if handles.InsertFeatures == 1
		handles.Extension = handles.SumAperture / handles.SumSpacing;
	else
		handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
	end
	handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
        mean(handles.Spacing(1:handles.SpacingCount));
    
    % recalculate size distribution of fracture apertures and spacings
	handles.SpacingSize = zeros(1,2);
    handles.ApertureSize = zeros(1,2);
    
    [handles.SpacingSize, handles.SpacingNum] = ...
        SizeDistribution(handles.Spacing, handles.SpacingCount);
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    % reset range of lags
    handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
    set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
    set(handles.MinLagEdit, 'Value', handles.MinLag);
    
    handles.MaxLag = handles.ScanlineLength;
    set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
    set(handles.MaxLagEdit, 'Value', handles.MaxLag);
    
    % reset range of scanline
    handles.StartScan = 0;
    set(handles.StartScanEdit, 'String', [num2str(handles.StartScan) ' ']);
    set(handles.StartScanEdit, 'Value', handles.StartScan);
    
    handles.EndScan = handles.ScanlineLength;
    set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
    set(handles.EndScanEdit, 'Value', handles.EndScan);
    
    % update range of feature sizes
    if handles.SizeSubset == 0
        
        handles.MinSize = handles.FullMinSize;
        set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
        set(handles.MinSizeEdit, 'Value', handles.MinSize);
        
        handles.MaxSize = handles.FullMaxSize;
        set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
        set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
        
    end
    
    handles.DomainMinSize = handles.FullMinSize;
    handles.DomainMaxSize = handles.FullMaxSize;
    
    % update StatisticsText
    handles.Statistics = {['Current File = ' handles.inputfile] ...
        sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
        sprintf('     Count = %7.0f', handles.ApertureCount) ...
        sprintf('     Sum = %12.4f', handles.SumAperture) ...
        sprintf('     Cv = %7.2f', handles.CvAp) ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Aperture(1:handles.ApertureCount))) ...
        sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
        sprintf('     Sum = %12.4f', handles.SumSpacing) ...
        sprintf('     Cv = %7.2f', handles.Cv), ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Spacing(1:handles.SpacingCount)))};
    set(handles.StatisticsText, 'String', handles.Statistics);
    
	if handles.MonteCarlo == 1
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
	end
	
    guidata(hObject,handles);
    
end


function StartScanEdit_Callback(hObject, ~, handles)
% hObject    handle to StartScanEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartScanEdit as text
%        str2double(get(hObject,'String')) returns contents of StartScanEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue > handles.EndScan
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue < 0
    set(hObject, 'String', [num2str(0) ' ']);
    set(hObject, 'Value', 0);
    handles.StartScan = 0;
    Update = 1;
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.StartScan = NewValue;
    Update = 1;
end

guidata(hObject,handles);

% update data and statistics according to user input
if Update == 1
    
	% select fractures in a subdomain of scanline
    handles.Spacing = zeros(1,1);
    handles.Aperture = zeros(1,1);
    
    [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
        ScanlineSubdomain(handles.FullAperture, handles.FullSpacing, ...
        handles.FullApertureCount, handles.StartScan, handles.EndScan, ...
		handles.InsertFeatures);
	
    handles.ApertureSize = zeros(1,2);
    
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    handles.DomainMinSize = handles.ApertureSize(handles.ApertureNum,1);
    handles.DomainMaxSize = handles.ApertureSize(1,1);
    
    if handles.SizeSubset == 1
        [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
            SizeRangeSubset(handles.Aperture, handles.Spacing, ...
            handles.ApertureCount, handles.MinSize, handles.MaxSize, ...
			handles.InsertFeatures);
    end
    
	% recalculate descriptive statistics of remaining fracture data set
	handles.SpacingCount = handles.ApertureCount + 1;
	handles.SeparationCount = ...
		handles.ApertureCount*(handles.ApertureCount-1)/2;
	
	handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
	handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
	handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount).* ...
        handles.Aperture(1:handles.ApertureCount));
	handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
		/ mean(handles.Aperture(1:handles.ApertureCount));
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
	if handles.InsertFeatures == 1
		handles.Extension = handles.SumAperture / handles.SumSpacing;
	else
		handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
	end
	handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
        mean(handles.Spacing(1:handles.SpacingCount));
    
    % recalculate size distribution of fracture apertures and spacings
	handles.SpacingSize = zeros(1,2);
    handles.ApertureSize = zeros(1,2);
    
    [handles.SpacingSize, handles.SpacingNum] = ...
        SizeDistribution(handles.Spacing, handles.SpacingCount);
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    % update range of lags
%    if handles.MinLag < handles.SpacingSize(handles.SpacingNum,1)
        handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
        set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
        set(handles.MinLagEdit, 'Value', handles.MinLag);
%    end
    
%    if handles.MaxLag > handles.ScanlineLength    
        handles.MaxLag = handles.ScanlineLength;
        set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
        set(handles.MaxLagEdit, 'Value', handles.MaxLag);
%    end
    
    % update range of feature sizes
    if handles.MinSize < handles.ApertureSize(handles.ApertureNum,1)
        handles.MinSize = handles.ApertureSize(handles.ApertureNum,1);
        set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
        set(handles.MinSizeEdit, 'Value', handles.MinSize);
    end
    
    if handles.MaxSize > handles.ApertureSize(1,1)
        handles.MaxSize = handles.ApertureSize(1,1);
        set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
        set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
    end
    
    % update StatisticsText
    handles.Statistics = {['Current File = ' handles.inputfile] ...
        sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
        sprintf('     Count = %7.0f', handles.ApertureCount) ...
        sprintf('     Sum = %12.4f', handles.SumAperture) ...
        sprintf('     Cv = %7.2f', handles.CvAp) ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Aperture(1:handles.ApertureCount))) ...
        sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
        sprintf('     Sum = %12.4f', handles.SumSpacing) ...
        sprintf('     Cv = %7.2f', handles.Cv), ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Spacing(1:handles.SpacingCount)))};
    set(handles.StatisticsText, 'String', handles.Statistics);
    
	if handles.MonteCarlo == 1
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
	end
	
    guidata(hObject,handles);
    
end

% --- Executes during object creation, after setting all properties.
function StartScanEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to StartScanEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function EndScanEdit_Callback(hObject, ~, handles)
% hObject    handle to EndScanEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndScanEdit as text
%        str2double(get(hObject,'String')) returns contents of EndScanEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue < handles.StartScan
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue > handles.FullScanlineLength
    set(hObject, 'String', [num2str(handles.FullScanlineLength) ' ']);
    set(hObject, 'Value', handles.FullScanlineLength);
    handles.EndScan = handles.FullScanlineLength;
    Update = 1;
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.EndScan = NewValue;
    Update = 1;
end

guidata(hObject,handles);

% update data and statistics according to user input
if Update == 1
	
	% select fractures in a subdomain of scanline
    handles.Spacing = zeros(1,1);
    handles.Aperture = zeros(1,1);
    
    [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
        ScanlineSubdomain(handles.FullAperture, handles.FullSpacing, ...
        handles.FullApertureCount, handles.StartScan, handles.EndScan, ...
		handles.InsertFeatures);
	
    handles.ApertureSize = zeros(1,2);
    
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    handles.DomainMinSize = handles.ApertureSize(handles.ApertureNum,1);
    handles.DomainMaxSize = handles.ApertureSize(1,1);
    
    if handles.SizeSubset == 1
        [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
            SizeRangeSubset(handles.Aperture, handles.Spacing, ...
            handles.ApertureCount, handles.MinSize, handles.MaxSize, ...
			handles.InsertFeatures);
    end
    
	% recalculate descriptive statistics of remaining fracture data set
	handles.SpacingCount = handles.ApertureCount + 1;
	handles.SeparationCount = ...
		handles.ApertureCount*(handles.ApertureCount-1)/2;
	
	handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
	handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
	handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount).* ...
        handles.Aperture(1:handles.ApertureCount));
	handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
		/ mean(handles.Aperture(1:handles.ApertureCount));
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
	if handles.InsertFeatures == 1
		handles.Extension = handles.SumAperture / handles.SumSpacing;
	else
		handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
	end
	handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
        mean(handles.Spacing(1:handles.SpacingCount));
    
    % recalculate size distribution of fracture apertures and spacings
	handles.SpacingSize = zeros(1,2);
    handles.ApertureSize = zeros(1,2);
    
	[handles.SpacingSize, handles.SpacingNum] = ...
        SizeDistribution(handles.Spacing, handles.SpacingCount);
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    % update range of lags
%    if handles.MinLag < handles.SpacingSize(handles.SpacingNum,1)
        handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
        set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
        set(handles.MinLagEdit, 'Value', handles.MinLag);
%    end
    
%    if handles.MaxLag > handles.ScanlineLength    
        handles.MaxLag = handles.ScanlineLength;
        set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
        set(handles.MaxLagEdit, 'Value', handles.MaxLag);
%    end
    
    % update range of feature sizes
    if handles.MinSize < handles.ApertureSize(handles.ApertureNum,1)
        handles.MinSize = handles.ApertureSize(handles.ApertureNum,1);
        set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
        set(handles.MinSizeEdit, 'Value', handles.MinSize);
    end
    
    if handles.MaxSize > handles.ApertureSize(1,1)
        handles.MaxSize = handles.ApertureSize(1,1);
        set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
        set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
    end
    
    % update StatisticsText
    handles.Statistics = {['Current File = ' handles.inputfile] ...
        sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
        sprintf('     Count = %7.0f', handles.ApertureCount) ...
        sprintf('     Sum = %12.4f', handles.SumAperture) ...
        sprintf('     Cv = %7.2f', handles.CvAp) ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Aperture(1:handles.ApertureCount))) ...
        sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
        sprintf('     Sum = %12.4f', handles.SumSpacing) ...
        sprintf('     Cv = %7.2f', handles.Cv), ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Spacing(1:handles.SpacingCount)))};
    set(handles.StatisticsText, 'String', handles.Statistics);
    
	if handles.MonteCarlo == 1
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
	end
	
    guidata(hObject,handles);
    
end

% --- Executes during object creation, after setting all properties.
function EndScanEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to EndScanEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in SizeSubsetOn.
function SizeSubsetOn_Callback(hObject, ~, handles)
% hObject    handle to SizeSubsetOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SizeSubsetOn

handles.SizeSubset = get(hObject,'Value');

if handles.SizeSubset == 1
    
	set(handles.MinSizeEdit,'Enable','on');
	set(handles.MaxSizeEdit,'Enable','on');
     
	guidata(hObject,handles);
     
else
    
     set(handles.MinSizeEdit,'Enable','off');
     set(handles.MaxSizeEdit,'Enable','off');
     
    % reset data and statistics to full range of feature sizes
    if handles.ScanSubdomain == 1
        [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
            ScanlineSubdomain(handles.FullAperture, handles.FullSpacing, ...
            handles.FullApertureCount, handles.StartScan, handles.EndScan, ...
			handles.InsertFeatures);
    else
        handles.Spacing = handles.FullSpacing;
        handles.Aperture = handles.FullAperture;
        handles.ApertureCount = handles.FullApertureCount;
    end
    
	% recalculate descriptive statistics of fracture data set
	handles.SpacingCount = handles.ApertureCount + 1;
	handles.SeparationCount = ...
		handles.ApertureCount*(handles.ApertureCount-1)/2;
	
	handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
	handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
	handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount).* ...
        handles.Aperture(1:handles.ApertureCount));
	handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
		/ mean(handles.Aperture(1:handles.ApertureCount));
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
	if handles.InsertFeatures == 1
		handles.Extension = handles.SumAperture / handles.SumSpacing;
	else
		handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
	end
	handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
        mean(handles.Spacing(1:handles.SpacingCount));
    
    % recalculate size distribution of fracture apertures and spacings
	handles.SpacingSize = zeros(1,2);
    handles.ApertureSize = zeros(1,2);
    
    [handles.SpacingSize, handles.SpacingNum] = ...
        SizeDistribution(handles.Spacing, handles.SpacingCount);
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    % reset range of lags
    handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
    set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
    set(handles.MinLagEdit, 'Value', handles.MinLag);
    
    handles.MaxLag = handles.ScanlineLength;
    set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
    set(handles.MaxLagEdit, 'Value', handles.MaxLag);
    
    % reset range of scanline
%    handles.StartScan = 0;
%    set(handles.StartScanEdit, 'String', [num2str(handles.StartScan) ' ']);
%    set(handles.StartScanEdit, 'Value', handles.StartScan);
    
%    handles.EndScan = handles.ScanlineLength;
%    set(handles.EndScanEdit, 'String', [num2str(handles.EndScan) ' ']);
%    set(handles.EndScanEdit, 'Value', handles.EndScan);
    
    % update range of feature sizes
%    if handles.ScanSubdomain == 0
        
        handles.MinSize = handles.ApertureSize(handles.ApertureNum,1);
        set(handles.MinSizeEdit, 'String', [num2str(handles.MinSize) ' ']);
        set(handles.MinSizeEdit, 'Value', handles.MinSize);
        
        handles.MaxSize = handles.ApertureSize(1,1);
        set(handles.MaxSizeEdit, 'String', [num2str(handles.MaxSize) ' ']);
        set(handles.MaxSizeEdit, 'Value', handles.MaxSize);
        
%    end
    
    % update StatisticsText
    handles.Statistics = {['Current File = ' handles.inputfile] ...
        sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
        sprintf('     Count = %7.0f', handles.ApertureCount) ...
        sprintf('     Sum = %12.4f', handles.SumAperture) ...
        sprintf('     Cv = %7.2f', handles.CvAp) ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Aperture(1:handles.ApertureCount))) ...
        sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
        sprintf('     Sum = %12.4f', handles.SumSpacing) ...
        sprintf('     Cv = %7.2f', handles.Cv), ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Spacing(1:handles.SpacingCount)))};
    set(handles.StatisticsText, 'String', handles.Statistics);
    
	if handles.MonteCarlo == 1
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
	end
	
    guidata(hObject,handles);
     
end


function MinSizeEdit_Callback(hObject, ~, handles)
% hObject    handle to MinSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinSizeEdit as text
%        str2double(get(hObject,'String')) returns contents of MinSizeEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue > handles.MaxSize
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue < handles.DomainMinSize
%    if handles.ScanSubdomain == 1
        set(hObject, 'String', [num2str(handles.DomainMinSize) ' ']);
        set(hObject, 'Value', handles.DomainMinSize);
        handles.MinSize = handles.DomainMinSize;
%    else
%        set(hObject, 'String', [num2str(handles.FullMinSize) ' ']);
%        set(hObject, 'Value', handles.FullMinSize);
%        handles.MaxSize = handles.FullMinSize;
%    end
    Update = 1;
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MinSize = NewValue;
    Update = 1;
end

guidata(hObject,handles);

% update data and statistics according to user input
if Update == 1
	
	% select a subset of fracture sizes
    handles.Spacing = zeros(1,1);
    handles.Aperture = zeros(1,1);
    
    [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
        SizeRangeSubset(handles.FullAperture, handles.FullSpacing, ...
        handles.FullApertureCount, handles.MinSize, handles.MaxSize, ...
		handles.InsertFeatures);
    
    if handles.ScanSubdomain == 1
        [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
            ScanlineSubdomain(handles.Aperture, handles.Spacing, ...
            handles.ApertureCount, handles.StartScan, handles.EndScan, ...
			handles.InsertFeatures);
    end
	
	% recalculate descriptive statistics of remaining fracture data set
	handles.SpacingCount = handles.ApertureCount + 1;
	handles.SeparationCount = ...
		handles.ApertureCount*(handles.ApertureCount-1)/2;
	
	handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
	handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
	handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount).* ...
        handles.Aperture(1:handles.ApertureCount));
	handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
		/ mean(handles.Aperture(1:handles.ApertureCount));
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
	if handles.InsertFeatures == 1
		handles.Extension = handles.SumAperture / handles.SumSpacing;
	else
		handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
	end
	handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
        mean(handles.Spacing(1:handles.SpacingCount));
    
    % recalculate size distribution of fracture apertures and spacings
	handles.SpacingSize = zeros(1,2);
    handles.ApertureSize = zeros(1,2);
    
	[handles.SpacingSize, handles.SpacingNum] = ...
        SizeDistribution(handles.Spacing, handles.SpacingCount);
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    % update range of lags
    handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
    set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
    set(handles.MinLagEdit, 'Value', handles.MinLag);
    
    handles.MaxLag = handles.ScanlineLength;
    set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
    set(handles.MaxLagEdit, 'Value', handles.MaxLag);
    
    % update StatisticsText
    handles.Statistics = {['Current File = ' handles.inputfile] ...
        sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
        sprintf('     Count = %7.0f', handles.ApertureCount) ...
        sprintf('     Sum = %12.4f', handles.SumAperture) ...
        sprintf('     Cv = %7.2f', handles.CvAp) ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Aperture(1:handles.ApertureCount))) ...
        sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
        sprintf('     Sum = %12.4f', handles.SumSpacing) ...
        sprintf('     Cv = %7.2f', handles.Cv), ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Spacing(1:handles.SpacingCount)))};
    set(handles.StatisticsText, 'String', handles.Statistics);
    
	if handles.MonteCarlo == 1
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
	end
	
    guidata(hObject,handles);
    
end

% --- Executes during object creation, after setting all properties.
function MinSizeEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MinSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MaxSizeEdit_Callback(hObject, ~, handles)
% hObject    handle to MaxSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxSizeEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxSizeEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue < handles.MinSize
    set(hObject, 'String', [num2str(OldValue) ' ']);
    Update = 0;
elseif NewValue > handles.DomainMaxSize
    set(hObject, 'String', [num2str(handles.DomainMaxSize) ' ']);
    set(hObject, 'Value', handles.DomainMaxSize);
    handles.MaxSize = handles.DomainMaxSize;
    Update = 1;
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MaxSize = NewValue;
    Update = 1;
end

guidata(hObject,handles);

% update data and statistics according to user input
if Update == 1
	
	% select a subset of fracture sizes
    handles.Spacing = zeros(1,1);
    handles.Aperture = zeros(1,1);
    
    [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
        SizeRangeSubset(handles.FullAperture, handles.FullSpacing, ...
        handles.FullApertureCount, handles.MinSize, handles.MaxSize, ...
		handles.InsertFeatures);
    
    if handles.ScanSubdomain == 1
        [handles.Aperture, handles.Spacing, handles.ApertureCount] = ...
            ScanlineSubdomain(handles.Aperture, handles.Spacing, ...
            handles.ApertureCount, handles.StartScan, handles.EndScan, ...
			handles.InsertFeatures);
    end
	
	% recalculate descriptive statistics of remaining fracture data set
	handles.SpacingCount = handles.ApertureCount + 1;
	handles.SeparationCount = ...
		handles.ApertureCount*(handles.ApertureCount-1)/2;
	
	handles.SumSpacing = sum(handles.Spacing(1:handles.SpacingCount));
	handles.SumAperture = sum(handles.Aperture(1:handles.ApertureCount));
	handles.SumSqAp = sum(handles.Aperture(1:handles.ApertureCount).* ...
        handles.Aperture(1:handles.ApertureCount));
	handles.CvAp = std(handles.Aperture(1:handles.ApertureCount)) ...
		/ mean(handles.Aperture(1:handles.ApertureCount));
	if handles.InsertFeatures == 1
		handles.ScanlineLength = handles.SumSpacing + handles.SumAperture;
	else
		handles.ScanlineLength = handles.SumSpacing;	
	end
	if handles.InsertFeatures == 1
		handles.Extension = handles.SumAperture / handles.SumSpacing;
	else
		handles.Extension = handles.ApertureCount / handles.SumSpacing;	%2016-09-08
	end
	handles.Cv = std(handles.Spacing(1:handles.SpacingCount)) / ...
        mean(handles.Spacing(1:handles.SpacingCount));
    
    % recalculate size distribution of fracture apertures and spacings
	handles.SpacingSize = zeros(1,2);
    handles.ApertureSize = zeros(1,2);
    
	[handles.SpacingSize, handles.SpacingNum] = ...
        SizeDistribution(handles.Spacing, handles.SpacingCount);
	[handles.ApertureSize, handles.ApertureNum] = ...
        SizeDistribution(handles.Aperture, handles.ApertureCount);
	
    % update range of lags
    handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
    set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
    set(handles.MinLagEdit, 'Value', handles.MinLag);
    
    handles.MaxLag = handles.ScanlineLength;
    set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
    set(handles.MaxLagEdit, 'Value', handles.MaxLag);
    
    % update StatisticsText
    handles.Statistics = {['Current File = ' handles.inputfile] ...
        sprintf('Feature Pairs = %12.0f', handles.SeparationCount) ...
        sprintf('     Count = %7.0f', handles.ApertureCount) ...
        sprintf('     Sum = %12.4f', handles.SumAperture) ...
        sprintf('     Cv = %7.2f', handles.CvAp) ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Aperture(1:handles.ApertureCount))) ...
        sprintf('Spacing Count = %7.0f', handles.SpacingCount) ...
        sprintf('     Sum = %12.4f', handles.SumSpacing) ...
        sprintf('     Cv = %7.2f', handles.Cv), ...
        sprintf('     Mean = %10.4f', ...
            mean(handles.Spacing(1:handles.SpacingCount)))};
    set(handles.StatisticsText, 'String', handles.Statistics);
    
	if handles.MonteCarlo == 1
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
	end
	
    guidata(hObject,handles);
    
end

% --- Executes during object creation, after setting all properties.
function MaxSizeEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MaxSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes when selected object is changed in UncertaintyPanel.
function UncertaintyPanel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in UncertaintyPanel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue,'Tag')
    case 'AnalyticalOn'
        handles.Analytical = 1;
        handles.MonteCarlo = 0;
        set(handles.RandomIterationsEdit,'Enable','off');
        set(handles.CalcRandomButton,'Enable','off');
		set(handles.SaveRandomButton,'Enable','off');
		set(handles.CCButton,'Enable','on');
		set(handles.CSButton,'Enable','off');
		set(handles.IntensityButton,'Enable','on');
		set(handles.StaircaseButton,'Enable','off');
		set(handles.DiscSpacingButton,'Enable','off');
		set(handles.CumSpacingButton,'Enable','off');
        set(handles.FourierButton,'Enable','on');
        set(handles.WaveletButton,'Enable','off');
        set(handles.IntervalCountButton,'Enable','off');
        set(handles.SemivarioButton,'Enable','off');
		handles.NeedNewRandom = 0;
        guidata(hObject,handles);
    case 'MonteCarloOn'
        handles.Analytical = 0;
        handles.MonteCarlo = 1;
        guidata(hObject,handles);
        set(handles.RandomIterationsEdit,'Enable','on');
        set(handles.CalcRandomButton,'Enable','on');
		set(handles.CCButton,'Enable','off');
		set(handles.CSButton,'Enable','off');
		set(handles.IntensityButton,'Enable','off');
		set(handles.StaircaseButton,'Enable','off');
		set(handles.DiscSpacingButton,'Enable','off');
		set(handles.CumSpacingButton,'Enable','off');
        set(handles.FourierButton,'Enable','off');
        set(handles.WaveletButton,'Enable','off');
        set(handles.IntervalCountButton,'Enable','off');
        set(handles.SemivarioButton,'Enable','off');
		handles.NeedNewRandom = 1;
        set(handles.CalcRandomButton,'Enable','on');
        set(handles.SaveRandomButton,'Enable','off');
    otherwise;
        
end

guidata(hObject,handles);


function RandomIterationsEdit_Callback(hObject, ~, handles)
% hObject    handle to RandomIterationsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RandomIterationsEdit as text
%        str2double(get(hObject,'String')) returns contents of RandomIterationsEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue < 0
    set(hObject, 'String', [num2str(0) ' ']);
    set(hObject, 'Value', 0);
    handles.RandomIterations = 0;
else
    set(hObject, 'String', [num2str(round(NewValue)) ' ']);
    set(hObject, 'Value', round(NewValue));
    handles.RandomIterations = round(NewValue);
	handles.NeedNewRandom = 1;
	set(handles.CalcRandomButton,'Enable','on');
	set(handles.SaveRandomButton,'Enable','off');
	set(handles.CCButton,'Enable','off');
	set(handles.CSButton,'Enable','off');
	set(handles.IntensityButton,'Enable','off');
	set(handles.StaircaseButton,'Enable','off');
	set(handles.DiscSpacingButton,'Enable','off');
	set(handles.CumSpacingButton,'Enable','off');
    set(handles.FourierButton,'Enable','off');
    set(handles.WaveletButton,'Enable','off');
    set(handles.IntervalCountButton,'Enable','off');
    set(handles.SemivarioButton,'Enable','off');
end

% handles.NeedNewRandom = 1;

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function RandomIterationsEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to RandomIterationsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CalcRandomButton.
function CalcRandomButton_Callback(hObject, ~, handles)
% hObject    handle to CalcRandomButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
		
% create arrays for distributions of randomized fractures
handles.RandomScanlines = zeros(handles.SpacingCount, ...
	2*handles.RandomIterations);
handles.RandomSeparation = zeros(handles.SeparationCount, ...
	2*handles.RandomIterations);
%handles.RandomCv = zeros(handles.RandomIterations,1);

% create dialog box for reporting status
StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');

for i = 1:1:handles.RandomIterations
	% randomize fracture locations
	[handles.RandomScanlines(1:handles.SpacingCount,2*i-1), ...
		handles.RandomScanlines(1:handles.SpacingCount,2*i)] = ...
		Randomize(handles.Aperture, handles.ApertureCount, ...
		handles.Spacing, handles.SumSpacing);

	% calculate random fracture separations
	[handles.RandomSeparation(1:handles.SeparationCount,(2*i-1):(2*i))] = ...
		SeparationCalc(...
		handles.RandomScanlines(1:handles.SpacingCount,2*i), ...
		handles.ApertureCount, ...
		handles.RandomScanlines(1:handles.SpacingCount,2*i-1), ...
		handles.SeparationCount, handles.InsertFeatures);

	% calculate random coefficients of variation
%	handles.RandomCv(i) = ...
%		std(handles.RandomScanlines(1:handles.SpacingCount,2*i-1)) ...
%		/ mean(handles.RandomScanlines(1:handles.SpacingCount,2*i-1));
		
	% update status via dialog box
	waitbar(i/handles.RandomIterations, StatusBox, ...
		sprintf('Randomizations generated = %6.0f out of %6.0f', ...
		i, handles.RandomIterations),'FontSize', 14);
end
    
% delete dialog box for reporting status
delete(StatusBox);

set(handles.CalcRandomButton,'Enable','off');
set(handles.SaveRandomButton,'Enable','on');
set(handles.CCButton,'Enable','on');
set(handles.CSButton,'Enable','on');
set(handles.IntensityButton,'Enable','on');
set(handles.StaircaseButton,'Enable','on');
set(handles.DiscSpacingButton,'Enable','on');
set(handles.CumSpacingButton,'Enable','on');
set(handles.FourierButton,'Enable','on');
%set(handles.WaveletButton,'Enable','on');
%set(handles.IntervalCountButton,'Enable','on');
%set(handles.SemivarioButton,'Enable','on');

handles.NeedNewRandom = 0;

handles.PlotType = 0;

guidata(hObject,handles);


% --- Executes on button press in SaveRandomButton.
function SaveRandomButton_Callback(hObject, ~, handles)
% hObject    handle to SaveRandomButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% change directory to source of input
originalpath = cd;
cd(handles.inputpath);

% get output file name and path from user
[outputfile, outputpath] = uiputfile('Randomization_Output.txt', ...
	'Choose an OUTPUT file of randomized scanines:');

% open output file
cd(outputpath);
[outputID, message] = fopen([outputpath, outputfile], 'a');
if outputID == -1
	disp(message)
end

% generate output with NCC numerical results
fprintf(outputID, datestr(now)); fprintf(outputID, '\n');
fprintf(outputID, 'Input file:\t');
fprintf(outputID, handles.inputfile); fprintf(outputID, '\n');
fprintf(outputID, 'Number of fractures:\t %6.0f\n', ...
	handles.ApertureCount);
fprintf(outputID, 'Number of randomizations:\t %6.0f\n', ...
	handles.RandomIterations);
fprintf(outputID, 'Length of scanline:\t %12.4f\n', ...
	handles.ScanlineLength);
fprintf(outputID, '\n');
fprintf(outputID, 'Spacing\t Aperture\t Spacing\t Aperture\t etc ...\n');

for i = 1:1:handles.SpacingCount
	fprintf(outputID, num2str(handles.RandomScanlines(i,1)));
	for j = 2:1:2*handles.RandomIterations
		fprintf(outputID, '\t %14.6f', handles.RandomScanlines(i,j));
	end
	fprintf(outputID, '\n');
end

% reset directory to original
cd(originalpath);

% close output file
fclose(outputID);
% status = fclose(outputID);

guidata(hObject,handles);




% --- Executes on selection change in GraduationsPopup.
function GraduationsPopup_Callback(hObject, ~, handles)
% hObject    handle to GraduationsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns GraduationsPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GraduationsPopup

handles.Graduations = get(hObject,'Value');

handles.PlotType = 0;

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function GraduationsPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to GraduationsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function NumLagsEdit_Callback(hObject, ~, handles)
% hObject    handle to NumLagsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumLagsEdit as text
%        str2double(get(hObject,'String')) returns contents of NumLagsEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue < 10
    set(hObject, 'String', [num2str(10) ' ']);
    set(hObject, 'Value', 10);
    handles.NumLags = 10;
	handles.PlotType = 0;
else
    set(hObject, 'String', [num2str(round(NewValue)) ' ']);
    set(hObject, 'Value', round(NewValue));
    handles.NumLags = round(NewValue);
	handles.PlotType = 0;
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function NumLagsEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to NumLagsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MinLagEdit_Callback(hObject, ~, handles)
% hObject    handle to MinLagEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinLagEdit as text
%        str2double(get(hObject,'String')) returns contents of MinLagEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue > handles.MaxLag
    set(hObject, 'String', [num2str(OldValue) ' ']);
%elseif NewValue < handles.SpacingSize(handles.SpacingNum,1)
%	set(hObject, 'String', ...
%		[num2str(handles.SpacingSize(handles.SpacingNum,1)) ' ']);
%	set(hObject, 'Value', handles.SpacingSize(handles.SpacingNum,1));
%	handles.MinLag = handles.SpacingSize(handles.SpacingNum,1);
%	handles.PlotType = 0;
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MinLag = NewValue;
	handles.PlotType = 0;
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function MinLagEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MinLagEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MaxLagEdit_Callback(hObject, ~, handles)
% hObject    handle to MaxLagEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxLagEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxLagEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue < handles.MinLag
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue > handles.ScanlineLength
    set(hObject, 'String', [num2str(handles.ScanlineLength) ' ']);
    set(hObject, 'Value', handles.ScanlineLength);
    handles.MaxLag = handles.ScanlineLength;
	handles.PlotType = 0;
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MaxLag = NewValue;
	handles.PlotType = 0;
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function MaxLagEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MaxLagEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in UserAxesOn.
function UserAxesOn_Callback(hObject, ~, handles)
% hObject    handle to UserAxesOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UserAxesOn

handles.UserAxes = get(hObject,'Value');

if handles.UserAxes == 1
	
	set(handles.MinYEdit,'Enable','on');
	set(handles.MaxYEdit,'Enable','on');
	
	set(handles.MinXEdit,'Enable','on');
	set(handles.MaxXEdit,'Enable','on');
	
else
	
	set(handles.MinYEdit,'Enable','off');
	set(handles.MaxYEdit,'Enable','off');
	
	set(handles.MinXEdit,'Enable','off');
	set(handles.MaxXEdit,'Enable','off');
	
end

guidata(hObject,handles);


% --- Executes on selection change in PlotScalingPopup.
function PlotScalingPopup_Callback(hObject, ~, handles)
% hObject    handle to PlotScalingPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PlotScalingPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PlotScalingPopup

handles.PlotScaling = get(hObject,'Value');

% regraph results
if handles.PlotType > 0
	
	if handles.Normalized == 1
		if handles.Weighted == 1
			handles.Switch = 1;
		else
			handles.Switch = 2;
		end
	else
		if handles.Weighted == 1
			handles.Switch = 3;
		else
			handles.Switch = 4;
		end
	end
	
	if handles.PlotScaling == 1
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
        
		hold on;
        
		if handles.PlotType <= 3
			loglog(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			loglog(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 2
		
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogy(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogy(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 3
		
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogx(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogx(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 4
		
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			plot(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			plot(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	end
		
	if handles.UserAxes == 1
		if handles.MinY <= 0
			if handles.PlotScaling == 1 || handles.PlotScaling == 2
				temp = ylim;
				handles.MinY = temp(1);
				set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
				set(handles.MinYEdit, 'Value', handles.MinY);
			end
		end
		
		if handles.MinX <= 0
			if handles.PlotScaling == 1 || handles.PlotScaling == 3
				temp = xlim;
				handles.MinX = temp(1);
				set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
				set(handles.MinXEdit, 'Value', handles.MinX);
			end
		end
		
		ylim([handles.MinY handles.MaxY]);
		xlim([handles.MinX handles.MaxX]);
        
    elseif handles.PlotType == 3 || handles.PlotType == 4
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    elseif handles.PlotScaling == 1 || handles.PlotScaling == 2
        if handles.PlotType == 5 || handles.PlotType == 6
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
        else
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.NumLags,handles.Switch)));
        end
        if junk(1) == 0
            handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
        else
            handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
        end
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
        clear junk;
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
        ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
		
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    else
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
	end
	
	grid on;
	set(handles.PlotAxes, 'XMinorTick', 'on');
	set(handles.PlotAxes, 'YMinorTick', 'on');
	set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');
	
	title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');
	
	[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
		GetLabels(handles.PlotType, handles.Normalized, ...
		handles.Weighted, handles.Units);
	
	xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
	ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');
	
	legend(handles.Confidence, 'input data', 'randomized data');
	legend('Location', handles.Corner);
	
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function PlotScalingPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to PlotScalingPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MinYEdit_Callback(hObject, ~, handles)
% hObject    handle to MinYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinYEdit as text
%        str2double(get(hObject,'String')) returns contents of MinYEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue >= handles.MaxY
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue <= 0
	if handles.PlotScaling == 1 || handles.PlotScaling == 2
		set(hObject, 'String', [num2str(OldValue) ' ']);
	else
		set(hObject, 'String', [num2str(NewValue) ' ']);
		set(hObject, 'Value', NewValue);
		handles.MinY = NewValue;
		handles.UserAxes = 1;
	end
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MinY = NewValue;
	handles.UserAxes = 1;
end

% regraph results
if handles.PlotType > 0
	ylim([handles.MinY handles.MaxY]);
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function MinYEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MinYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MaxYEdit_Callback(hObject, ~, handles)
% hObject    handle to MaxYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxYEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxYEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue <= 0
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue <= handles.MinY
    set(hObject, 'String', [num2str(OldValue) ' ']);
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MaxY = NewValue;
	handles.UserAxes = 1;
end

% regraph results
if handles.PlotType > 0
	ylim([handles.MinY handles.MaxY]);
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function MaxYEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MaxYEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MinXEdit_Callback(hObject, ~, handles)
% hObject    handle to MinXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinXEdit as text
%        str2double(get(hObject,'String')) returns contents of MinXEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue >= handles.MaxX
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue <= 0
	if handles.PlotScaling == 1 || handles.PlotScaling == 3
		set(hObject, 'String', [num2str(OldValue) ' ']);
	else
		set(hObject, 'String', [num2str(NewValue) ' ']);
		set(hObject, 'Value', NewValue);
		handles.MinX = NewValue;
		handles.UserAxes = 1;
	end
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MinX = NewValue;
	handles.UserAxes = 1;
end

% regraph results
if handles.PlotType > 0
	xlim([handles.MinX handles.MaxX]);
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function MinXEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MinXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MaxXEdit_Callback(hObject, ~, handles)
% hObject    handle to MaxXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxXEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxXEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue <= 0
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue <= handles.MinX
    set(hObject, 'String', [num2str(OldValue) ' ']);
else
    set(hObject, 'String', [num2str(NewValue) ' ']);
    set(hObject, 'Value', NewValue);
    handles.MaxX = NewValue;
	handles.UserAxes = 1;
end

% regraph results
if handles.PlotType > 0
	xlim([handles.MinX handles.MaxX]);
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function MaxXEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to MaxXEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ConfidenceIntervalPopup.
function ConfidenceIntervalPopup_Callback(hObject, ~, handles)
% hObject    handle to ConfidenceIntervalPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ConfidenceIntervalPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ConfidenceIntervalPopup

handles.ConfidenceInterval = get(hObject,'Value');

if handles.ConfidenceInterval == 1
    handles.ZeeScore = 2.58;
    handles.Confidence = '99% confidence limits';
elseif handles.ConfidenceInterval == 2
    handles.ZeeScore = 1.96;
    handles.Confidence = '95% confidence limits';
elseif handles.ConfidenceInterval == 3
    handles.ZeeScore = 1.00;
    handles.Confidence = '68% confidence limits';
end

% regraph results
if handles.PlotType > 0
	
    if handles.Analytical == 1
        
        if handles.PlotType == 1 % check value
            % is all of the following really necessary ??

            % calculate expected correlation count
    %         ExpectedCount = zeros(handles.NumLags,1);
            [ExpectedCount] = ExpectedCalc(handles.LengthScale, ...
                handles.NumLags, handles.ScanlineLength);

            % window expected (normalized) correlation count
            temp = zeros(handles.NumLags,2);
            for i = 1:1:handles.Windowing
                temp(i,1) = mean(ExpectedCount(1:(i+handles.Windowing)));
                temp(i,2) = sum(ExpectedCount(1:(i+handles.Windowing)));
            end

            for i = (1+handles.Windowing):1:(handles.NumLags-handles.Windowing)
                temp(i,1) = mean(ExpectedCount((i-handles.Windowing):(i+handles.Windowing)));
                temp(i,2) = sum(ExpectedCount((i-handles.Windowing):(i+handles.Windowing)));
            end

            for i = (handles.NumLags+1-handles.Windowing):1:handles.NumLags
                temp(i,1) = mean(ExpectedCount((i-handles.Windowing):handles.NumLags));
                temp(i,2) = sum(ExpectedCount((i-handles.Windowing):handles.NumLags));
            end

            % calculate random (windowed) normalized correlation count
            handles.Ave = ones(handles.NumLags,4);
            handles.AvePlusConf = zeros(handles.NumLags,4);
            AveMinusConf = zeros(handles.NumLags,4);
            PowerLaw = zeros(handles.NumLags,1);
            for i = 1:1:handles.NumLags
                factor = 3/2 * (handles.ApertureCount) ^ (1/3);
                PowerLaw(i) = (1-handles.Extension)^2 * handles.ZeeScore * ...
                    handles.LengthScale(i) / (factor * handles.ScanlineLength) * ...
                    sqrt(abs(cos(pi*handles.LengthScale(i)/handles.ScanlineLength)));
                Conf = (1-handles.Extension)^2 * handles.ZeeScore / ...
                    sqrt(handles.SeparationCount * temp(i,2)) + PowerLaw(i);
                handles.AvePlusConf(i,2) = 1 + Conf;
                AveMinusConf(i,2) = 1 - Conf;
            end

            % de-normalize random normalized correlation count
            handles.Ave(1:handles.NumLags,4) = temp(1:handles.NumLags,1);
            handles.AvePlusConf(1:handles.NumLags,4) = ...
                handles.AvePlusConf(1:handles.NumLags,2) ...
                .* temp(1:handles.NumLags,1);
            AveMinusConf(1:handles.NumLags,4) = ...
                AveMinusConf(1:handles.NumLags,2) ...
                .* temp(1:handles.NumLags,1);

            % account for size weighting of features
            WeightingFactor = 1 + handles.CvAp ^ 2;

            % calculate weighted random (windowed) normalized correlation count
            handles.Ave(1:handles.NumLags,1) = handles.Ave(1:handles.NumLags,2);
            for i = 1:1:handles.NumLags
                Conf = (1-handles.Extension)^2 * handles.ZeeScore / ...
                    sqrt(handles.SeparationCount * temp(i,2)) * WeightingFactor ...
                    + PowerLaw(i);
                handles.AvePlusConf(i,1) = 1 + Conf;
                AveMinusConf(i,1) = 1 - Conf;
            end

            % de-normalize weighted random normalized correlation count
            handles.Ave(1:handles.NumLags,3) = temp(1:handles.NumLags,1);
            handles.AvePlusConf(1:handles.NumLags,3) = ...
                handles.AvePlusConf(1:handles.NumLags,1) ...
                .* temp(1:handles.NumLags,1);
            AveMinusConf(1:handles.NumLags,3) = ...
                AveMinusConf(1:handles.NumLags,1) ...
                .* temp(1:handles.NumLags,1);

            handles.AvePlusConf(1+handles.NumLags,1:4) = NaN;
            handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,1:4) = ...
                AveMinusConf(1:handles.NumLags,1:4);

            clear ExpectedCount;
            clear temp;
            clear AveMinusConf;
            clear PowerLaw;

        elseif handles.PlotType == 3
           
            handles.Ave = ones(handles.NumLags,4);
            handles.Ave(1:handles.NumLags,3) = ...
                sum(handles.Aperture) / handles.ScanlineLength;
            handles.Ave(1:handles.NumLags,4) = ...
                handles.ApertureCount / handles.ScanlineLength;

            handles.AvePlusConf = zeros(handles.NumLags,4);
            
            weighting = ones(handles.NumLags,4);
            
            weighting(1:handles.NumLags,1) = handles.CvAp;

            weighting(1:handles.NumLags,3) = handles.CvAp;

%             weighting(1:handles.NumLags,1) = weighting(1:handles.NumLags,1) * ...
%                 10 * (1 - exp(-0.1 * ...
%                 std(handles.Aperture) / mean(handles.Aperture) ));
% 
%             weighting(1:handles.NumLags,3) = weighting(1:handles.NumLags,3) * ...
%                 10 * (1 - exp(-0.1 * ...
%                 std(handles.Aperture) / mean(handles.Aperture) ));

        %     weighting(1:handles.NumLags,3) = weighting(1:handles.NumLags,3) * ...
        %         10 * (1 - exp(-0.1 * ...
        %         std(handles.Aperture) / mean(handles.Aperture) ));
            
            handles.AvePlusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) .* ...
                (1 + weighting(1:handles.NumLags,1:4) .* ...
                sqrt(handles.NumLags / handles.ApertureCount) * ...
                handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
            
            AveMinusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) .* ...
                (1 - weighting(1:handles.NumLags,1:4) .* ...
                sqrt(handles.NumLags / handles.ApertureCount) * ...
                handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
            
            handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
            handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
                AveMinusConf(1:handles.NumLags,1:4);
            
            clear weighting;
            clear AveMinusConf;

            handles.LengthScale(1+handles.NumLags) = NaN;
            handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
                handles.LengthScale(1:handles.NumLags);
            
        elseif handles.PlotType == 7 % check value
           
            handles.AvePlusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) * ...
                (1 + handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
            
            AveMinusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) * ...
                (1 - handles.ZeeScore / sqrt(2 * handles.Windowing + 1));

            handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
            handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
                AveMinusConf(1:handles.NumLags,1:4);

            clear AveMinusConf;
            
            
        end
            
    else

        % recalculate averages and confidence limits of random results
        handles.Ave = zeros(handles.NumLags,4);
        handles.AvePlusConf = zeros(handles.NumLags,4);
        AveMinusConf = zeros(handles.NumLags,4);

        for i = 1:1:4
            [handles.Ave(1:handles.NumLags,i), ...
                handles.AvePlusConf(1:handles.NumLags,i), ...
                AveMinusConf(1:handles.NumLags,i)] = ...
                RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
                1:handles.RandomIterations,i), ...
                handles.NumLags, handles.RandomIterations, handles.ZeeScore);
            handles.AvePlusConf(1+handles.NumLags,i) = NaN;
            handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
                AveMinusConf(1:handles.NumLags,i);
        end

        if handles.PlotType == 3
            for i = 1:1:4
                for j = 1:1:handles.NumLags
                    handles.Ave(j,i) = ...
                        mean(handles.WindowRandomVertical(j,1:handles.RandomIterations,i));
                    StandardDeviation = ...
                        std(handles.WindowRandomVertical(j,1:handles.RandomIterations,i));
                    handles.AvePlusConf(j,i) = handles.Ave(j,i) ...
                        + handles.ZeeScore * StandardDeviation;
                    AveMinusConf(j,i) = handles.Ave(j,i) ...
                        - handles.ZeeScore * StandardDeviation;
                end

                clear StandardDeviation;

                handles.AvePlusConf(1+handles.NumLags,i) = NaN;
                handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
                    AveMinusConf(1:handles.NumLags,i);
            end
        end
        
        clear AveMinusConf;

    end
    
    handles.LengthScale(1+handles.NumLags) = NaN;
    handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
        handles.LengthScale(1:handles.NumLags);

	if handles.Normalized == 1
		if handles.Weighted == 1
			handles.Switch = 1;
		else
			handles.Switch = 2;
		end
	else
		if handles.Weighted == 1
			handles.Switch = 3;
		else
			handles.Switch = 4;
		end
	end
	
	if handles.PlotScaling == 1
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), ...
			'-k');
		
		hold on;
        
		if handles.PlotType <= 3
			loglog(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags, ...
				handles.Switch), '-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			loglog(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum, ...
				handles.Switch), '-b', 'LineWidth', 2);
		end
        
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), ...
			'-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 2
		
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), ...
			'-k');
			
		hold on;
        
		if handles.PlotType <= 3
			semilogy(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags, ...
				handles.Switch), '-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogy(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum, ...
				handles.Switch), '-b', 'LineWidth', 2);
		end
        
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), ...
			'-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 3
		
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), ...
			'-k');
			
		hold on;
        
		if handles.PlotType <= 3
			semilogx(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags, ...
				handles.Switch), '-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogx(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum, ...
				handles.Switch), '-b', 'LineWidth', 2);
		end
        
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), ...
			'-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 4
		
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), ...
			'-k');
			
		hold on;
        
		if handles.PlotType <= 3
			plot(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags, ...
				handles.Switch), '-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			plot(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum, ...
				handles.Switch), '-b', 'LineWidth', 2);
		end
        
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), ...
			'-g', 'LineWidth', 2);
		hold off;
		
	end
	
	if handles.UserAxes == 1
		ylim([handles.MinY handles.MaxY]);
		xlim([handles.MinX handles.MaxX]);
    elseif handles.PlotType == 3 || handles.PlotType == 4
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    elseif handles.PlotScaling == 1 || handles.PlotScaling == 2
        if handles.PlotType == 5 || handles.PlotType == 6
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
        else
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.NumLags,handles.Switch)));
        end
        if junk(1) == 0
            handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
        else
            handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
        end
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
        clear junk;
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
        ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
		
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    else
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
	end
	
	grid on;
	set(handles.PlotAxes, 'XMinorTick', 'on');
	set(handles.PlotAxes, 'YMinorTick', 'on');
	set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');
	
	title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');
	
	[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
		GetLabels(handles.PlotType, handles.Normalized, ...
		handles.Weighted, handles.Units);
	
	xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
	ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');
	
	legend(handles.Confidence, 'input data', 'randomized data');
	legend('Location', handles.Corner);
	
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ConfidenceIntervalPopup_CreateFcn(hObject, ~, ~)
% hObject    handle to ConfidenceIntervalPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WindowingEdit_Callback(hObject, ~, handles)
% hObject    handle to WindowingEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindowingEdit as text
%        str2double(get(hObject,'String')) returns contents of WindowingEdit as a double

% evaluate user input
OldValue = get(hObject, 'Value');
NewValue = str2double(get(hObject,'String'));

fprintf(' \n');
% disp(sprintf(' '));
printout = sprintf('oldvalue = %10.4f', OldValue);
disp(printout);
printout = sprintf('newvalue = %10.4f', NewValue);
disp(printout);

if isnan(NewValue)
    set(hObject, 'String', [num2str(OldValue) ' ']);
elseif NewValue < 0
    set(hObject, 'String', [num2str(0) ' ']);
    set(hObject, 'Value', 0);
    handles.Windowing = 0;
    Update = 1;
else
    set(hObject, 'String', [num2str(round(NewValue)) ' ']);
    set(hObject, 'Value', round(NewValue));
    handles.Windowing = round(NewValue);
    Update = 1;
end

% rewindow and regraph
if Update == 1 && handles.PlotType > 0

if handles.PlotType == 1 || handles.PlotType == 3 || handles.PlotType == 5 || handles.PlotType == 7
	
	% rewindow analysis of observed features
	if handles.PlotType == 1 || handles.PlotType == 3 || handles.PlotType == 7
		[handles.WindowVertical(1:handles.NumLags,1)] = WindowCalc( ...
			handles.Vertical(1:handles.NumLags,1), ...
			handles.NumLags, handles.Windowing);
		[handles.WindowVertical(1:handles.NumLags,2)] = WindowCalc( ...
			handles.Vertical(1:handles.NumLags,2), ...
			handles.NumLags, handles.Windowing);
		[handles.WindowVertical(1:handles.NumLags,3)] = WindowCalc( ...
			handles.Vertical(1:handles.NumLags,3), ...
			handles.NumLags, handles.Windowing);
		[handles.WindowVertical(1:handles.NumLags,4)] = WindowCalc( ...
			handles.Vertical(1:handles.NumLags,4), ...
			handles.NumLags, handles.Windowing);
	elseif handles.PlotType == 5
		[handles.WindowVertical(1:handles.OutputNum,1)] = WindowCalc( ...
			handles.Vertical(1:handles.OutputNum,1), ...
			handles.OutputNum, handles.Windowing);
		[handles.WindowVertical(1:handles.OutputNum,2)] = WindowCalc( ...
			handles.Vertical(1:handles.OutputNum,2), ...
			handles.OutputNum, handles.Windowing);
		[handles.WindowVertical(1:handles.OutputNum,3)] = WindowCalc( ...
			handles.Vertical(1:handles.OutputNum,3), ...
			handles.OutputNum, handles.Windowing);
		[handles.WindowVertical(1:handles.OutputNum,4)] = WindowCalc( ...
			handles.Vertical(1:handles.OutputNum,4), ...
			handles.OutputNum, handles.Windowing);
	end
	
	if handles.MonteCarlo == 1
        
        % introduce status bar if NumLags > 1000 ?
		
		% rewindow analysis of randomized features
		for i = 1:1:handles.RandomIterations
			[handles.WindowRandomVertical(1:handles.NumLags,i,1)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,i,1), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,2)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,i,2), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,3)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,i,3), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,4)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,i,4), ...
				handles.NumLags, handles.Windowing);			
		end

		% recalculate averages and confidence limits of randomized features
		handles.Ave = zeros(handles.NumLags,4);
		handles.AvePlusConf = zeros(handles.NumLags,4);
		AveMinusConf = zeros(handles.NumLags,4);

		for i = 1:1:4
			[handles.Ave(1:handles.NumLags,i), ...
				handles.AvePlusConf(1:handles.NumLags,i), ...
				AveMinusConf(1:handles.NumLags,i)] = ...
				RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
				1:handles.RandomIterations,i), ...
				handles.NumLags, handles.RandomIterations, handles.ZeeScore);
			handles.AvePlusConf(1+handles.NumLags,i) = NaN;
			handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
				AveMinusConf(1:handles.NumLags,i);
		end
        
        if handles.PlotType == 3
            for i = 1:1:4
                for j = 1:1:handles.NumLags
                    handles.Ave(j,i) = ...
                        mean(handles.WindowRandomVertical(j,1:handles.RandomIterations,i));
                    StandardDeviation = ...
                        std(handles.WindowRandomVertical(j,1:handles.RandomIterations,i));
                    handles.AvePlusConf(j,i) = handles.Ave(j,i) ...
                        + handles.ZeeScore * StandardDeviation;
                    AveMinusConf(j,i) = handles.Ave(j,i) ...
                        - handles.ZeeScore * StandardDeviation;
                end

                clear StandardDeviation;

                handles.AvePlusConf(1+handles.NumLags,i) = NaN;
                handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
                    AveMinusConf(1:handles.NumLags,i);
            end
        end
        
        clear AveMinusConf;
        
	elseif handles.Analytical == 1
		
        if handles.PlotType == 1
            
            % recalculate expected correlation count
    % 		ExpectedCount = zeros(handles.NumLags,1);
            [ExpectedCount] = ExpectedCalc(handles.LengthScale, ...
                handles.NumLags, handles.ScanlineLength);

            AveMinusConf = zeros(handles.NumLags,4);

            % window expected (normalized) correlation count
            temp = zeros(handles.NumLags,2);
            for i = 1:1:handles.Windowing
                temp(i,1) = mean(ExpectedCount(1:(i+handles.Windowing)));
                temp(i,2) = sum(ExpectedCount(1:(i+handles.Windowing)));
            end

            for i = (1+handles.Windowing):1:(handles.NumLags-handles.Windowing)
                temp(i,1) = mean(ExpectedCount((i-handles.Windowing):(i+handles.Windowing)));
                temp(i,2) = sum(ExpectedCount((i-handles.Windowing):(i+handles.Windowing)));
            end

            for i = (handles.NumLags+1-handles.Windowing):1:handles.NumLags
                temp(i,1) = mean(ExpectedCount((i-handles.Windowing):handles.NumLags));
                temp(i,2) = sum(ExpectedCount((i-handles.Windowing):handles.NumLags));
            end

            % recalculate random (windowed) correlation count
            PowerLaw = zeros(handles.NumLags,1);
            for i = 1:1:handles.NumLags
                factor = 1.5 * (handles.ApertureCount) ^ (1/3);
                PowerLaw(i) = (1-handles.Extension)^2 * handles.ZeeScore * ...
                    handles.LengthScale(i) / (factor*handles.ScanlineLength) * ...
                    sqrt(abs(cos(pi*handles.LengthScale(i)/handles.ScanlineLength)));
                Conf = (1-handles.Extension)^2 * handles.ZeeScore / ...
                    sqrt(handles.SeparationCount * temp(i,2)) + PowerLaw(i);
                handles.AvePlusConf(i,2) = 1 + Conf;
                AveMinusConf(i,2) = 1 - Conf;
            end

            % de-normalize random normalized correlation count
            handles.Ave(1:handles.NumLags,4) = temp(1:handles.NumLags,1);
            handles.AvePlusConf(1:handles.NumLags,4) = ...
                handles.AvePlusConf(1:handles.NumLags,2) ...
                .* temp(1:handles.NumLags,1);
            AveMinusConf(1:handles.NumLags,4) = ...
                AveMinusConf(1:handles.NumLags,2) ...
                .* temp(1:handles.NumLags,1);

            % account for size weighting of features
            WeightingFactor = 1 + handles.CvAp ^ 2;

            % calculate weighted random (windowed) normalized correlation count
            handles.Ave(1:handles.NumLags,1) = handles.Ave(1:handles.NumLags,2);
            for i = 1:1:handles.NumLags
                Conf = (1-handles.Extension)^2 * handles.ZeeScore / ...
                    sqrt(handles.SeparationCount * temp(i,2)) * WeightingFactor ...
                    + PowerLaw(i);
                handles.AvePlusConf(i,1) = 1 + Conf;
                AveMinusConf(i,1) = 1 - Conf;
            end

            % de-normalize weighted random normalized correlation count
            handles.Ave(1:handles.NumLags,3) = temp(1:handles.NumLags,1);
            handles.AvePlusConf(1:handles.NumLags,3) = ...
                handles.AvePlusConf(1:handles.NumLags,1) ...
                .* temp(1:handles.NumLags,1);
            AveMinusConf(1:handles.NumLags,3) = ...
                AveMinusConf(1:handles.NumLags,1) ...
                .* temp(1:handles.NumLags,1);

            handles.AvePlusConf(1+handles.NumLags,1:4) = NaN;
            handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,1:4) = ...
                AveMinusConf(1:handles.NumLags,1:4);

            clear ExpectedCount;
            clear temp;
            clear AveMinusConf;
            clear PowerLaw;
            
        elseif handles.PlotType == 3
            
            handles.Ave = ones(handles.NumLags,4);
            handles.Ave(1:handles.NumLags,3) = ...
                sum(handles.Aperture) / handles.ScanlineLength;
            handles.Ave(1:handles.NumLags,4) = ...
                handles.ApertureCount / handles.ScanlineLength;

            handles.AvePlusConf = zeros(handles.NumLags,4);
            
            weighting = ones(handles.NumLags,4);
            
            weighting(1:handles.NumLags,1) = handles.CvAp;

            weighting(1:handles.NumLags,3) = handles.CvAp;

%             weighting(1:handles.NumLags,1) = weighting(1:handles.NumLags,1) * ...
%                 10 * (1 - exp(-0.1 * ...
%                 std(handles.Aperture) / mean(handles.Aperture) ));
% 
%             weighting(1:handles.NumLags,3) = weighting(1:handles.NumLags,3) * ...
%                 10 * (1 - exp(-0.1 * ...
%                 std(handles.Aperture) / mean(handles.Aperture) ));

        %     weighting(1:handles.NumLags,3) = weighting(1:handles.NumLags,3) * ...
        %         10 * (1 - exp(-0.1 * ...
        %         std(handles.Aperture) / mean(handles.Aperture) ));
            
            handles.AvePlusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) .* ...
                (1 + weighting(1:handles.NumLags,1:4) .* ...
                sqrt(handles.NumLags / handles.ApertureCount) * ...
                handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
            
            AveMinusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) .* ...
                (1 - weighting(1:handles.NumLags,1:4) .* ...
                sqrt(handles.NumLags / handles.ApertureCount) * ...
                handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
            
            handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
            handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
                AveMinusConf(1:handles.NumLags,1:4);
            
            clear weighting;
            clear AveMinusConf;

            handles.LengthScale(1+handles.NumLags) = NaN;
            handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
                handles.LengthScale(1:handles.NumLags);
            
        elseif handles.PlotType == 7
            
            handles.AvePlusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) * ...
                (1 + handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
            
            AveMinusConf(1:handles.NumLags,1:4) = ...
                handles.Ave(1:handles.NumLags,1:4) * ...
                (1 - handles.ZeeScore / sqrt(2 * handles.Windowing + 1));

            handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
            handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
                AveMinusConf(1:handles.NumLags,1:4);

            clear AveMinusConf;
            
        end
		
	end
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
	% regraph results
	if handles.Normalized == 1
		if handles.Weighted == 1
			handles.Switch = 1;
		else
			handles.Switch = 2;
		end
	else
		if handles.Weighted == 1
			handles.Switch = 3;
		else
			handles.Switch = 4;
		end
	end
	
	if handles.PlotScaling == 1
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			loglog(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			loglog(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 2
		
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogy(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogy(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 3
		
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogx(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogx(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 4
		
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			plot(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			plot(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	end
	
	if handles.UserAxes == 1
		ylim([handles.MinY handles.MaxY]);
		xlim([handles.MinX handles.MaxX]);
    elseif handles.PlotType == 3 || handles.PlotType == 4
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    elseif handles.PlotScaling == 1 || handles.PlotScaling == 2
        if handles.PlotType == 5 || handles.PlotType == 6
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
        else
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.NumLags,handles.Switch)));
        end
        if junk(1) == 0
            handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
        else
            handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
        end
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
        clear junk;
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
        ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    else
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
	end
	
	grid on;
	set(handles.PlotAxes, 'XMinorTick', 'on');
	set(handles.PlotAxes, 'YMinorTick', 'on');
	set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');
	
	title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');
	
	[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
		GetLabels(handles.PlotType, handles.Normalized, ...
		handles.Weighted, handles.Units);
	
	xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
	ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');
	
	legend(handles.Confidence, 'input data', 'randomized data');
	legend('Location', handles.Corner);
	
end

end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function WindowingEdit_CreateFcn(hObject, ~, ~)
% hObject    handle to WindowingEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NormalizedOn.
function NormalizedOn_Callback(hObject, ~, handles)
% hObject    handle to NormalizedOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NormalizedOn

handles.Normalized = get(hObject,'Value');

% regraph results
if handles.PlotType > 0
	
	if handles.Normalized == 1
		if handles.Weighted == 1
			handles.Switch = 1;
		else
			handles.Switch = 2;
		end
	else
		if handles.Weighted == 1
			handles.Switch = 3;
		else
			handles.Switch = 4;
		end
	end
	
	if handles.PlotScaling == 1
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			loglog(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			loglog(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 2
		
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogy(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogy(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 3
		
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogx(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogx(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 4
		
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			plot(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			plot(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	end
		
	if handles.UserAxes == 1
		ylim([handles.MinY handles.MaxY]);
		xlim([handles.MinX handles.MaxX]);
    elseif handles.PlotType == 3 || handles.PlotType == 4
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    elseif handles.PlotScaling == 1 || handles.PlotScaling == 2
        if handles.PlotType == 5 || handles.PlotType == 6
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
        else
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.NumLags,handles.Switch)));
        end
        if junk(1) == 0
            handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
        else
            handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
        end
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
        clear junk;
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
        ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
		
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    else
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
	end
	
	grid on;
	set(handles.PlotAxes, 'XMinorTick', 'on');
	set(handles.PlotAxes, 'YMinorTick', 'on');
	set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');
	
	title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');
	
	[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
		GetLabels(handles.PlotType, handles.Normalized, ...
		handles.Weighted, handles.Units);
	
	xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
	ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');
	
	legend(handles.Confidence, 'input data', 'randomized data');
	legend('Location', handles.Corner);
	
end

guidata(hObject,handles);


% --- Executes on button press in WeightedOn.
function WeightedOn_Callback(hObject, ~, handles)
% hObject    handle to WeightedOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WeightedOn

handles.Weighted = get(hObject,'Value');

% regraph results
if handles.PlotType > 0
	
	if handles.Normalized == 1
		if handles.Weighted == 1
			handles.Switch = 1;
		else
			handles.Switch = 2;
		end
	else
		if handles.Weighted == 1
			handles.Switch = 3;
		else
			handles.Switch = 4;
		end
	end
	
	if handles.PlotScaling == 1
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
        
		hold on;
		if handles.PlotType <= 3
			loglog(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			loglog(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
		
		loglog(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 2
		
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogy(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogy(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogy(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 3
		
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			semilogx(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			semilogx(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		semilogx(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	elseif handles.PlotScaling == 4
		
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:1+2*handles.NumLags), ...
			handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');

		hold on;
		if handles.PlotType <= 3
			plot(handles.PlotAxes, ...
				handles.LengthScale(1:handles.NumLags), ...
				handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
				'-b', 'LineWidth', 2);
		elseif handles.PlotType >= 4
			plot(handles.PlotAxes, ...
				handles.Horizontal(1:handles.OutputNum), ...
				handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
				'-b', 'LineWidth', 2);
		end
			
		plot(handles.PlotAxes, ...
			handles.LengthScale(1:handles.NumLags), ...
			handles.Ave(1:handles.NumLags,handles.Switch), '-g', 'LineWidth', 2);
		hold off;
		
	end
	
	if handles.UserAxes == 1
		ylim([handles.MinY handles.MaxY]);
		xlim([handles.MinX handles.MaxX]);
    elseif handles.PlotType == 3 || handles.PlotType == 4
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    elseif handles.PlotScaling == 1 || handles.PlotScaling == 2
        if handles.PlotType == 5 || handles.PlotType == 6
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
        else
            junk = sort(unique( ...
                handles.WindowVertical(1:handles.NumLags,handles.Switch)));
        end
        if junk(1) == 0
            handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
        else
            handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
        end
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
        clear junk;
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
        ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
		
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
    else
		temp = ylim;
    	handles.MinY = temp(1);
		set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
		set(handles.MinYEdit, 'Value', handles.MinY);
		handles.MaxY = temp(2);
		set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
		set(handles.MaxYEdit, 'Value', handles.MaxY);
        
		temp = xlim;
		handles.MinX = temp(1);
		set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
		set(handles.MinXEdit, 'Value', handles.MinX);
		handles.MaxX = temp(2);
		set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
		set(handles.MaxXEdit, 'Value', handles.MaxX);
	end
	
	grid on;
	set(handles.PlotAxes, 'XMinorTick', 'on');
	set(handles.PlotAxes, 'YMinorTick', 'on');
	set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');
	
	title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');
	
	[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
		GetLabels(handles.PlotType, handles.Normalized, ...
		handles.Weighted, handles.Units);
	
	xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
	ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');
	
	legend(handles.Confidence, 'input data', 'randomized data');
	legend('Location', handles.Corner);
	
end

guidata(hObject,handles);




% --- Executes on button press in CCButton.
function CCButton_Callback(hObject, ~, handles)
% hObject    handle to CCButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CCButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

    %why is following line (and closing end statement) commented out ??
    % it keeps button active when analytical = true
    
% if handles.PlotType ~= 1
	
handles.PlotType = 1;

% determine length scales for analysis

Fourier = false;

if Fourier ~= true
    
    handles.LengthScale = zeros(handles.NumLags,1);
    [handles.LengthScale] = LagCalc(handles.MinLag, handles.MaxLag, ...
        handles.NumLags, handles.SpacingSize, handles.SpacingNum, ...
        handles.Graduations);
    
else
    
    % force length scales to follow Fourier pattern
    Precision = handles.ScanlineLength / handles.NumLags;
    
    handles.MinLag = Precision;
    
    handles.MaxLag = handles.ScanlineLength;
    
    set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
    set(handles.MinLagEdit, 'Value', handles.MinLag);
    %set(handles.MinLagEdit,'Enable','off');
    
    set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
    set(handles.MaxLagEdit, 'Value', handles.MaxLag);
    %set(handles.MaxLagEdit,'Enable','off');
    
    % calculate descriptive statistics
    if handles.InsertFeatures == 1
        ScanlineLength = round((sum(handles.Spacing) + sum(handles.Aperture)) / Precision);
    else
        ScanlineLength = round((sum(handles.Spacing) + 0) / Precision);
    end
    
    % calculate Frequency and Wavelength for Fourier analysis
    Frequency = ScanlineLength:-1:0;
    Frequency = Frequency ./ (2 * ScanlineLength);
    
    Frequency = Frequency.';
    Wavelength = 1 ./ Frequency;
    
    % correct independent variable for input precision
    LengthScale = Wavelength .* Precision;
    
    clear Frequency;
    clear Wavelength;
    
    handles.LengthScale = zeros(handles.NumLags,1);
    handles.LengthScale(1:ScanlineLength,1) = LengthScale(1:ScanlineLength) ./ 2;
    clear LengthScale
    % force length scales to follow Fourier pattern
    
end

% calculate fracture separations
% Separation = zeros(handles.SeparationCount,1);
[Separation] = SeparationCalc(handles.Aperture, handles.ApertureCount, ...
    handles.Spacing, handles.SeparationCount, handles.InsertFeatures);

% calculate weighted and unweighted correlation count
% CorrelationCount = zeros(handles.NumLags,2);
[CorrelationCount] = CorrelationCalc(Separation, ...
	handles.SeparationCount, handles.LengthScale, handles.NumLags, ...
	handles.ApertureCount, handles.SumAperture, handles.SumSqAp);
clear Separation;

% calculate expected correlation count
% ExpectedCount = zeros(handles.NumLags,1);
[ExpectedCount] = ExpectedCalc(handles.LengthScale, ...
	handles.NumLags, handles.ScanlineLength);

% normalize correlation count
handles.Vertical = zeros(handles.NumLags,4);
handles.Vertical(1:handles.NumLags,1) = ...
	CorrelationCount(1:handles.NumLags,1) ./ ExpectedCount;
handles.Vertical(1:handles.NumLags,2) = ...
	CorrelationCount(1:handles.NumLags,2) ./ ExpectedCount;
handles.Vertical(1:handles.NumLags,3) = ...
	CorrelationCount(1:handles.NumLags,1);
handles.Vertical(1:handles.NumLags,4) = ...
	CorrelationCount(1:handles.NumLags,2);
clear CorrelationCount;

% window correlation count
handles.WindowVertical = zeros(handles.NumLags,4);
if handles.Windowing > 0
	[handles.WindowVertical(1:handles.NumLags,1)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,1), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,2)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,2), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,3)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,3), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,4)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,4), ...
		handles.NumLags, handles.Windowing);
else
	handles.WindowVertical = handles.Vertical;
end

% correlation count of randomized (Monte Carlo) features
if handles.MonteCarlo == 1
	
	% create arrays for randomized analysis
	handles.RandomVertical = zeros(handles.NumLags, ...
		handles.RandomIterations,4);
	handles.WindowRandomVertical = zeros(handles.NumLags, ...
		handles.RandomIterations,4);
	
	% create dialog box for reporting status
    StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');
    
	% analyze randomized fractures
	for i = 1:1:handles.RandomIterations
		
		% calculate random correlation count
% 		RandomCorrCount = zeros(handles.NumLags,2);
		[RandomCorrCount] = CorrelationCalc( ...
			handles.RandomSeparation(1:handles.SeparationCount, ...
			(2*i-1):(2*i)), handles.SeparationCount, ...
			handles.LengthScale, handles.NumLags, handles.ApertureCount, ...
			handles.SumAperture, handles.SumSqAp);
		
		% normalize random correlation count
		handles.RandomVertical(1:handles.NumLags,i,1) = ...
			RandomCorrCount(1:handles.NumLags,1) ./ ExpectedCount;
		handles.RandomVertical(1:handles.NumLags,i,2) = ...
			RandomCorrCount(1:handles.NumLags,2) ./ ExpectedCount;
		handles.RandomVertical(1:handles.NumLags,i,3) = ...
			RandomCorrCount(1:handles.NumLags,1);
		handles.RandomVertical(1:handles.NumLags,i,4) = ...
			RandomCorrCount(1:handles.NumLags,2);
		
		% window random correlation count
		if handles.Windowing > 0
			[handles.WindowRandomVertical(1:handles.NumLags,i,1)] = ...
				WindowCalc( ...
				handles.RandomVertical(1:handles.NumLags,i,1), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,2)] = ...
				WindowCalc( ...
				handles.RandomVertical(1:handles.NumLags,i,2), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,3)] = ...
				WindowCalc( ...
				handles.RandomVertical(1:handles.NumLags,i,3), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,4)] = ...
				WindowCalc( ...
				handles.RandomVertical(1:handles.NumLags,i,4), ...
				handles.NumLags, handles.Windowing);			
		else
			handles.WindowRandomVertical = handles.RandomVertical;
		end
		
		% update status via dialog box
		waitbar(i/handles.RandomIterations, StatusBox, ...
            sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
            i, handles.RandomIterations),'FontSize', 14);
		
	end
    
	% delete dialog box for reporting status
    delete(StatusBox);
	
	clear RandomCorrCount;
	
	% calculate averages and confidence limits of random correlation count
	handles.Ave = zeros(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	
	for i = 1:1:4
		[handles.Ave(1:handles.NumLags,i), ...
			handles.AvePlusConf(1:handles.NumLags,i), ...
			AveMinusConf(1:handles.NumLags,i)] = ...
			RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
			1:handles.RandomIterations,i), ...
			handles.NumLags, handles.RandomIterations, handles.ZeeScore);
		handles.AvePlusConf(1+handles.NumLags,i) = NaN;
		handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
			AveMinusConf(1:handles.NumLags,i);
	end
	
	clear ExpectedCount;
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
%	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
%	handles.ConfRandomCv = handles.ZeeScore * ...
%		std(handles.RandomCv(1:handles.RandomIterations));
	
% new code below, down to "graph results"

% correlation count of randomized (analytical) features
elseif handles.Analytical == 1
	
	% window expected (normalized) correlation count
	temp = zeros(handles.NumLags,2);
	for i = 1:1:handles.Windowing
		temp(i,1) = mean(ExpectedCount(1:(i+handles.Windowing)));
		temp(i,2) = sum(ExpectedCount(1:(i+handles.Windowing)));
	end

	for i = (1+handles.Windowing):1:(handles.NumLags-handles.Windowing)
		temp(i,1) = mean(ExpectedCount((i-handles.Windowing):(i+handles.Windowing)));
		temp(i,2) = sum(ExpectedCount((i-handles.Windowing):(i+handles.Windowing)));
	end

	for i = (handles.NumLags+1-handles.Windowing):1:handles.NumLags
		temp(i,1) = mean(ExpectedCount((i-handles.Windowing):handles.NumLags));
		temp(i,2) = sum(ExpectedCount((i-handles.Windowing):handles.NumLags));
	end
	
	% calculate random (windowed) normalized correlation count
	handles.Ave = ones(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	PowerLaw = zeros(handles.NumLags,1);
	for i = 1:1:handles.NumLags
		factor = 3/2 * (handles.ApertureCount) ^ (1/3);
		PowerLaw(i) = (1-handles.Extension)^2 * handles.ZeeScore * ...
			handles.LengthScale(i) / (factor * handles.ScanlineLength) * ...
			sqrt(abs(cos(pi*handles.LengthScale(i)/handles.ScanlineLength)));
		Conf = (1-handles.Extension)^2 * handles.ZeeScore / ...
			sqrt(handles.SeparationCount * temp(i,2)) + PowerLaw(i);
		handles.AvePlusConf(i,2) = 1 + Conf;
		AveMinusConf(i,2) = 1 - Conf;
	end
	
	% de-normalize random normalized correlation count
	handles.Ave(1:handles.NumLags,4) = temp(1:handles.NumLags,1);
	handles.AvePlusConf(1:handles.NumLags,4) = ...
		handles.AvePlusConf(1:handles.NumLags,2) ...
		.* temp(1:handles.NumLags,1);
	AveMinusConf(1:handles.NumLags,4) = ...
		AveMinusConf(1:handles.NumLags,2) ...
		.* temp(1:handles.NumLags,1);
	
	% account for size weight of features
	WeightingFactor = 1 + handles.CvAp ^ 2;
	
	% calculate weighted random (windowed) normalized correlation count
	handles.Ave(1:handles.NumLags,1) = handles.Ave(1:handles.NumLags,2);
	for i = 1:1:handles.NumLags
		Conf = (1-handles.Extension)^2 * handles.ZeeScore / ...
			sqrt(handles.SeparationCount * temp(i,2)) * WeightingFactor ...
			+ PowerLaw(i);
		handles.AvePlusConf(i,1) = 1 + Conf;
		AveMinusConf(i,1) = 1 - Conf;
	end
	
	% de-normalize weighted random normalized correlation count
	handles.Ave(1:handles.NumLags,3) = temp(1:handles.NumLags,1);
	handles.AvePlusConf(1:handles.NumLags,3) = ...
		handles.AvePlusConf(1:handles.NumLags,1) ...
		.* temp(1:handles.NumLags,1);
	AveMinusConf(1:handles.NumLags,3) = ...
		AveMinusConf(1:handles.NumLags,1) ...
		.* temp(1:handles.NumLags,1);
	
	handles.AvePlusConf(1+handles.NumLags,1:4) = NaN;
	handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,1:4) = ...
		AveMinusConf(1:handles.NumLags,1:4);
	
	clear ExpectedCount;
	clear temp;
	clear AveMinusConf;
	clear PowerLaw;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
end

% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2;
	end
else
	if handles.Weighted == 1
		handles.Switch = 3;
	else
		handles.Switch = 4;
	end
end

if handles.Graduations == 1
	
	loglog(handles.PlotAxes, ...
		handles.LengthScale(1:1+2*handles.NumLags), ...
		handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
	hold on;
	loglog(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
		'-b', 'LineWidth', 2);
	loglog(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.Ave(1:handles.NumLags,handles.Switch), ...
		'-g', 'LineWidth', 2);
	hold off;
	handles.PlotScaling = 1;
	set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);
	
else
	
	plot(handles.PlotAxes, ...
		handles.LengthScale(1:1+2*handles.NumLags), ...
		handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
	hold on;
	plot(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
		'-b', 'LineWidth', 2);
	plot(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.Ave(1:handles.NumLags,handles.Switch), ...
		'-g', 'LineWidth', 2);
	hold off;
	handles.PlotScaling = 4;
	set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);
	
end

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
elseif handles.Graduations == 1
	junk = sort(unique( ...
        handles.WindowVertical(1:handles.NumLags,handles.Switch)));
    if junk(1) == 0
        handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
    else
        handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
    end
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    clear junk;
    
	ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
else
	temp = ylim;
	handles.MinX = temp(1);
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxX = temp(2);
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

end

set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

% end

guidata(hObject,handles);


% --- Executes on button press in CSButton.
function CSButton_Callback(hObject, ~, handles)
% hObject    handle to CSButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CSButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

% note: windowing not implemented
if handles.PlotType ~= 2
	
handles.PlotType = 2;

% determine length scales for analysis
handles.LengthScale = zeros(handles.NumLags,1);
[handles.LengthScale] = LagCalc(handles.MinLag, handles.MaxLag, ...
    handles.NumLags, handles.SpacingSize, handles.SpacingNum, ...
	handles.Graduations);

% calculate fracture separations
% Separation = zeros(handles.SeparationCount,1);
[Separation] = SeparationCalc(handles.Aperture, ...
    handles.ApertureCount, handles.Spacing, handles.SeparationCount, ...
	handles.InsertFeatures);

% calculate weighted and unweighted correlation count
% CorrelationCount = zeros(handles.NumLags,2);
[CorrelationCount] = CorrelationCalc(Separation, ...
    handles.SeparationCount, handles.LengthScale, handles.NumLags, ...
    handles.ApertureCount, handles.SumAperture, handles.SumSqAp);
clear Separation;

% calculate weighted and unweighted correlation sum from correlation count
CorrelationSum = zeros(handles.NumLags,2);
CorrelationSum(1,1:2) = CorrelationCount(1,1:2);
for i = 2:1:handles.NumLags
    CorrelationSum(i,1) = CorrelationCount(i,1) + ...
		CorrelationSum(i-1,1);
    CorrelationSum(i,2) = CorrelationCount(i,2) + ...
		CorrelationSum(i-1,2);
end
clear CorrelationCount;

% calculate expected correlation sum
% ExpectedCount = zeros(handles.NumLags,1);
[ExpectedCount] = ExpectedCalc(handles.LengthScale, ...
	handles.NumLags, handles.ScanlineLength);

ExpectedSum = zeros(handles.NumLags,1);
ExpectedSum(1) = ExpectedCount(1);
for i = 2:1:handles.NumLags
	ExpectedSum(i) = ExpectedSum(i-1) + ...
		ExpectedCount(i);
end
clear ExpectedCount;

% calculate normalized correlation sum
handles.WindowVertical = zeros(handles.NumLags,4);
handles.WindowVertical(1:handles.NumLags,1) = ...
	CorrelationSum(1:handles.NumLags,1) ./ ExpectedSum;
handles.WindowVertical(1:handles.NumLags,2) = ...
	CorrelationSum(1:handles.NumLags,2) ./ ExpectedSum;
handles.WindowVertical(1:handles.NumLags,3) = ...
	CorrelationSum(1:handles.NumLags,1);
handles.WindowVertical(1:handles.NumLags,4) = ...
	CorrelationSum(1:handles.NumLags,2);
clear CorrelationSum;

% correlation sum of randomized features
if handles.RandomIterations > 0
	
	% create arrays for randomized analysis
	handles.WindowRandomVertical = zeros(handles.NumLags, ...
		handles.RandomIterations,4);
	
	% create dialog box for reporting status
    StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');
    
	% analyze randomized fractures
	for i = 1:1:handles.RandomIterations
		
		% calculate random correlation count
% 		RandomCorrCount = zeros(handles.NumLags,2);
		[RandomCorrCount] = CorrelationCalc( ...
			handles.RandomSeparation(1:handles.SeparationCount, ...
			(2*i-1):(2*i)), handles.SeparationCount, ...
			handles.LengthScale, handles.NumLags, handles.ApertureCount, ...
			handles.SumAperture, handles.SumSqAp);
		
		% calculate correlation sum from correlation count
		RandomCorrSum = zeros(handles.NumLags, 2);
		RandomCorrSum(1,1:2) = RandomCorrCount(1,1:2);
		for j = 2:1:handles.NumLags
			RandomCorrSum(j,1) = RandomCorrSum(j-1,1) + ...
				RandomCorrCount(j,1);
			RandomCorrSum(j,2) = RandomCorrSum(j-1,2) + ...
				RandomCorrCount(j,2);
		end
		
		% normalize random correlation sum
		handles.WindowRandomVertical(1:handles.NumLags,i,1) = ...
			RandomCorrSum(1:handles.NumLags,1) ./ ExpectedSum;
		handles.WindowRandomVertical(1:handles.NumLags,i,2) = ...
			RandomCorrSum(1:handles.NumLags,2) ./ ExpectedSum;
		handles.WindowRandomVertical(1:handles.NumLags,i,3) = ...
			RandomCorrSum(1:handles.NumLags,1);
		handles.WindowRandomVertical(1:handles.NumLags,i,4) = ...
			RandomCorrSum(1:handles.NumLags,2);
		
		% update status via dialog box
		waitbar(i/handles.RandomIterations, StatusBox, ...
            sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
            i, handles.RandomIterations),'FontSize', 14);
		
	end
    
	% delete dialog box for reporting status
    delete(StatusBox);
	
	clear RandomCorrCount;
	clear RandomCorrSum;
	clear ExpectedSum;
	
	% calculate averages and confidence limits of 
	% random correlation sum
	handles.Ave = zeros(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	
	for i = 1:1:4
		[handles.Ave(1:handles.NumLags,i), ...
			handles.AvePlusConf(1:handles.NumLags,i), ...
			AveMinusConf(1:handles.NumLags,i)] = ...
			RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
			1:handles.RandomIterations,i), ...
			handles.NumLags, handles.RandomIterations, handles.ZeeScore);
		handles.AvePlusConf(1+handles.NumLags,i) = NaN;
		handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
			AveMinusConf(1:handles.NumLags,i);
	end
	
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
%	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
%	handles.ConfRandomCv = handles.ZeeScore * ...
%		std(handles.RandomCv(1:handles.RandomIterations));
	
end

% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2;
	end
else
	if handles.Weighted == 1
		handles.Switch = 3;
	else
		handles.Switch = 4;
	end
end

if handles.Graduations == 1
	
	loglog(handles.PlotAxes, ...
		handles.LengthScale(1:1+2*handles.NumLags), ...
		handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
    
	hold on;
	loglog(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
		'-b', 'LineWidth', 2);
	loglog(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.Ave(1:handles.NumLags,handles.Switch), ...
		'-g', 'LineWidth', 2);
	hold off;
    
	handles.PlotScaling = 1;
	set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);
	
else
	
	plot(handles.PlotAxes, ...
		handles.LengthScale(1:1+2*handles.NumLags), ...
		handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
    
	hold on;
	plot(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
		'-b', 'LineWidth', 2);
	plot(handles.PlotAxes, ...
		handles.LengthScale(1:handles.NumLags), ...
		handles.Ave(1:handles.NumLags,handles.Switch), ...
		'-g', 'LineWidth', 2);
	hold off;
    
	handles.PlotScaling = 4;
	set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);
	
end

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
elseif handles.Graduations == 1
	junk = sort(unique( ...
        handles.WindowVertical(1:handles.NumLags,handles.Switch)));
    if junk(1) == 0
        handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
    else
        handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
    end
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
    clear junk;
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    
	ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
else
	temp = ylim;
	handles.MinX = temp(1);
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxX = temp(2);
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

end

set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

guidata(hObject,handles);


% --- Executes on button press in IntensityButton.
function IntensityButton_Callback(hObject, ~, handles)
% hObject    handle to IntensityButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IntensityButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else
	
% if handles.PlotType ~= 3
	
handles.PlotType = 3;

% determine domain intervals for analysis
handles.LengthScale = zeros(handles.NumLags,1);
Increment = (handles.EndScan - handles.StartScan) / (handles.NumLags-1);
%handles.LengthScale(1) = handles.StartScan;
for i = 2:1:handles.NumLags
	handles.LengthScale(i) = handles.LengthScale(i-1) + Increment;
end

% calculate weighted and unweighted intensity 
% of observed features in each interval
% Intensity = zeros(handles.NumLags,2);
[Intensity] = ...
	IntensityCalc(handles.Aperture, handles.Spacing, ...
	handles.ApertureCount, handles.NumLags, handles.LengthScale, ...
	Increment, handles.InsertFeatures);

% calculate expected intensity
MeanIntensity = zeros(1,2);
MeanIntensity(1) = mean(Intensity(2:handles.NumLags,1));
MeanIntensity(2) = mean(Intensity(2:handles.NumLags,2));

% normalize intensity
handles.Vertical = zeros(handles.NumLags,4);
handles.Vertical(2:handles.NumLags,1) = ...
	Intensity(2:handles.NumLags,1) / MeanIntensity(1);
handles.Vertical(2:handles.NumLags,2) = ...
	Intensity(2:handles.NumLags,2) / MeanIntensity(2);
handles.Vertical(2:handles.NumLags,3) = ...
	Intensity(2:handles.NumLags,1);
handles.Vertical(2:handles.NumLags,4) = ...
	Intensity(2:handles.NumLags,2);
handles.Vertical(1,1:4) = handles.Vertical(2,1:4);
clear Intensity;

% window intensity
handles.WindowVertical = zeros(handles.NumLags,4);
if handles.Windowing > 0
	[handles.WindowVertical(1:handles.NumLags,1)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,1), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,2)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,2), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,3)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,3), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,4)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,4), ...
		handles.NumLags, handles.Windowing);
else
	handles.WindowVertical = handles.Vertical;
end

% intensity of randomized (Monte Carlo) features
if handles.MonteCarlo == 1
	
    % calculate intensity of randomized features in each interval
    if handles.RandomIterations > 0

        % create arrays for randomized analysis
        handles.RandomVertical = zeros(handles.NumLags, ...
            handles.RandomIterations,4);
        handles.WindowRandomVertical = zeros(handles.NumLags, ...
            handles.RandomIterations,4);

        % create dialog box for reporting status
        StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');

        % analyze randomized features
        for i = 1:1:handles.RandomIterations

            % calculate weighted and unweighted random intensity
    % 		RandomIntensity = zeros(handles.NumLags,2);
            [RandomIntensity] = IntensityCalc( ...
                handles.RandomScanlines(1:handles.SpacingCount,2*i), ...
                handles.RandomScanlines(1:handles.SpacingCount,2*i-1), ...
                handles.ApertureCount, handles.NumLags, ...
                handles.LengthScale, Increment, handles.InsertFeatures);

            % normalize random intensity
            handles.RandomVertical(2:handles.NumLags,i,1) = ...
                RandomIntensity(2:handles.NumLags,1) / MeanIntensity(1);
            handles.RandomVertical(2:handles.NumLags,i,2) = ...
                RandomIntensity(2:handles.NumLags,2) / MeanIntensity(2);
            handles.RandomVertical(2:handles.NumLags,i,3) = ...
                RandomIntensity(2:handles.NumLags,1);
            handles.RandomVertical(2:handles.NumLags,i,4) = ...
                RandomIntensity(2:handles.NumLags,2);
            handles.RandomVertical(1,i,1:4) = handles.RandomVertical(2,i,1:4);

            % window random intensity
            if handles.Windowing > 0
                [handles.WindowRandomVertical(1:handles.NumLags,i,1)] = ...
                    WindowCalc(handles.RandomVertical(1:handles.NumLags,i,1), ...
                    handles.NumLags, handles.Windowing);
                [handles.WindowRandomVertical(1:handles.NumLags,i,2)] = ...
                    WindowCalc(handles.RandomVertical(1:handles.NumLags,i,2), ...
                    handles.NumLags, handles.Windowing);
                [handles.WindowRandomVertical(1:handles.NumLags,i,3)] = ...
                    WindowCalc(handles.RandomVertical(1:handles.NumLags,i,3), ...
                    handles.NumLags, handles.Windowing);
                [handles.WindowRandomVertical(1:handles.NumLags,i,4)] = ...
                    WindowCalc(handles.RandomVertical(1:handles.NumLags,i,4), ...
                    handles.NumLags, handles.Windowing);
            else
                handles.WindowRandomVertical = handles.RandomVertical;
            end

            % update status via dialog box
            waitbar(i/handles.RandomIterations, StatusBox, ...
                sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
                i, handles.RandomIterations),'FontSize', 14);

        end

        % delete dialog box for reporting status
        delete(StatusBox);

        clear RandomIntensity;
        clear MeanIntensity;

        % calculate averages and confidence limits of random intensity
        handles.Ave = zeros(handles.NumLags,4);
        handles.AvePlusConf = zeros(handles.NumLags,4);
        AveMinusConf = zeros(handles.NumLags,4);

        for i = 1:1:4
            for j = 1:1:handles.NumLags
                handles.Ave(j,i) = ...
                    mean(handles.WindowRandomVertical(j,1:handles.RandomIterations,i));
                StandardDeviation = ...
                    std(handles.WindowRandomVertical(j,1:handles.RandomIterations,i));
                handles.AvePlusConf(j,i) = handles.Ave(j,i) ...
                    + handles.ZeeScore * StandardDeviation;
                AveMinusConf(j,i) = handles.Ave(j,i) ...
                    - handles.ZeeScore * StandardDeviation;

%                 if AveMinusConfidence(j) < 0
%                     AveMinusConfidence(j) = 0;
%                 end
            end
            
            clear StandardDeviation;
            
%             handles.Ave(1:handles.NumLags,i) = Ave(1:NumLags);
%             
%             [handles.Ave(1:handles.NumLags,i), ...
%                 handles.AvePlusConf(1:handles.NumLags,i), ...
%                 AveMinusConf(1:handles.NumLags,i)] = ...
%                 RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
%                 1:handles.RandomIterations,i), ...
%                 handles.NumLags, handles.RandomIterations, handles.ZeeScore);
            handles.AvePlusConf(1+handles.NumLags,i) = NaN;
            handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
                AveMinusConf(1:handles.NumLags,i);
        end
        
        clear AveMinusConf;
        
%         answer = [handles.ApertureCount, handles.ScanlineLength, ...
%             sum(handles.Aperture), std(handles.Aperture)];

        handles.LengthScale(1+handles.NumLags) = NaN;
        handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
            handles.LengthScale(1:handles.NumLags);

    %	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
    %	handles.ConfRandomCv = handles.ZeeScore * ...
    %		std(handles.RandomCv(1:handles.RandomIterations));

    end
    
% intensity of randomized (analytical) features
elseif handles.Analytical == 1
    
	handles.Ave = ones(handles.NumLags,2);
	handles.Ave(1:handles.NumLags,3) = ...
        sum(handles.Aperture) / handles.ScanlineLength;
	handles.Ave(1:handles.NumLags,4) = ...
        handles.ApertureCount / handles.ScanlineLength;
    
	handles.AvePlusConf = zeros(handles.NumLags,4);
    
    % new code begins
    
    weighting = ones(handles.NumLags,4);
    
    weighting(1:handles.NumLags,1) = handles.CvAp;
    
    weighting(1:handles.NumLags,3) = handles.CvAp;
    
%     weighting(1:handles.NumLags,1) = weighting(1:handles.NumLags,1) * ...
%         10 * (1 - exp(-0.1 * ...
%         std(handles.Aperture) / mean(handles.Aperture) ));
%     
%     weighting(1:handles.NumLags,3) = weighting(1:handles.NumLags,3) * ...
%         10 * (1 - exp(-0.1 * ...
%         std(handles.Aperture) / mean(handles.Aperture) ));
    
    handles.AvePlusConf(1:handles.NumLags,1:4) = ...
        handles.Ave(1:handles.NumLags,1:4) .* ...
        (1 + weighting(1:handles.NumLags,1:4) .* ...
        sqrt(handles.NumLags / handles.ApertureCount) * ...
        handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
    
    AveMinusConf(1:handles.NumLags,1:4) = ...
        handles.Ave(1:handles.NumLags,1:4) .* ...
        (1 - weighting(1:handles.NumLags,1:4) .* ...
        sqrt(handles.NumLags / handles.ApertureCount) * ...
        handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
    
%     handles.AvePlusConf(1:handles.NumLags,3) = ...
%         handles.Ave(1:handles.NumLags,3) * ...
%         (1 + 10 * (1 - exp(-0.1 * ...
%         std(handles.Aperture) / mean(handles.Aperture) * ...
%         sqrt(handles.NumLags / handles.ApertureCount))) * ...
%         handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
    
%      AveMinusConf(1:handles.NumLags,3) = ...
%         handles.Ave(1:handles.NumLags,3) * ...
%         (1 - 10 * (1 - exp(-0.1 * ...
%         std(handles.Aperture) / mean(handles.Aperture) * ...
%         sqrt(handles.NumLags / handles.ApertureCount))) * ...
%         handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
   
    % new code ends
    
    handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
    handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
        AveMinusConf(1:handles.NumLags,1:4);
    
    clear weighting;
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
    
end


% what the hell is this line about ??
handles.LengthScale = handles.LengthScale + handles.StartScan;


% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2;
	end
else
	if handles.Weighted == 1
		handles.Switch = 3;
	else
		handles.Switch = 4;
	end
end

plot(handles.PlotAxes, ...
	handles.LengthScale(1:1+2*handles.NumLags), ...
	handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
hold on;
plot(handles.PlotAxes, ...
	handles.LengthScale(1:handles.NumLags), ...
	handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
	'-b', 'LineWidth', 2);
plot(handles.PlotAxes, ...
	handles.LengthScale(1:handles.NumLags), ...
	handles.Ave(1:handles.NumLags,handles.Switch), ...
	'-g', 'LineWidth', 2);
hold off;
handles.PlotScaling = 4;
set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
else
	temp = ylim;
	handles.MinY = temp(1);
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = temp(2);
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);

	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

end

set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

% end

guidata(hObject,handles);


% --- Executes on button press in StaircaseButton.
function StaircaseButton_Callback(hObject, ~, handles)
% hObject    handle to StaircaseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of StaircaseButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

% note: windowing disabled
if handles.PlotType ~= 4
	
handles.PlotType = 4;

% calculate weighted and unweighted staircase 
% of observed features in each interval
handles.OutputNum = 2*handles.ApertureCount+2;

handles.Horizontal = zeros(handles.OutputNum,1);
% Staircase = zeros(handles.OutputNum,2);

[handles.Horizontal, Staircase] = StaircaseCalc( ...
	handles.Aperture, handles.Spacing, handles.ApertureCount, ...
	handles.InsertFeatures);

% calculate expected staircase
Expected = zeros(handles.OutputNum,2);
Slope(1) = Staircase(handles.OutputNum,1) / ...
	handles.Horizontal(handles.OutputNum);
Slope(2) = Staircase(handles.OutputNum,2) / ...
	handles.Horizontal(handles.OutputNum);
Expected(1:handles.OutputNum,1) = Slope(1) * handles.Horizontal;
Expected(1:handles.OutputNum,2) = Slope(2) * handles.Horizontal;

% normalize staircase
handles.Vertical = zeros(handles.OutputNum,4);
handles.Vertical(2:handles.OutputNum,1) = ...
	Staircase(2:handles.OutputNum,1) ./ Expected(2:handles.OutputNum,1);
handles.Vertical(2:handles.OutputNum,2) = ...
	Staircase(2:handles.OutputNum,2) ./ Expected(2:handles.OutputNum,2);
handles.Vertical(2:handles.OutputNum,3) = ...
	Staircase(2:handles.OutputNum,1);
handles.Vertical(2:handles.OutputNum,4) = ...
	Staircase(2:handles.OutputNum,2);
clear Staircase;

% window staircase
handles.WindowVertical = zeros(handles.OutputNum,4);
%if Windowing > 0
%	[handles.WindowVertical(1:handles.OutputNum,1)] = WindowCalc( ...
%		handles.Vertical(1:handles.OutputNum,1), ...
%		handles.OutputNum, handles.Windowing);
%	[handles.WindowVertical(1:handles.OutputNum,2)] = WindowCalc( ...
%		handles.Vertical(1:handles.OutputNum,2), ...
%		handles.OutputNum, handles.Windowing);
%	[handles.WindowVertical(1:handles.OutputNum,3)] = WindowCalc( ...
%		handles.Vertical(1:handles.OutputNum,3), ...
%		handles.OutputNum, handles.Windowing);
%	[handles.WindowVertical(1:handles.OutputNum,4)] = WindowCalc( ...
%		handles.Vertical(1:handles.OutputNum,4), ...
%		handles.OutputNum, handles.Windowing);
%else
	handles.WindowVertical = handles.Vertical;
%end

% calculate staircase of randomized features in each interval
if handles.RandomIterations > 0
	
	% determine domain intervals for analysis
	handles.LengthScale = zeros(handles.NumLags,1);
	Increment = (handles.EndScan - handles.StartScan) / (handles.NumLags-1);
%	handles.LengthScale(1) = handles.StartScan;
	for i = 2:1:(handles.NumLags)
		handles.LengthScale(i) = handles.LengthScale(i-1) + Increment;
	end
	
	% create arrays for randomized analysis
	handles.RandomVertical = zeros(handles.NumLags, ...
		handles.RandomIterations,4);
	handles.WindowRandomVertical = zeros(handles.NumLags, ...
		handles.RandomIterations,4);
	
	% create dialog box for reporting status
	StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');

	% note: windowing not implemented
	% analyze randomized features
	for i = 1:1:handles.RandomIterations
		
		% calculate weighted and unweighted random intensity
% 		RandomStaircase = zeros(handles.NumLags,2);
		[RandomStaircase] = IntensityCalc( ...
			handles.RandomScanlines(1:handles.SpacingCount,2*i), ...
			handles.RandomScanlines(1:handles.SpacingCount,2*i-1), ...
			handles.ApertureCount, handles.NumLags, ...
			handles.LengthScale, Increment, handles.InsertFeatures);
		
		% convert intensities to stairsteps
		RandomStaircase = RandomStaircase * Increment;
			
		% calculate randomized staircase
		for j = 2:1:handles.NumLags
			RandomStaircase(j,1) = RandomStaircase(j-1,1) ...
				+ RandomStaircase(j,1);
			RandomStaircase(j,2) = RandomStaircase(j-1,2) ...
				+ RandomStaircase(j,2);
		end
		
		% calculate expected staircase
		Expected = zeros(handles.NumLags,2);
		Expected(1:handles.NumLags,1) = Slope(1) * handles.LengthScale;
		Expected(1:handles.NumLags,2) = Slope(2) * handles.LengthScale;
		
		% normalize randomized staircase
		handles.RandomVertical(2:handles.NumLags,i,1) = ...
			RandomStaircase(2:handles.NumLags,1) ./ ...
			Expected(2:handles.NumLags,1);
		handles.RandomVertical(2:handles.NumLags,i,2) = ...
			RandomStaircase(2:handles.NumLags,2) ./ ...
			Expected(2:handles.NumLags,2);
		handles.RandomVertical(2:handles.NumLags,i,3) = ...
			RandomStaircase(2:handles.NumLags,1);
		handles.RandomVertical(2:handles.NumLags,i,4) = ...
			RandomStaircase(2:handles.NumLags,2);
		
		handles.RandomVertical(1,i,1:2) = handles.RandomVertical(2,i,1:2);
		
		% window randomized staircase
		handles.WindowRandomVertical(1:handles.NumLags,i,1:4) = ...
			handles.RandomVertical(1:handles.NumLags,i,1:4);
		
		% update status via dialog box
		waitbar(i/handles.RandomIterations, StatusBox, ...
			sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
			i, handles.RandomIterations),'FontSize', 14);
		
	end
	
	% delete dialog box for reporting status
	delete(StatusBox);
	
	clear RandomStaircase;
	clear Expected;
	clear Slope;
	
	% calculate averages and confidence limits of random intensity
	handles.Ave = zeros(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	
	for i = 1:1:4
		[handles.Ave(1:handles.NumLags,i), ...
			handles.AvePlusConf(1:handles.NumLags,i), ...
			AveMinusConf(1:handles.NumLags,i)] = ...
			RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
			1:handles.RandomIterations,i), ...
			handles.NumLags, handles.RandomIterations, handles.ZeeScore);
		handles.AvePlusConf(1+handles.NumLags,i) = NaN;
		handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
			AveMinusConf(1:handles.NumLags,i);
	end
	
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
%	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
%	handles.ConfRandomCv = handles.ZeeScore * ...
%		std(handles.RandomCv(1:handles.RandomIterations));
	
end

handles.LengthScale = handles.LengthScale + handles.StartScan;
handles.Horizontal = handles.Horizontal + handles.StartScan;

% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2;
	end
else
	if handles.Weighted == 1
		handles.Switch = 3;
	else
		handles.Switch = 4;
	end
end

plot(handles.PlotAxes, ...
	handles.LengthScale(1:1+2*handles.NumLags), ...
	handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
hold on;
plot(handles.PlotAxes, ...
	handles.Horizontal(1:handles.OutputNum), ...
	handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
	'-b', 'LineWidth', 2);
plot(handles.PlotAxes, ...
	handles.LengthScale(1:handles.NumLags), ...
	handles.Ave(1:handles.NumLags,handles.Switch), ...
	'-g', 'LineWidth', 2);
hold off;
handles.PlotScaling = 4;
set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
else
	temp = ylim;
	handles.MinY = temp(1);
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = temp(2);
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);

	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

end

set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

guidata(hObject,handles);


% --- Executes on button press in FourierButton.
function FourierButton_Callback(hObject, ~, handles)
% hObject    handle to SemivarioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SemivarioButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

% if handles.PlotType ~= 7
	
handles.PlotType = 7;

Precision = handles.ScanlineLength / handles.NumLags;

handles.MinLag = Precision;

handles.MaxLag = handles.ScanlineLength;


set(handles.MinLagEdit, 'String', [num2str(handles.MinLag) ' ']);
set(handles.MinLagEdit, 'Value', handles.MinLag);
%set(handles.MinLagEdit,'Enable','off');


set(handles.MaxLagEdit, 'String', [num2str(handles.MaxLag) ' ']);
set(handles.MaxLagEdit, 'Value', handles.MaxLag);
%set(handles.MaxLagEdit,'Enable','off');


%handles.Graduations = 2;
%set(handles.GraduationsPopup, 'Value', handles.Graduations);
%set(handles.GraduationsPopup,'Enable','off');


% calculate descriptive statistics
if handles.InsertFeatures == 1
    ScanlineLength = round((sum(handles.Spacing) + sum(handles.Aperture)) / Precision);
else
    ScanlineLength = round((sum(handles.Spacing) + 0) / Precision);
%    ScanlineLength = round((sum(handles.Spacing) + handles.ApertureCount) / Precision);
end
%simplify above with: ScanlineLength = handles.NumLags;

if var(handles.Aperture) == 0
    VarAperture = 1;
    Aperture = ones(handles.ApertureCount,1);
else
    VarAperture = var(handles.Aperture);
    Aperture = handles.Aperture;
end

% calculate Frequency and Wavelength for Fourier analysis
Frequency = 0:ScanlineLength;
Frequency = Frequency ./ ScanlineLength;

Frequency = Frequency.';
Wavelength = 1 ./ Frequency;

% correct independent variable for input precision
LengthScale = Wavelength .* Precision;

clear Frequency;
clear Wavelength;

handles.LengthScale = zeros(handles.NumLags,1);
handles.LengthScale(1:ScanlineLength,1) = LengthScale(2:(ScanlineLength+1));

clear LengthScale;

% transform input (weighted and indicator) into series with uniform sampling
Indicator = zeros(ScanlineLength+1,2);

for j = 1:handles.ApertureCount
    
    
    % 2017-01-06 15:00
    % ceil function below breaks down
    % in special case of both
    %   input that is perfectly periodic
    %   handles.InsertFeatures = 1
    
    
    Position = ceil((sum(handles.Spacing(1:j)) + ...
        handles.InsertFeatures * sum(Aperture(1:j))) / Precision);
    
    Indicator(Position,1) = Aperture(j) + Indicator(Position,1);
    
    Indicator(Position,2) = 1 + Indicator(Position,2);
end

clear Position;
clear Aperture;

% calculate power-spectral density of input series 
% (j=1 weighted, and j=2 indicator)
% using fft-based estimate of PSD
handles.Vertical = zeros(ScanlineLength,4); %2016-09-11

for j = 1:2
    
    FastFT = fft(Indicator(1:ScanlineLength,j), ScanlineLength + 1);
%    FastFT = fft(Indicator(1:ScanlineLength,j), 2 * ScanlineLength);

    %rewrite this:
%     temp(1:(ScanlineLength)) = FastFT(1:(ScanlineLength));
% %    temp(1:(ScanlineLength+1)) = FastFT(1:(ScanlineLength+1));
%     clear FastFT;
%     FastFT = temp.';
%     clear temp;

    % calculate PSD from fft
    Power = FastFT .* conj(FastFT) .* (2 / ScanlineLength^2); %2016-11-30
%    Power = FastFT .* conj(FastFT) ./ (pi * ScanlineLength);
    
%    Power(1) = Power(1) / 2;
%     Power(2) = Power(2);
%    Power(ScanlineLength) = Power(ScanlineLength) / 2;
%     Power(ScanlineLength+1) = Power(ScanlineLength+1);

    % normalized PSD, assuming that feature locations are random
    NormPSD = FastFT .* conj(FastFT) ./ handles.ApertureCount;

    if j == 1
        NormPSD = NormPSD ./ VarAperture;
    end

%    NormPSD(1) = NormPSD(1) / 2;
%     NormPSD(2) = NormPSD(2);
%    NormPSD(ScanlineLength) = NormPSD(ScanlineLength) / 2;
%     NormPSD(ScanlineLength+1) = NormPSD(ScanlineLength+1);
    
    %record both normalized and not
%    handles.Vertical(1:ScanlineLength+1,j) = NormPSD; %2016-09-11
%    handles.Vertical(1:ScanlineLength+1,j+2) = Power; %2016-09-11
    handles.Vertical(1:ScanlineLength,j) = NormPSD(2:(ScanlineLength + 1));
    handles.Vertical(1:ScanlineLength,j+2) = Power(2:(ScanlineLength + 1));
%     handles.Vertical(1:ScanlineLength-1,j) = NormPSD(3:ScanlineLength+1);
%     handles.Vertical(ScanlineLength,j) = handles.Vertical(ScanlineLength-1,j);
%     handles.Vertical(1:ScanlineLength-1,j+2) = Power(3:ScanlineLength+1);
%     handles.Vertical(ScanlineLength,j+2) = handles.Vertical(ScanlineLength-1,j+2);
    
end

clear Indicator;
clear FastFT;
clear Power;
clear NormPSD;


% handles.LengthScale(1:ScanlineLength,1) = LengthScale(2:(ScanlineLength+1)) ./ 2;
% handles.LengthScale(1:ScanlineLength-1) = LengthScale(3:ScanlineLength+1);
% handles.LengthScale(ScanlineLength) = LengthScale(ScanlineLength+1) / 1; %2016-09-17

%clear LengthScale;

%LengthScale = zeros(1:(ScanlineLength-1),1);
%LengthScale = handles.LengthScale;

%clear LengthScale;


%Caution Danger! with NumLags beyond scope of FourierButton:


% convert index
%handles.tempNumLags = handles.NumLags;
%handles.NumLags = ScanlineLength + 1; %2016-09-11
%handles.NumLags = ScanlineLength - 1;

%2016-09-12
handles.OutputNum = handles.NumLags; %2016-09-12
handles.Horizontal(1:handles.OutputNum) = handles.LengthScale(1:ScanlineLength);


%note artifact below, at short LengthScale, when Precision >> ideal


% window power spectral density
handles.WindowVertical = zeros(handles.NumLags,4);
if handles.Windowing > 0
	[handles.WindowVertical(1:handles.NumLags,1)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,1), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,2)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,2), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,3)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,3), ...
		handles.NumLags, handles.Windowing);
	[handles.WindowVertical(1:handles.NumLags,4)] = WindowCalc( ...
		handles.Vertical(1:handles.NumLags,4), ...
		handles.NumLags, handles.Windowing);
else
	handles.WindowVertical = handles.Vertical;
end



% calculate power spectral density of randomized features
% if handles.RandomIterations > 0
if handles.MonteCarlo == 1
	
	% create arrays for randomized analysis
    handles.RandomVertical = zeros(handles.NumLags, ...
        handles.RandomIterations,4);
    handles.WindowRandomVertical = zeros(handles.NumLags, ...
        handles.RandomIterations,4);
	
% 	handles.RandomVertical = zeros(handles.NumLags - 1, ...
% 		handles.RandomIterations,4);
% 	handles.WindowRandomVertical = zeros(handles.NumLags - 1, ...
% 		handles.RandomIterations,4);
	
	% create dialog box for reporting status
	StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');
	
	% analyze randomized features
	for k = 1:1:handles.RandomIterations
		
        
        
        if VarAperture == 1;
            Aperture = ones(handles.ApertureCount,1);
        else
            Aperture = handles.RandomScanlines(1:handles.ApertureCount,2*k);
        end
        
        
        
        % transform input into weighted and unweighted series with uniform sampling
        Indicator = zeros(ScanlineLength+1,2);
        
        for j = 1:handles.ApertureCount

            Position = ceil((sum(handles.RandomScanlines(1:j,2*k-1)) + ...
                handles.InsertFeatures * sum(Aperture(1:j))) / Precision);

            Indicator(Position,1) = Aperture(j) + Indicator(Position,1);

            Indicator(Position,2) = 1 + Indicator(Position,2);
        end
        
        clear Position;
        clear Aperture;

        % calculate power-spectral density of input series 
        % (j=1 weighted, and j=2 indicator)
        % using fft-based estimate of PSD

        for j = 1:2

            FastFT = fft(Indicator(1:ScanlineLength,j), ScanlineLength + 1);
%             FastFT = fft(Indicator(1:ScanlineLength,j), 2 * ScanlineLength);

            %rewrite this:
%             temp(1:(ScanlineLength+1)) = FastFT(1:(ScanlineLength+1));
%             clear FastFT;
%             FastFT = temp.';
%             clear temp;

            % calculate PSD from fft
            Power = FastFT .* conj(FastFT) .* (2 / ScanlineLength^2); %2016-11-30
%            Power = FastFT .* conj(FastFT) ./ (pi * ScanlineLength);

%            Power(1) = Power(1) / 2;
%             Power(2) = Power(2);
%            Power(ScanlineLength) = Power(ScanlineLength) / 2;
%             Power(ScanlineLength+1) = Power(ScanlineLength+1);

            % calculate normalized PSD, assuming that feature locations are random
            NormPSD = FastFT .* conj(FastFT) ./ handles.ApertureCount;

            if j == 1
                NormPSD = NormPSD ./ VarAperture;
            end

%            NormPSD(1) = NormPSD(1) / 2;
%             NormPSD(2) = NormPSD(2);
%            NormPSD(ScanlineLength) = NormPSD(ScanlineLength) / 2;
%              NormPSD(ScanlineLength+1) = NormPSD(ScanlineLength+1);

           %record both normalized and not
            handles.RandomVertical(1:ScanlineLength,k,j) = NormPSD(2:(ScanlineLength + 1));
            handles.RandomVertical(1:ScanlineLength,k,j+2) = Power(2:(ScanlineLength + 1));
%             handles.RandomVertical(1:ScanlineLength-1,k,j) = NormPSD(3:ScanlineLength+1);
%             handles.RandomVertical(ScanlineLength,k,j) = handles.RandomVertical(ScanlineLength-1,k,j);
%             handles.RandomVertical(1:ScanlineLength-1,k,j+2) = Power(3:ScanlineLength+1);
%             handles.RandomVertical(ScanlineLength,k,j+2) = handles.RandomVertical(ScanlineLength-1,k,j+2);

        end

        clear Indicator;
        clear FastFT;
        clear Power;
        clear NormPSD;
        
        
        
		% window random intensity
		if handles.Windowing > 0
			[handles.WindowRandomVertical(1:handles.NumLags,k,1)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,k,1), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,k,2)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,k,2), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,k,3)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,k,3), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,k,4)] = ...
				WindowCalc(handles.RandomVertical(1:handles.NumLags,k,4), ...
				handles.NumLags, handles.Windowing);
		else
			handles.WindowRandomVertical = handles.RandomVertical;
		end
		
		% update status via dialog box
		waitbar(k/handles.RandomIterations, StatusBox, ...
			sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
			k, handles.RandomIterations),'FontSize', 14);
		
	end
	
	% delete dialog box for reporting status
	delete(StatusBox);
	
    %edits on following 40 lines might be applicable to other analyses
    
%	clear RandomIntensity;
%	clear MeanIntensity;
	
	% calculate averages and confidence limits of randomized features
	handles.Ave = zeros(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	
% 	handles.Ave = zeros(handles.NumLags - 1,4);
% 	handles.AvePlusConf = zeros(handles.NumLags - 1,4);
% 	AveMinusConf = zeros(handles.NumLags - 1,4);
	
	for j = 1:1:4
		[handles.Ave(1:handles.NumLags,j), ...
			handles.AvePlusConf(1:handles.NumLags,j), ...
			AveMinusConf(1:handles.NumLags,j)] = ...
			RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
			1:handles.RandomIterations,j), ...
			handles.NumLags, handles.RandomIterations, handles.ZeeScore);
% 		handles.AvePlusConf((1+handles.NumLags),j) = NaN;
% 		handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),j) = ...
% 			AveMinusConf(1:handles.NumLags,j);
	end
	
    handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
    handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
        AveMinusConf(1:handles.NumLags,1:4);
    
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
%	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
%	handles.ConfRandomCv = handles.ZeeScore * ...
%		std(handles.RandomCv(1:handles.RandomIterations));
	
elseif handles.Analytical == 1
    
	% create arrays for randomized analysis
%     handles.RandomVertical = zeros(handles.NumLags, ...
%         handles.RandomIterations,4);
%     handles.WindowRandomVertical = zeros(handles.NumLags, ...
%         handles.RandomIterations,4);
	
    % note: windowing is meaningless for randoms in this case, so skip it below
    % reconsider, because conf is affected by windowing
    
    
% 	handles.Ave = zeros(handles.NumLags,4);
	handles.Ave = ones(handles.NumLags,4);
	handles.Ave(1:handles.NumLags,3) = ...
        VarAperture * handles.ApertureCount * (2 / ScanlineLength^2); %2016-11-30
%        VarAperture * handles.ApertureCount / (pi * ScanlineLength);
	handles.Ave(1:handles.NumLags,4) = ...
        handles.ApertureCount * (2 / ScanlineLength^2); %2016-11-30
%        handles.ApertureCount / (pi * ScanlineLength);
    
	handles.AvePlusConf = zeros(handles.NumLags,4);
%  	Conf = handles.ZeeScore * handles.Ave(1:handles.NumLags,1:4);
    
    handles.AvePlusConf(1:handles.NumLags,1:4) = ...
        handles.Ave(1:handles.NumLags,1:4) * ...
        (1 + handles.ZeeScore / sqrt(2 * handles.Windowing + 1));

    AveMinusConf(1:handles.NumLags,1:4) = ...
        handles.Ave(1:handles.NumLags,1:4) * ...
        (1 - handles.ZeeScore / sqrt(2 * handles.Windowing + 1));
    
    handles.AvePlusConf((1+handles.NumLags),1:4) = NaN;
    handles.AvePlusConf((2+handles.NumLags):(1+2*handles.NumLags),1:4) = ...
        AveMinusConf(1:handles.NumLags,1:4);
    
    clear Aperture;
    clear Conf;
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
end



% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2; %2016-09-12-21:01
	end
else
	if handles.Weighted == 1
		handles.Switch = 3; %2016-09-12-21:01
	else
		handles.Switch = 4;
	end
end

loglog(handles.PlotAxes, ...
    handles.LengthScale(1:1+2*handles.NumLags), ...
    handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
hold on;
loglog(handles.PlotAxes, ...
    handles.LengthScale(1:handles.NumLags), ...
    handles.WindowVertical(1:handles.NumLags,handles.Switch), ...
    '-b', 'LineWidth', 2);
loglog(handles.PlotAxes, ...
    handles.LengthScale(1:handles.NumLags), ...
    handles.Ave(1:handles.NumLags,handles.Switch), ...
    '-g', 'LineWidth', 2);
hold off;
handles.PlotScaling = 1;
set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
else
	junk = sort(unique( ...
        handles.WindowVertical(1:handles.NumLags,handles.Switch)));
    if junk(1) == 0
        handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
    else
        handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
    end
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
    clear junk;
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    
	ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

%set(handles.GraduationsPopup,'Enable','on');






set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

% end

guidata(hObject,handles);


% --- Executes on button press in WaveletButton.
function WaveletButton_Callback(hObject, ~, handles)
% hObject    handle to WaveletButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

if handles.PlotType ~= 8
	
handles.PlotType = 8;






set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

end

guidata(hObject,handles);


% --- Executes on button press in DiscSpacingButton.
function DiscSpacingButton_Callback(hObject, ~, handles)
% hObject    handle to DiscSpacingButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DiscSpacingButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to (re)calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else
	
if handles.PlotType ~= 5
	
handles.PlotType = 5;

% calculate weightings for nearest-neighbor features
NeighborSep = zeros(handles.ApertureCount-1,2);
for i = 1:1:(handles.ApertureCount-1)
	NeighborSep(i,1) = handles.Spacing(i+1);
	NeighborSep(i,2) = handles.Aperture(i) * handles.Aperture(i+1);
end

% sort spacings in descending order
Weights = NeighborSep(1:(handles.ApertureCount-1),2);
[NeighborSep(1:(handles.ApertureCount-1),1), Index] = ...
	sort(NeighborSep(1:(handles.ApertureCount-1),1),1, 'descend');
for i = 1:1:(handles.ApertureCount-1)
	NeighborSep(i,2) = Weights(Index(i));
end
clear Weights;
clear Index;

% calculate discrete size distribution, weighted and unweighted
InputArray = ones(handles.ApertureCount-1,3);
InputArray(1:(handles.ApertureCount-1),1:2) = NeighborSep;
InputCount = handles.ApertureCount - 1;

counter = 0;

for i = 1:1:(InputCount-1)
	while InputArray(i,1) == InputArray(i+1,1) && InputArray(i,1) > 0
		counter = counter + 1;
		InputArray(i,2) = InputArray(i,2) + InputArray(i+1,2);
		InputArray(i,3) = InputArray(i,3) + InputArray(i+1,3);
		InputArray((i+1):(InputCount-1),1:3) = ...
			InputArray((i+2):InputCount,1:3);
		InputArray(InputCount,1:3) = 0;
	end
end

% put results back into (redimensioned) array
handles.OutputNum = InputCount - counter;
handles.Horizontal = zeros(handles.OutputNum,1);
handles.Horizontal(1:handles.OutputNum) = ...
	InputArray(1:handles.OutputNum,1);
NeighborSep = zeros(handles.OutputNum,2);
NeighborSep(1:handles.OutputNum,1:2) = InputArray(1:handles.OutputNum,2:3);
clear InputArray;

% calculate derivative of discrete distribution of observed spacings
handles.Vertical = zeros(handles.OutputNum,4);
handles.Vertical(1,3) = NeighborSep(1,1) / ...
	(handles.ScanlineLength - handles.Horizontal(1));
handles.Vertical(1,4) = NeighborSep(1,2) / ...
	(handles.ScanlineLength - handles.Horizontal(1));
for i = 2:1:handles.OutputNum
	handles.Vertical(i,3) = NeighborSep(i,1) / ...
		(handles.Horizontal(i-1) - handles.Horizontal(i));
	handles.Vertical(i,4) = NeighborSep(i,2) / ...
		(handles.Horizontal(i-1) - handles.Horizontal(i));
end
clear NeighborSep;

% normalize discrete spacing distribution
ExpectedCum = (handles.SumAperture^2 - handles.SumSqAp) / ...
	(InputCount-1) * ...
	(exp(-handles.Horizontal(1) * InputCount ...
	/ handles.ScanlineLength) - ...
	exp(-handles.ScanlineLength * InputCount ...
	/ handles.ScanlineLength)) ...
	/ (handles.ScanlineLength - handles.Horizontal(1));
handles.Vertical(1,1) = handles.Vertical(1,3) ...
	/ ExpectedCum;
for i = 2:1:handles.OutputNum
	ExpectedCum = (handles.SumAperture^2 - handles.SumSqAp) / ...
		(InputCount-1) * ...
		(exp(-handles.Horizontal(i) * InputCount ...
		/ handles.ScanlineLength) - ...
		exp(-handles.Horizontal(i-1) * InputCount ...
		/ handles.ScanlineLength)) ...
		/ (handles.Horizontal(i-1) - handles.Horizontal(i));
	handles.Vertical(i,1) = handles.Vertical(i,3) ...
		/ ExpectedCum;
end

ExpectedCum = InputCount * ...
	(exp(-handles.Horizontal(1) * InputCount ...
	/ handles.ScanlineLength) - ...
	exp(-handles.ScanlineLength * InputCount ...
	/ handles.ScanlineLength)) ...
	/ (handles.ScanlineLength - handles.Horizontal(1));
handles.Vertical(1,2) = handles.Vertical(1,4) ...
	/ ExpectedCum;
for i = 2:1:handles.OutputNum
	ExpectedCum = InputCount * ...
		(exp(-handles.Horizontal(i) * InputCount ...
		/ handles.ScanlineLength) - ...
		exp(-handles.Horizontal(i-1) * InputCount ...
		/ handles.ScanlineLength)) ...
		/ (handles.Horizontal(i-1) - handles.Horizontal(i));
	handles.Vertical(i,2) = handles.Vertical(i,4) ...
		/ ExpectedCum;
end

% window discrete spacing distribution
handles.WindowVertical = zeros(handles.OutputNum,4);
if handles.Windowing > 0
	[handles.WindowVertical(1:handles.OutputNum,1)] = WindowCalc( ...
		handles.Vertical(1:handles.OutputNum,1), ...
		handles.OutputNum, handles.Windowing);
	[handles.WindowVertical(1:handles.OutputNum,2)] = WindowCalc( ...
		handles.Vertical(1:handles.OutputNum,2), ...
		handles.OutputNum, handles.Windowing);
	[handles.WindowVertical(1:handles.OutputNum,3)] = WindowCalc( ...
		handles.Vertical(1:handles.OutputNum,3), ...
		handles.OutputNum, handles.Windowing);
	[handles.WindowVertical(1:handles.OutputNum,4)] = WindowCalc( ...
		handles.Vertical(1:handles.OutputNum,4), ...
		handles.OutputNum, handles.Windowing);
else
	handles.WindowVertical = handles.Vertical;
end

% discrete spacing distribution of randomized features
if handles.RandomIterations > 0

	handles.LengthScale = zeros(handles.NumLags,1);
	
	% determine spacing values for analysis
	handles.LengthScale(1) = handles.Horizontal(1);
	if handles.Graduations == 1
		Increment = 10^(log10(handles.Horizontal(1)/ ...
			handles.Horizontal(handles.OutputNum))/(handles.NumLags-1));
		for i = 2:1:(handles.NumLags)
			handles.LengthScale(i) = handles.LengthScale(i-1) / Increment;
		end
	else
		Increment = (handles.Horizontal(1) - ...
			handles.Horizontal(handles.OutputNum)) / (handles.NumLags-1);
		for i = 2:1:(handles.NumLags)
			handles.LengthScale(i) = handles.LengthScale(i-1) - Increment;
		end
	end
	
	handles.RandomVertical = ...
		zeros(handles.NumLags,handles.RandomIterations,4);
	handles.WindowRandomVertical = ...
		zeros(handles.NumLags,handles.RandomIterations,4);
	
	% create dialog box for reporting status
	StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');
	
	% analyze discrete spacing distribution of randomized features
	for i = 1:1:handles.RandomIterations
		
		% calculate weightings for nearest-neighbor randomized features
		RandNeighborSep = zeros(InputCount,2);
		for j = 1:1:InputCount
			RandNeighborSep(j,1) = handles.RandomScanlines(j+1,2*i-1);
			RandNeighborSep(j,2) = handles.RandomScanlines(j,2*i) ...
				* handles.RandomScanlines(j+1,2*i);
		end
		
		% calculate cumulative spacing distribution of randomized features
		CumRandomSpacingSize = zeros(handles.NumLags,2);
		for j = 1:1:handles.NumLags
			for k = 1:1:InputCount
				if RandNeighborSep(k,1) > handles.LengthScale(j)
					CumRandomSpacingSize(j,1) = ...
						CumRandomSpacingSize(j,1) + ...
						RandNeighborSep(k,2);
					CumRandomSpacingSize(j,2) = ...
						CumRandomSpacingSize(j,2) + 1;
				end
			end
		end
		
		% calculate derivative of cumulative distribution 
		% of randomized features
		handles.RandomVertical(1,i,3) = ...
				CumRandomSpacingSize(1,1) ...
				/ (handles.ScanlineLength - handles.LengthScale(1));
		for j = 2:1:handles.NumLags
			handles.RandomVertical(j,i,3) = ...
				(CumRandomSpacingSize(j,1) - ...
				CumRandomSpacingSize(j-1,1)) ...
				/ (handles.LengthScale(j-1) - handles.LengthScale(j));
		end
		
		handles.RandomVertical(1,i,4) = ...
				CumRandomSpacingSize(1,2) ...
				/ (handles.ScanlineLength - handles.LengthScale(1));
		for j = 2:1:handles.NumLags
			handles.RandomVertical(j,i,4) = ...
				(CumRandomSpacingSize(j,2) - ...
				CumRandomSpacingSize(j-1,2)) ...
				/ (handles.LengthScale(j-1) - handles.LengthScale(j));
		end
		
		% normalize discrete spacing distribution of randomized features
		ExpectedCum = (handles.SumAperture^2 - ...
			handles.SumSqAp) / (InputCount-1) * ...
			(exp(-handles.LengthScale(1) * InputCount ...
			/ handles.ScanlineLength) - ...
			exp(-handles.ScanlineLength * InputCount ...
			/ handles.ScanlineLength)) ...
			/ (handles.ScanlineLength - handles.LengthScale(1));
		handles.RandomVertical(1,i,1) = ...
			handles.RandomVertical(1,i,3) / ExpectedCum;
		for j = 2:1:handles.NumLags
			ExpectedCum = (handles.SumAperture^2 - ...
				handles.SumSqAp) / (InputCount-1) * ...
				(exp(-handles.LengthScale(j) * InputCount ...
				/ handles.ScanlineLength) - ...
				exp(-handles.LengthScale(j-1) * InputCount ...
				/ handles.ScanlineLength)) ...
				/ (handles.LengthScale(j-1) - handles.LengthScale(j));
			handles.RandomVertical(j,i,1) = ...
				handles.RandomVertical(j,i,3) / ExpectedCum;
		end
		
		ExpectedCum = InputCount * ...
			(exp(-handles.LengthScale(1) * InputCount ...
			/ handles.ScanlineLength) - ...
			exp(-handles.ScanlineLength * InputCount ...
			/ handles.ScanlineLength)) ...
			/ (handles.ScanlineLength - handles.LengthScale(1));
		handles.RandomVertical(1,i,2) = ...
			handles.RandomVertical(1,i,4) / ExpectedCum;
		for j = 2:1:handles.NumLags
			ExpectedCum = InputCount * ...
				(exp(-handles.LengthScale(j) * InputCount ...
				/ handles.ScanlineLength) - ...
				exp(-handles.LengthScale(j-1) * InputCount ...
				/ handles.ScanlineLength)) ...
				/ (handles.LengthScale(j-1) - handles.LengthScale(j));
			handles.RandomVertical(j,i,2) = ...
				handles.RandomVertical(j,i,4) / ExpectedCum;
		end
		
		% window discrete spacing distribution of randomized features
		if handles.Windowing > 0
			[handles.WindowRandomVertical(1:handles.NumLags,i,1)] ...
				= WindowCalc(handles.RandomVertical(1:handles.NumLags,i,1), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,2)] ...
				= WindowCalc(handles.RandomVertical(1:handles.NumLags,i,2), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,3)] ...
				= WindowCalc(handles.RandomVertical(1:handles.NumLags,i,3), ...
				handles.NumLags, handles.Windowing);
			[handles.WindowRandomVertical(1:handles.NumLags,i,4)] ...
				= WindowCalc(handles.RandomVertical(1:handles.NumLags,i,4), ...
				handles.NumLags, handles.Windowing);
		else
			handles.WindowRandomVertical = handles.RandomVertical;
		end
		
		% update status via dialog box
		waitbar(i/handles.RandomIterations, StatusBox, ...
			sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
			i, handles.RandomIterations),'FontSize', 14);
		
	end
	
	% delete dialog box for reporting status
	delete(StatusBox);
	
	clear RandNeighborSep;
	clear CumRandomSpacingSize;
	
	% calculate averages and confidence limits of random spacings
	handles.Ave = zeros(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	
	for i = 1:1:4
		[handles.Ave(1:handles.NumLags,i), ...
			handles.AvePlusConf(1:handles.NumLags,i), ...
			AveMinusConf(1:handles.NumLags,i)] = ...
			RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
			1:handles.RandomIterations,i), ...
			handles.NumLags, handles.RandomIterations, handles.ZeeScore);
		handles.AvePlusConf(1+handles.NumLags,i) = NaN;
		handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
			AveMinusConf(1:handles.NumLags,i);
	end
	
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
%	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
%	handles.ConfRandomCv = handles.ZeeScore * ...
%		std(handles.RandomCv(1:handles.RandomIterations));
	
end

% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2;
	end
else
	if handles.Weighted == 1
		handles.Switch = 3;
	else
		handles.Switch = 4;
	end
end

semilogy(handles.PlotAxes, ...
	handles.LengthScale(1:1+2*handles.NumLags), ...
	handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
hold on;
semilogy(handles.PlotAxes, ...
	handles.Horizontal(1:handles.OutputNum), ...
	handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
	'-b', 'LineWidth', 2);
semilogy(handles.PlotAxes, ...
	handles.LengthScale(1:handles.NumLags), ...
	handles.Ave(1:handles.NumLags,handles.Switch), ...
	'-g', 'LineWidth', 2);
hold off;
handles.PlotScaling = 2;
set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
else
	junk = sort(unique( ...
        handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
    if junk(1) == 0
        handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
    else
        handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
    end
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
    clear junk;
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    
	ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

end

set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

guidata(hObject,handles);


% --- Executes on button press in CumSpacingButton.
function CumSpacingButton_Callback(hObject, ~, handles)
% hObject    handle to CumSpacingButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CumSpacingButton

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

if handles.PlotType ~= 6
	
handles.PlotType = 6;

% note: windowing not implemented

% calculate weightings for nearest-neighbor features
NeighborSep = zeros(handles.ApertureCount-1,2);
for i = 1:1:(handles.ApertureCount-1)
	NeighborSep(i,1) = handles.Spacing(i+1);
	NeighborSep(i,2) = handles.Aperture(i) * handles.Aperture(i+1);
end

% sort spacings in descending order
Weights = NeighborSep(1:(handles.ApertureCount-1),2);
[NeighborSep(1:(handles.ApertureCount-1),1), Index] = ...
	sort(NeighborSep(1:(handles.ApertureCount-1),1),1, 'descend');
for i = 1:1:(handles.ApertureCount-1)
	NeighborSep(i,2) = Weights(Index(i));
end
clear Weights;
clear Index;

% calculate discrete size distribution, weighted and unweighted
InputArray = ones(handles.ApertureCount-1,3);
InputArray(1:(handles.ApertureCount-1),1:2) = NeighborSep;
InputCount = handles.ApertureCount - 1;
clear NeighborSep;

counter = 0;

for i = 1:1:(InputCount-1)
	while InputArray(i,1) == InputArray(i+1,1) && InputArray(i,1) > 0
		counter = counter + 1;
		InputArray(i,2) = InputArray(i,2) + InputArray(i+1,2);
		InputArray(i,3) = InputArray(i,3) + InputArray(i+1,3);
		InputArray((i+1):(InputCount-1),1:3) = ...
			InputArray((i+2):InputCount,1:3);
		InputArray(InputCount,1:3) = 0;
	end
end

% put results back into (redimensioned) array
handles.OutputNum = InputCount - counter;
handles.Horizontal = zeros(handles.OutputNum,1);
handles.Horizontal(1:handles.OutputNum) = ...
	InputArray(1:handles.OutputNum,1);
handles.WindowVertical = zeros(handles.OutputNum,4);
handles.Vertical = zeros(handles.OutputNum,4);
handles.Vertical(1:handles.OutputNum,3:4) = ...
	InputArray(1:handles.OutputNum,2:3);
clear InputArray;

% calculate cumulative distribution of spacing sizes
for i = 2:1:handles.OutputNum
	handles.Vertical(i,3) = ...
		handles.Vertical(i,3) + handles.Vertical(i-1,3);
	handles.Vertical(i,4) = ...
		handles.Vertical(i,4) + handles.Vertical(i-1,4);
end

% normalize cumulative distribution of spacing sizes
for i = 1:1:handles.OutputNum
	ExpectedCum = (handles.SumAperture^2 - handles.SumSqAp) / ...
		(InputCount-1) * ...
		exp(-handles.Horizontal(i) * InputCount ...
		/ handles.ScanlineLength);
	handles.Vertical(i,1) = handles.Vertical(i,3) / ExpectedCum;
end

for i = 1:1:handles.OutputNum
	ExpectedCum = InputCount * ...
		exp(-handles.Horizontal(i) * InputCount ...
		/ handles.ScanlineLength);
	handles.Vertical(i,2) = handles.Vertical(i,4) / ExpectedCum;
end

handles.WindowVertical = handles.Vertical;

% cumulative spacing distribution of randomized features
if handles.RandomIterations > 0

	handles.LengthScale = zeros(handles.NumLags,1);
	
	% determine spacing values for analysis
	handles.LengthScale(1) = handles.Horizontal(1);
	if handles.Graduations == 1
		Increment = 10^(log10(handles.Horizontal(1)/ ...
			handles.Horizontal(handles.OutputNum))/(handles.NumLags-1));
		for i = 2:1:(handles.NumLags)
			handles.LengthScale(i) = handles.LengthScale(i-1) / Increment;
		end
	else
		Increment = (handles.Horizontal(1) - ...
			handles.Horizontal(handles.OutputNum)) / (handles.NumLags-1);
		for i = 2:1:(handles.NumLags)
			handles.LengthScale(i) = handles.LengthScale(i-1) - Increment;
		end
	end
	
	handles.RandomVertical = ...
		zeros(handles.NumLags,handles.RandomIterations,4);
	handles.WindowRandomVertical = ...
		zeros(handles.NumLags,handles.RandomIterations,4);
	
	% create dialog box for reporting status
	StatusBox = waitbar(0, ' ', 'Name', 'Status of Randomizations');
	
	% analyze cumulative spacing distribution of randomized features
	for i = 1:1:handles.RandomIterations
		
		% calculate weightings for nearest-neighbor randomized features
		RandNeighborSep = zeros(InputCount,2);
		for j = 1:1:InputCount
			RandNeighborSep(j,1) = handles.RandomScanlines(j+1,2*i-1);
			RandNeighborSep(j,2) = handles.RandomScanlines(j,2*i) ...
				* handles.RandomScanlines(j+1,2*i);
		end
		
		% calculate cumulative spacing distribution of randomized features
		for j = 1:1:handles.NumLags
			for k = 1:1:InputCount
				if RandNeighborSep(k,1) > handles.LengthScale(j)
					handles.RandomVertical(j,i,3) = ...
						handles.RandomVertical(j,i,3) + ...
						RandNeighborSep(k,2);
					handles.RandomVertical(j,i,4) = ...
						handles.RandomVertical(j,i,4) + 1;
				end
			end
		end
		
		% normalize cumulative spacing distribution of randomized features
		for j = 1:1:handles.NumLags
			ExpectedCum = (handles.SumAperture^2 - ...
				handles.SumSqAp) / (InputCount-1) * ...
				exp(-handles.LengthScale(j) * InputCount ...
				/ handles.ScanlineLength);
			handles.RandomVertical(j,i,1) = ...
				handles.RandomVertical(j,i,3) / ExpectedCum;
		end
		
		for j = 1:1:handles.NumLags
			ExpectedCum = InputCount * ...
				exp(-handles.LengthScale(j) * InputCount ...
				/ handles.ScanlineLength);
			handles.RandomVertical(j,i,2) = ...
				handles.RandomVertical(j,i,4) / ExpectedCum;
		end
		
		handles.WindowRandomVertical = handles.RandomVertical;
		
		% update status via dialog box
		waitbar(i/handles.RandomIterations, StatusBox, ...
			sprintf('Randomizations analyzed = %6.0f out of %6.0f', ...
			i, handles.RandomIterations),'FontSize', 14);
		
	end
	
	% delete dialog box for reporting status
	delete(StatusBox);
	
	clear RandNeighborSep;
	
	% calculate averages and confidence limits of random spacings
	handles.Ave = zeros(handles.NumLags,4);
	handles.AvePlusConf = zeros(handles.NumLags,4);
	AveMinusConf = zeros(handles.NumLags,4);
	
	for i = 1:1:4
		[handles.Ave(1:handles.NumLags,i), ...
			handles.AvePlusConf(1:handles.NumLags,i), ...
			AveMinusConf(1:handles.NumLags,i)] = ...
			RandStats(handles.WindowRandomVertical(1:handles.NumLags,...
			1:handles.RandomIterations,i), ...
			handles.NumLags, handles.RandomIterations, handles.ZeeScore);
		handles.AvePlusConf(1+handles.NumLags,i) = NaN;
		handles.AvePlusConf(2+handles.NumLags:1+2*handles.NumLags,i) = ...
			AveMinusConf(1:handles.NumLags,i);
	end
	
	clear AveMinusConf;
	
	handles.LengthScale(1+handles.NumLags) = NaN;
	handles.LengthScale(2+handles.NumLags:1+2*handles.NumLags) = ...
		handles.LengthScale(1:handles.NumLags);
	
%	handles.AveRandomCv = mean(handles.RandomCv(1:handles.RandomIterations));
%	handles.ConfRandomCv = handles.ZeeScore * ...
%		std(handles.RandomCv(1:handles.RandomIterations));
	
end

% graph results
if handles.Normalized == 1
	if handles.Weighted == 1
		handles.Switch = 1;
	else
		handles.Switch = 2;
	end
else
	if handles.Weighted == 1
		handles.Switch = 3;
	else
		handles.Switch = 4;
	end
end

semilogy(handles.PlotAxes, ...
	handles.LengthScale(1:1+2*handles.NumLags), ...
	handles.AvePlusConf(1:1+2*handles.NumLags,handles.Switch), '-k');
hold on;
semilogy(handles.PlotAxes, ...
	handles.Horizontal(1:handles.OutputNum), ...
	handles.WindowVertical(1:handles.OutputNum,handles.Switch), ...
	'-b', 'LineWidth', 2);
semilogy(handles.PlotAxes, ...
	handles.LengthScale(1:handles.NumLags), ...
	handles.Ave(1:handles.NumLags,handles.Switch), ...
	'-g', 'LineWidth', 2);
hold off;
handles.PlotScaling = 2;
set(handles.PlotScalingPopup, 'Value', handles.PlotScaling);

if handles.UserAxes == 1
	ylim([handles.MinY handles.MaxY]);
	xlim([handles.MinX handles.MaxX]);
else
	junk = sort(unique( ...
        handles.WindowVertical(1:handles.OutputNum,handles.Switch)));
    if junk(1) == 0
        handles.MinY = 10^floor(log10(junk(2))); % 2016 Sep 27
    else
        handles.MinY = 10^floor(log10(junk(1))); % 2016 Sep 28
    end
	set(handles.MinYEdit, 'String', [num2str(handles.MinY) ' ']);
	set(handles.MinYEdit, 'Value', handles.MinY);
	handles.MaxY = 10^ceil(log10(max(junk))); % 2016 Sep 28
    clear junk;
	set(handles.MaxYEdit, 'String', [num2str(handles.MaxY) ' ']);
	set(handles.MaxYEdit, 'Value', handles.MaxY);
    
	ylim([handles.MinY handles.MaxY]); % 2016 Sep 27
    
	temp = xlim;
	handles.MinX = temp(1);
	set(handles.MinXEdit, 'String', [num2str(handles.MinX) ' ']);
	set(handles.MinXEdit, 'Value', handles.MinX);
	handles.MaxX = temp(2);
	set(handles.MaxXEdit, 'String', [num2str(handles.MaxX) ' ']);
	set(handles.MaxXEdit, 'Value', handles.MaxX);
end

grid on;
set(handles.PlotAxes, 'XMinorTick', 'on');
set(handles.PlotAxes, 'YMinorTick', 'on');
set(handles.PlotAxes, 'FontSize', 12); %, 'FontWeight', 'bold');

title(handles.inputfile, 'FontSize', 14, 'FontWeight', 'bold');

[handles.XLabel, handles.YLabel, handles.UnitLabel, handles.Corner] = ...
	GetLabels(handles.PlotType, handles.Normalized, ...
	handles.Weighted, handles.Units);

xlabel(handles.XLabel, 'FontSize', 14, 'FontWeight', 'bold');
ylabel(handles.YLabel, 'FontSize', 14, 'FontWeight', 'bold');

legend(handles.Confidence, 'input data', 'randomized data');
legend('Location', handles.Corner);

end

set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

guidata(hObject,handles);


% --- Executes on button press in IntervalCountButton.
function IntervalCountButton_Callback(hObject, ~, handles)
% hObject    handle to IntervalCountButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

if handles.PlotType ~= 9
	
handles.PlotType = 9;






set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

end

guidata(hObject,handles);


% --- Executes on button press in SemivarioButton.
function SemivarioButton_Callback(hObject, ~, handles)
% hObject    handle to SemivarioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% check if new randomized features are needed
if handles.NeedNewRandom == 1
	message = sprintf('You need to calculate randomized data\nbefore running the analysis.');
	warndlg(message, 'Not so fast ...', 'modal');
else

if handles.PlotType ~= 10
	
handles.PlotType = 10;






set(handles.SaveGraphButton,'Enable','on');
set(handles.SaveDataButton,'Enable','on');

end

end

guidata(hObject,handles);




% --- Executes on button press in SaveGraphButton.
function SaveGraphButton_Callback(hObject, ~, handles)
% hObject    handle to SaveGraphButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% change directory to source of input
if handles.inputpath ~= 0
	originalpath = cd;
	cd(handles.inputpath);
end

% get output file name and path from user
[outputfile, outputpath] = ...
	uiputfile('Analysis_Output.eps', 'Choose an OUTPUT .eps file:');

% generate output file with graphical results
cd(outputpath);
set(gcf,'PaperPositionMode','auto');
set(gcf,'InvertHardcopy','off');
print('-r0', '-depsc', outputfile);

% reset directory to original
if handles.inputpath ~= 0
	cd(originalpath);
end

guidata(hObject,handles);


% --- Executes on button press in SaveDataButton.
function SaveDataButton_Callback(hObject, ~, handles)
% hObject    handle to SaveDataButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% change directory to source of input
if handles.inputpath ~= 0
	originalpath = cd;
	cd(handles.inputpath);
end

% get output file name and path from user
[outputfile, outputpath] = uiputfile('Analysis_Output.txt', ...
	'Choose an OUTPUT .txt file:');

% open output file
cd(outputpath);
[outputID, message] = fopen([outputpath, outputfile], 'a');
if outputID == -1
	disp(message)
end

% generate header for output file
fprintf(outputID, 'CorrCount v 1.2, Randall Marrett copyright 2016\n');
fprintf(outputID, 'Time:\t%s\n', datestr(now));
fprintf(outputID, 'Input file:\t%s\n', handles.inputfile);

fprintf(outputID, 'Number of feature pairs:\t%d\n', ...
	handles.SeparationCount);
fprintf(outputID, 'Number of features:\t%d\n', handles.ApertureCount);
fprintf(outputID, 'Sum feature size:\t%f\n', handles.SumAperture);
fprintf(outputID, 'Cv feature size:\t%f\n', handles.CvAp);
fprintf(outputID, 'Mean feature size:\t%f\n', ...
	mean(handles.Aperture(1:handles.ApertureCount)));
fprintf(outputID, 'Number of spacings:\t%d\n', handles.SpacingCount);
fprintf(outputID, 'Sum spacings:\t%f\n', handles.SumSpacing);
fprintf(outputID, 'Cv spacings:\t%f\n', handles.Cv);
fprintf(outputID, 'Mean spacing:\t%f\n', ...
	mean(handles.Spacing(1:handles.SpacingCount)));

if handles.InsertFeatures == 1
    fprintf(outputID, 'Features in scanline:\tyes\n');
else
    fprintf(outputID, 'Features in scanline:\tno\n');
end
fprintf(outputID, 'Extension:\t%f\n', handles.Extension);
fprintf(outputID, 'Unit of measure:\t%s\n', handles.UnitLabel);
fprintf(outputID, 'Length of scanline:\t%f\n', handles.ScanlineLength);
%fprintf(outputID, 'Length of scanline:\t%f\n', handles.FullScanlineLength);

fprintf(outputID, 'Start of domain analyzed:\t%f\n', handles.StartScan);
fprintf(outputID, 'End of domain analyzed:\t%f\n', handles.EndScan);
fprintf(outputID, 'Small feature-size threshold:\t%f\n', handles.MinSize);
fprintf(outputID, 'Large feature-size threshold:\t%f\n', handles.MaxSize);

if handles.Analytical == 1
	fprintf(outputID, 'Uncertainty estimates:\tanalytical\n');
	fprintf(outputID, 'Number of randomizations:\tnot applicable\n');
elseif handles.MonteCarlo == 1
	fprintf(outputID, 'Uncertainty estimates:\tMonte Carlo\n');
	fprintf(outputID, 'Number of randomizations:\t%d\n', ...
		handles.RandomIterations);
end

if handles.Graduations == 1
	fprintf(outputID, 'Logarithmic graduations:\tyes\n');
else
	fprintf(outputID, 'Linear graduations:\tyes\n');
end
fprintf(outputID, 'Number of lags:\t%d\n', handles.NumLags);
fprintf(outputID, 'Minimum lag:\t%f\n', handles.MinLag);
fprintf(outputID, 'Maximum lag:\t%f\n', handles.MaxLag);

fprintf(outputID, 'Confidence level:\t%s\n', handles.Confidence);
fprintf(outputID, 'Windowing:\t%d\n', handles.Windowing);
if handles.Normalized == 1
	fprintf(outputID, 'Normalized:\tyes\n');
else
	fprintf(outputID, 'Normalized:\tno\n');
end
if handles.Weighted == 1
	fprintf(outputID, 'Weighted:\tyes\n');
else
	fprintf(outputID, 'Weighted:\tno\n');
end
fprintf(outputID, '\n');

if handles.PlotType == 1
	
	% generate output with Correlation Count numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Length Scale\tNormalized Correlation Count\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Length Scale\tCorrelation Count\tAve\tAve-Conf\tAve+Conf\n');
	end

	for i = handles.NumLags:-1:1
		fprintf(outputID, '%f\t%f\t%f\t%f\t%f\n', ...
			handles.LengthScale(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	
elseif handles.PlotType == 2
	
	% generate output with Correlation Sum numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Length Scale\tNormalized Correlation Sum\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Length Scale\tCorrelation Sum\tAve\tAve-Conf\tAve+Conf\n');
	end

	for i = handles.NumLags:-1:1
		fprintf(outputID, '%f\t%f\t%f\t%f\t%f\n', ...
			handles.LengthScale(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	
elseif handles.PlotType == 3
	
	% generate output with Feature Intensity numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Position\tNormalized Intensity\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Position\tIntensity\tAve\tAve-Conf\tAve+Conf\n');
	end

	for i = 1:1:handles.NumLags
		fprintf(outputID, '%f\t%f\t%f\t%f\t%f\n', ...
			handles.LengthScale(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	
elseif handles.PlotType == 4
	
	% generate output with Staircase numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Position\tNormalized Staircase\tPosition\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Position\tStaircase\tPosition\tAve\tAve-Conf\tAve+Conf\n');
	end

	if handles.OutputNum < handles.NumLags
		temp1 = handles.OutputNum;
		temp2 = handles.NumLags;
	else
		temp1 = handles.NumLags;
		temp2 = handles.OutputNum;
	end
	
	for i = 1:1:temp1
		fprintf(outputID, '%f\t%f\t%f\t%f\t%f\t%f\n', ...
			handles.Horizontal(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.LengthScale(i), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	for i = (temp1+1):1:temp2
		if handles.OutputNum < handles.NumLags
			fprintf(outputID, '\t\t%f\t%f\t%f\t%f\n', ...
				handles.LengthScale(i), ...
				handles.Ave(i,handles.Switch), ...
				handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
				handles.AvePlusConf(i,handles.Switch));
		else
			fprintf(outputID, '%f\t%f\n', ...
				handles.Horizontal(i), ...
				handles.WindowVertical(i,handles.Switch));
		end
	end
	
elseif handles.PlotType == 5
	
	% generate output with Discrete Spacing numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Spacing\tNormalized Discrete Number\tSpacing\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Spacing\tDiscrete Number\tSpacing\tAve\tAve-Conf\tAve+Conf\n');
	end

	if handles.OutputNum < handles.NumLags
		temp1 = handles.OutputNum;
		temp2 = handles.NumLags;
	else
		temp1 = handles.NumLags;
		temp2 = handles.OutputNum;
	end
	
	for i = 1:1:temp1
		fprintf(outputID, '%f\t%f\t%f\t%f\t%f\t%f\n', ...
			handles.Horizontal(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.LengthScale(i), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	for i = (temp1+1):1:temp2
		if handles.OutputNum < handles.NumLags
			fprintf(outputID, '\t\t%f\t%f\t%f\t%f\n', ...
				handles.LengthScale(i), ...
				handles.Ave(i,handles.Switch), ...
				handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
				handles.AvePlusConf(i,handles.Switch));
		else
			fprintf(outputID, '%f\t%f\n', ...
				handles.Horizontal(i), ...
				handles.WindowVertical(i,handles.Switch));
		end
	end
	
elseif handles.PlotType == 6
	
	% generate output with Cumulative Spacing numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Spacing\tNormalized Cumulative Number\tSpacing\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Spacing\tCumulative Number\tSpacing\tAve\tAve-Conf\tAve+Conf\n');
	end

	if handles.OutputNum < handles.NumLags
		temp1 = handles.OutputNum;
		temp2 = handles.NumLags;
	else
		temp1 = handles.NumLags;
		temp2 = handles.OutputNum;
	end
	
	for i = 1:1:temp1
		fprintf(outputID, '%f\t%f\t%f\t%f\t%f\t%f\n', ...
			handles.Horizontal(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.LengthScale(i), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	for i = (temp1+1):1:temp2
		if handles.OutputNum < handles.NumLags
			fprintf(outputID, '\t\t%f\t%f\t%f\t%f\n', ...
				handles.LengthScale(i), ...
				handles.Ave(i,handles.Switch), ...
				handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
				handles.AvePlusConf(i,handles.Switch));
		else
			fprintf(outputID, '%f\t%f\n', ...
				handles.Horizontal(i), ...
				handles.WindowVertical(i,handles.Switch));
		end
	end
	
elseif handles.PlotType == 7
	
    % why does this instance (and others above) ignore weighting ?
    % note: weighting recorded in header
    
    % should it not be reflected in variable ID below ?
    
	% generate output with Fourier numerical results
	if handles.Normalized == 1
		fprintf(outputID, ...
			'Length Scale\tNormalized Normalized Power Spectal Density\tAve\tAve-Conf\tAve+Conf\n');
	else
		fprintf(outputID, ...
			'Length Scale\tPower Spectal Density\tAve\tAve-Conf\tAve+Conf\n');
	end

	for i = 1:1:handles.NumLags
		fprintf(outputID, '%16.8f\t%f\t%f\t%f\t%f\n', ...
			handles.LengthScale(i), ...
			handles.WindowVertical(i,handles.Switch), ...
			handles.Ave(i,handles.Switch), ...
			handles.AvePlusConf(handles.NumLags+1+i,handles.Switch), ...
			handles.AvePlusConf(i,handles.Switch));
	end
	
end

% reset directory to original
cd(originalpath);

% close output file
fclose(outputID);
% status = fclose(outputID);

guidata(hObject,handles);
