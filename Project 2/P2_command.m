close all
clear
clc
%%  Prbs Input
prbs_data = load('prbs_p2.mat');
sysI_out = load('sys2_out_p2.mat');

u = prbs_data.u_p2;
y_tmp = sysI_out.system2_output_p2;
time = 1:length(u);
y = y_tmp(1:length(u),2);
plot(time,u);
% Removing Equilibrium Values from the Data
u = u -  ones(size(u,1),1)*mean(u);
y = y -  ones(size(y,1),1)*mean(y);
% Split data to Train and Validaion
train_size = 480;
u_train = u(1:train_size);
y_train = y(1:train_size);
u_val = u(train_size+1:length(u));
y_val = y(train_size+1:length(y));
%Spli Train and Validation Data
z_train = [y_train, u_train];
z_val = [y_val, u_val];
%Estimate Model
na = 2; nb = 2; nc =1; nk = 0;
arx_model = arx(z_train, [na,nb,nk])
armax_model = armax(z_train,[na nb nc nk])
%% Input 2
close all
clear
clc
prbs_data = load('u_prbsp2.mat');
sysI_out = load('y_prbs_p2.mat');
u = prbs_data.u_prbs2;
y = sysI_out.y_prbs_2;
t = 1:length(u);
plot(t,u);
% Removing Equilibrium Values from the Data
u = u -  ones(size(u,1),1)*mean(u);
y = y -  ones(size(y,1),1)*mean(y);
% Split data to Train and Validaion
train_size = 480;
u_train = u(1:train_size);
y_train = y(1:train_size);
u_val = u(train_size+1:length(u));
y_val = y(train_size+1:length(y));
%Spli Train and Validation Data
z_train = [y_train, u_train];
z_val = [y_val, u_val];
%Estimate Model
na = 2; nb = 2; nc =1; nk = 0;
arx_model = arx(z_train, [na,nb,nk])
armax_model = armax(z_train,[na nb nc nk])

