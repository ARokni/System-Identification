close all
clear
clc
sampling_time = 1; NORMAL = 0; nb = 2; nc = 1; nd = 2; nf = 2; nk_I = 0; nk_II = 5; nk_III = 10; nk_IV = 15;
%% Make Data
K_num = [0.1 0]; K_denum = [1 -1]; K = tf(K_num, K_denum,sampling_time);
G_num = [(1-exp(-0.2))]; G_denum = [1 -exp(-0.2)];  G = tf(G_num, G_denum,sampling_time);
D_num = [1]; D_denum = [1 0 0 0 0 0 0 0 0 0 0];  D = tf(D_num, D_denum,sampling_time);
H = D*K*G/(1+K*G);
F_noise = D*1/(1+K*G);
dist = NORMAL;
t_min = 25; N = 10; u_prbs2 = binrand(350,N,t_min,1,dist);
t = 1:length(u_prbs2);
y_prbs = lsim(H,u_prbs2,t');
mu = 0; sigma = 0.1; noise_data = normrnd(mu, sigma, length(y_prbs),1);
y_noise = lsim(F_noise, noise_data, t');
y = y_prbs + y_noise;
u = u_prbs2;
%save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\prbs_p4','u');
%save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\y_p4','y');
prbs_data = load('prbs_p4.mat');
sysI_out = load('y_p4.mat');
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
bj_model_I =  bj(z_train, [nb nc nd nf nk_I])
bj_model_II = bj(z_train, [nb nc nd nf nk_II])
bj_model_III = bj(z_train, [nb nc nd nf nk_III])
bj_model_IV = bj(z_train, [nb nc nd nf nk_IV])
pzmap(bj_model_I);
figure()
pzmap(bj_model_II);
figure()
pzmap(bj_model_III);
figure()
pzmap(bj_model_IV);
figure()
pzmap(H);
figure()
compare(z_val,bj_model_I, bj_model_II, bj_model_III, bj_model_IV)

