%% P1 PRBS Input
close all
clear
clc
NORMAL = 0;
dist = NORMAL;
u = binrand(350,10,25,1,dist)
t = 1:length(u);
figure()
plot(t,u)
time_vect = 1:length(u);
u_augmented = [time_vect', u]; 
u_p1 = u;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\prbs1_p1','u_p1');
%%  P1  PRBS Output
system1_output_p1 = out.Sys1_output;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\sys1_out_p1','system1_output_p1');
%%  P1  Normal Input
u_p1_normal = normrnd(0,1,[350,1]);
time_vect_normal = 1:length(u_p1_normal);
u_p1_normal_aug = [time_vect_normal', u_p1_normal];
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\u_p1_normal','u_p1_normal');
%%  P1  Normal Output
system1_output_normal = out.Sys1__normal_output;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\system1_output_normal','system1_output_normal');
%%  P1  Uniform Input
u_p1_uniform = unifrnd(0,1,[350,1]);
time_vect_uniform = 1:length(u_p1_uniform);
u_p1_uniform_aug = [time_vect_uniform', u_p1_uniform];
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\u_p1_uniform','u_p1_uniform');
%%  P1  Uniform Output
system1_output_uniform = out.Sys1__uniform_output;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\system1_output_uniform','system1_output_uniform');
%% P2 PRBS Input Sys2
close all
clear
clc
NORMAL = 0
dist = NORMAL
t_min_p2 = 40;
u_p2 = binrand(600,10,t_min_p2,1,dist)
time_vect_p2 = 1:length(u_p2);
u_augmented_p2 = [time_vect_p2', u_p2]; 
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\prbs_p2','u_p2');
%%  P2  PRBS Output
system2_output_p2 = out.Sys2_prbs_output;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\sys2_out_p2','system2_output_p2');
%% P3 PRBS Input
close all
clear
clc
NORMAL = 0;
dist = NORMAL;
u = binrand(350,10,25,1,dist)
t = 1:length(u);
figure()
plot(t,u)
time_vect = 1:length(u);
u_augmented = [time_vect', u]; 
u_p3_noisy = u;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\prbs_p3_noisy','u_p3_noisy');
%%  P3  PRBS Output
system1_output_p3_noisy = out.Sys1_output;
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw2\Codes\Data\sys1_out_p3_noisy','system1_output_p3_noisy');




