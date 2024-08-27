format long
clear all
clc
syms t p

%initialization
A=[-0.25 3; -5 0];
B=[0.5 ; 1.5];


%selection of the parameters

%g1=[100 0; 0 100];
%g2=[100 0; 0 100];
g1=100;
g2=100;
thm = 5;

%solution of the system of differential equations
[t,var_1] = ode45(@(t,var) odefun_1(t,var,A,B,g1,g2,thm),0:0.01:10,[0 0 0 0 0 0 0 0 0 0]);

%plots
figure(Name="x1")
plot(t,var_1(:,1))
hold on 
plot(t,var_1(:,3))
hold on 
plot(t,var_1(:,1)-var_1(:,3))
title("x_1, x_1_h_a_t and subtraction x_1-x_1_h_a_t(error) with time")
xlabel("t")
ylabel('x_1, x_1_h_a_t, x_1-x_1_h_a_t')

figure(Name="x2")
plot(t,var_1(:,2))
hold on
plot(t,var_1(:,4))
hold on
plot(t,var_1(:,2)-var_1(:,4))
title("x_2 and x_2_h_a_t and subtraction x_2-x_2_h_a_t(error) with time")
xlabel("t")
ylabel('x_2, x_2_h_a_t, x_2-x_2_h_a_t')

figure(Name="A_hat")    
subplot(2,2,1)
plot(t,var_1(:,5))
title("A_h_a_t(1,1)")
xlabel("t")
ylabel('A_h_a_t(1,1)')
subplot(2,2,2)
plot(t,var_1(:,6))
title("A_h_a_t(1,2)")
xlabel("t")
ylabel('A_h_a_t(1,2)')
subplot(2,2,3)
plot(t,var_1(:,7))
title("A_h_a_t(2,1)")
xlabel("t")
ylabel('A_h_a_t(2,1)')
subplot(2,2,4)
plot(t,var_1(:,8))
title("A_h_a_t(2,2)")
xlabel("t")
ylabel('A_h_a_t(2,2)')

figure(Name="B")
subplot(1,2,1)
plot(t,var_1(:,9))
title("B_h_a_t(1)")
xlabel("t")
ylabel('B_h_a_t(1)')
subplot(1,2,2)
plot(t,var_1(:,10))
title("B_h_a_t(2)")
xlabel("t")
ylabel('B_h_a_t(2)')

%impimentation of lyapunov series-parallel configuration for 2nd degree system
function dy = odefun_1(t,var,A,B,g1,g2,thm)
%var(1)=x1 var(2)=x2 
% var(3)=x_hat1 var(4)=x_hat2 
% var(5)=Α_hat11 var(6)=Α_hat12 var(7)=Α_hat21 var(8)=Α_hat22 
% var(9)=Β_hat1 var(10)=Β_hat2
x=[var(1) ; var(2)];
x_hat=[var(3); var(4)];
A_hat=[var(5) var(6); var(7) var(8)];
B_hat=[var(9) ; var(10)];
u=3.5*sin(7.2*t) + 2*sin(11.7*t);
e=x-x_hat;
dx= A*x+B*u;
dx_hat = A_hat*x+B_hat*u+thm*e;
dA_hat = g1*e*x';
dB_hat = g2*e*u';
dy=[dx(1);dx(2);dx_hat(1);dx_hat(2);dA_hat(1,1);dA_hat(1,2);dA_hat(2,1);dA_hat(2,2);dB_hat(1);dB_hat(2)];
end