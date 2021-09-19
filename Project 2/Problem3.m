close all
clear
clc
sampling_time = 1; NORMAL = 0; na = 2; nb = 2; nc = 1; nd = 2; nf = 2; nk = 0;
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
%%Calculate Correlation
%BJ Major Noise
%bj_B = [0.004726 0.01123 0]; bj_F = [1 -1.823 0.8393]; bj_sys = tf(bj_B, bj_F,sampling_time);
%bj_C = [1 -0.4822 0]; bj_D = [1 -0.5649 -0.09161]; bj_noise = tf(bj_C, bj_D,sampling_time);
%BJ Average Noise
bj_B = [0.00669 0.009596 0]; bj_F = [1 -1.818 0.835]; bj_sys = tf(bj_B, bj_F,sampling_time);
bj_C = [1 -0.8245 0]; bj_D = [1 -1.073 0.1165]; bj_noise = tf(bj_C, bj_D,sampling_time);
%BJ Minor Noise
%bj_B = [0.0008645 0.01721 0]; bj_F = [1 -1.801 0.8187]; bj_sys = tf(bj_B, bj_F,sampling_time);
%bj_C = [1 -0.9783 0]; bj_D = [1 -1.161 0.1617]; bj_noise = tf(bj_C, bj_D,sampling_time);

y_bj_sys = lsim(bj_sys, u, t');
y_bj_noise = lsim(bj_noise, noise_data, t');
y_bj = y_bj_sys + y_bj_noise;
error_bj = y_bj - y;

error_input_corr = corr(error_bj, u)
error_output_corr = corr(error_bj, y)