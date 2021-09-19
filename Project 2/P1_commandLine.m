
%%  Prbs Input
close all
clear
clc
prbs_data = load('prbs1_p1.mat');
sysI_out = load('sys1_out_p1.mat');

u = prbs_data.u_p1;
y_tmp = sysI_out.system1_output_p1;
time = 1:length(u);
y = y_tmp(1:length(u),2);
% Removing Equilibrium Values from the Data
u = u -  ones(size(u,1),1)*mean(u);
y = y -  ones(size(y,1),1)*mean(y);
% Split data to Train and Validaion
train_size = 280;
u_train = u(1:train_size);
y_train = y(1:train_size);
u_val = u(train_size+1:length(u));
y_val = y(train_size+1:length(y));
% Creating iddata Objects
%Ts = 0.01; % Sample time is 0.5 min
%ze = iddata(y_train,u_train,Ts);
%zv = iddata(y_val,u_val,Ts);
% Set names of  channels
%ze.InputName = {'prbs'};
%zv.InputName = {'prbs'};
%ze.OutputName  = {'output estimation'};
%zv.OutputName  = {'output validation'};
% Model Estimation
%NN1 = struc(2:5,1:5,5); 
%selected_trcu = selstruc(arxstruc(ze,zv,NN1))
z_train = [y_train, u_train];
z_val = [y_val, u_val];

ar_prbs = arx(z_train, [2,2,0])
%%  Normal Input
%close all
%clear
%clc
u_p1_normal = load('u_p1_normal.mat');
out_p1_normal = load('system1_output_normal.mat');

u_normal = u_p1_normal.u_p1_normal;
y_tmp_normal = out_p1_normal.system1_output_normal;
time_normal = 1:length(u_normal);
y_normal = y_tmp_normal(1:length(u_normal),2);
u = u_normal;
y = y_normal;
% Removing Equilibrium Values from the Data
u = u -  ones(size(u,1),1)*mean(u);
y = y -  ones(size(y,1),1)*mean(y);
% Split data to Train and Validaion
train_size = 280;
u_train = u(1:train_size);
y_train = y(1:train_size);
u_val = u(train_size+1:length(u));
y_val = y(train_size+1:length(y));
%Spli Train and Validation Data
z_train = [y_train, u_train];
z_val = [y_val, u_val];
%Estimate Model
ar_normal = arx(z_train, [2,2,0])

%%  Uniform data
%close all
%clear
%clc

u_p1_uniform = load('u_p1_uniform.mat');
out_p1_uniform = load('system1_output_uniform.mat');

u_uniform = u_p1_uniform.u_p1_uniform;
y_tmp_uniform_tmp = out_p1_uniform.system1_output_uniform;
time_uniform = 1:length(u_uniform);
y_uniform = y_tmp_uniform_tmp(1:length(u_uniform),2);
u = u_uniform;
y = y_uniform;
% Removing Equilibrium Values from the Data
u = u -  ones(size(u,1),1)*mean(u);
y = y -  ones(size(y,1),1)*mean(y);
% Split data to Train and Validaion
train_size = 280;
u_train = u(1:train_size);
y_train = y(1:train_size);
u_val = u(train_size+1:length(u));
y_val = y(train_size+1:length(y));
%Spli Train and Validation Data
z_train = [y_train, u_train];
z_val = [y_val, u_val];
%Estimate Model
ar_uniform = arx(z_train, [2,2,0])
opt2 = compareOptions('InitialCondition','z');
compare(z_val, ar_prbs, ar_normal, ar_uniform,opt2);
figure()
compare([y,u], ar_prbs);