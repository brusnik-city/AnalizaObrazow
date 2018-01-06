function varargout = test(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
%end DO NOT EDIT

function test_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);


function varargout = test_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


%metoda obs³uguj¹ca klawisz "Wczytaj obraz"
function pushbutton1_Callback(hObject, eventdata, handles)

[f,p] = uigetfile({'*.png;*.jpg;*.bmp;*.tif','Supported images';...
                 '*.png','Portable Network Graphics (*.png)';...
                 '*.jpg','J-PEG (*.jpg)';...
                 '*.bmp','Bitmap (*.bmp)';...
                 '*.tif','Tagged Image File (*.tif,)';...
                 '*.*','All files (*.*)'});
global object;
object = PraseImage;
object.bw;
object.readIm([p,f]);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "makeLighter"
function pushbutton2_Callback(hObject, eventdata, handles)

global object;
object.makeLighter(0);
imshow(object.currentIm,'Parent',handles.axes1);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%metoda obs³uguj¹ca klawisz "changeContrast"
global object;
object.changeContrast(3);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeCorelation"
function pushbutton4_Callback(hObject, eventdata, handles)

global object;
object.changeCorelation(2.1);
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "binOtsu"
function pushbutton5_Callback(hObject, eventdata, handles)
 
global object;
object.binOtsu();
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "gradient"
function pushbutton6_Callback(hObject, eventdata, handles)

global object;
object.gradient(0.1, 1.4,'o');
imshow(object.currentIm,'Parent',handles.axes1);


%metoda obs³uguj¹ca klawisz "changeToBw"
function pushbutton7_Callback(hObject, eventdata, handles)
 
global object;
object.changeToBw();
imshow(object.currentIm,'Parent',handles.axes1);
