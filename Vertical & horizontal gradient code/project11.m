function varargout = project11(varargin)
% PROJECT11 MATLAB code for project11.fig
%      PROJECT11, by itself, creates a new PROJECT11 or raises the existing
%      singleton*.
%
%      H = PROJECT11 returns the handle to a new PROJECT11 or the handle to
%      the existing singleton*.
%
%      PROJECT11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT11.M with the given input arguments.
%
%      PROJECT11('Property','Value',...) creates a new PROJECT11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project11

% Last Modified by GUIDE v2.5 30-Oct-2018 23:30:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project11_OpeningFcn, ...
                   'gui_OutputFcn',  @project11_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before project11 is made visible.
function project11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project11 (see VARARGIN)

% Choose default command line output for project11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in out_put.
function out_put_Callback(hObject, eventdata, handles)
% hObject    handle to out_put (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.out_put,'value')

% Hints: contents = cellstr(get(hObject,'String')) returns out_put contents as cell array
%        contents{get(hObject,'Value')} returns selected item from out_put
global img
I=rgb2gray(img);
%I=imnoise(I,'gaussian');
text=get(handles.edit1,'String');
sigma=str2num(text);
w=0;
kernel=zeros(5,5);
for i=1:5
    for j=1:5
        d=((i-3).^2+(j-3).^2)./(2*sigma*sigma);
        kernel(i,j)=exp(-d).*(1./sqrt(2*pi*sigma*sigma));
        w=w+kernel(i,j);
    end
end
kernel=kernel/w;
[m1,n1]=size(I);
output1=zeros(m1,n1);
Im=padarray(I,[4 4]);
for i=1:m1
    for j=1:n1
        x=Im(i:i+4,j:j+4);
        y=double(x);
        conv1=y.*kernel;
        output1(i,j)=sum(conv1(:));

    end
end
if val==1
conv1=zeros(5,5);
kernel1=[0 0 1 0 0;0 1 2 1 0;1 2 -16 2 1;0 1 2 1 0;0 0 1 0 0];
[m2,n2]=size(output1);
output2=zeros(m2,n2);
Im1=padarray(output1,[4 4]);
for i=1:m2
    for j=1:n2
        x=Im1(i:i+4,j:j+4);
        y=double(x);
        conv2=y.*kernel1; 
        output2(i,j)=sum(conv2(:));
    end
end
axes(handles.axes2);
output2=imshow(uint8(output2));
elseif val==2
    conv1=zeros(5,5);
kernel1=[2 2 2 2 2;1 1 1 1 1;0 0 0 0 0;-1 -1 -1 -1 -1;-2 -2 -2 -2 -2];
[m2,n2]=size(output1);
output2=zeros(m2,n2);
Im1=padarray(output1,[4 4]);
for i=1:m2
    for j=1:n2
        x=Im1(i:i+4,j:j+4);
        y=double(x);
        conv2=y.*kernel1; 
        output2(i,j)=sum(conv2(:));
    end
end
axes(handles.axes2);
output2=imshow(uint8(output2));
else val==3
    conv1=zeros(5,5);
kernel1=[2 1 0 -1 -2 ;2 1 0 -1 -2;2 1 0 -1 -2;2 1 0 -1 -2;2 1 0 -1 -2];
[m2,n2]=size(output1);
output2=zeros(m2,n2);
Im1=padarray(output1,[4 4]);
for i=1:m2
    for j=1:n2
        x=Im1(i:i+4,j:j+4);
        y=double(x);
        conv2=y.*kernel1; 
        output2(i,j)=sum(conv2(:));
    end
end
axes(handles.axes2);
output2=imshow(uint8(output2));
end
    
% --- Executes during object creation, after setting all properties.
function out_put_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_put (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Input.
function Input_Callback(hObject, eventdata, handles)
% hObject    handle to Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
[image,path]=uigetfile(('*.*'),'D:\AMIT\matlab practice');
img=imread([path,image]);
axes(handles.axes1)
imshow(img)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
