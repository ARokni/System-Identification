close all
clear
clc
sampling_time = 1; NORMAL = 0; na = 3; nb = 2; nc = 1; nd = 2; nf = 3; nk = 0;
%% Make Data
K_num = [0.1 0]; K_denum = [1 -1]; K = tf(K_num, K_denum,sampling_time);
G_num = [(1-exp(-0.2))]; G_denum = [1 -exp(-0.2)];  G = tf(G_num, G_denum,sampling_time);
H = K*G/(1+K*G);
F_noise = 1/(1+K*G);
dist = NORMAL;
t_min = 25; N = 10; u_prbs2 = binrand(350,N,t_min,1,dist);
t = 1:length(u_prbs2);
y_prbs = lsim(H,u_prbs2,t');
mu = 0; sigma = 0.1; noise_data = normrnd(mu, sigma, length(y_prbs),1);
y_noise = lsim(F_noise, noise_data, t');
y = y_prbs + y_noise;
u = u_prbs2; 
%save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\prbs_p3_major','u');
%save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\y_p3_major','y');
prbs_data = load('prbs_p3_average.mat');
sysI_out = load('y_p3_average.mat');
u = prbs_data.u;
y = sysI_out.y;
%Preprocess Data
% Removing Equilibrium Values from the Data
u = u -  ones(size(u,1),1)*mean(u);
y = y -  ones(size(y,1),1)*mean(y);
% Split data to Train and Validaion
train_size = 280;
u_train = u(1:train_size);
y_train = y(1:train_size);
u_val = u(train_size+1:length(u));
y_val = y(train_size+1:length(y));
z_train = [y_train, u_train];
z_val = [y_val, u_val];
%% Model Estimation
arx_model = arx(z_train, [na,nb,nk])
armax_model = armax(z_train,[na nb nc nk])
ararx_model = pem(z_train,'na',na,'nb',nb,'nd',nd,'nk',nk)
oe_model = oe(z_train,[nb nf nk])
bj_model =  bj(z_train, [nb nc nd nf nk])
figure()
pzmap(ararx_model);
figure()
pzmap(H);
figure()
pzmap(arx_model);
figure()
pzmap(armax_model);
figure()
pzmap(bj_model);
figure()
pzmap(oe_model);
figure()
compare(z_val,arx_model,armax_model,ararx_model,oe_model,bj_model)