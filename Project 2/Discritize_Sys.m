close all
clear
clc
K_num = [5 5]; K_denum = [1 1 20]; K = tf(K_num, K_denum);
Hd = c2d(K,0.1,'zoh')