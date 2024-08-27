format long
clear all
clc
syms t

%initialization
a=3;
b=0.5;

%selection of the parameters 
g1=15;
g2=1;
thm=10;

%solution of the system of differential equations for first question(parallel)
[t,var_1] = ode45(@(t,var) odefun_1(t,var,a,b,g1,g2),0:0.01:20,[0 0 0 0]);

%solution of the system of differential equations for second question(series-parallel)
[t,var_2] = ode45(@(t,var) odefun_2(t,var,a,b,g1,g2,thm),0:0.01:20,[0 0 0 0]);

%auxiliary variables for the results of ode(first question)
x = var_1(:,1);
x_hat = var_1(:,2);
a_hat = var_1(:,3);
b_hat = var_1(:,4);

%plots of the first question
figure(Name="x and x_hat with time_parallel")
plot(t,x)
hold on 
plot (t,x_hat)
title("x and x_h_a_t with time parallel")
xlabel("t")
ylabel('x,x_h_a_t')
figure(Name="x-x_hat with time_parallel")
plot (t,x-x_hat)
title("x-x_h_a_t with time parallel")
xlabel("t")
ylabel('x-x_h_a_t')
figure(Name="a_hat_parallel")
plot(t,a_hat)
title("a_h_a_t parallel")
xlabel("t")
ylabel('a_h_a_t')
figure(Name="b_hat_parallel")
plot(t,b_hat)
title("b_h_a_t parallel")
xlabel("t")
ylabel('b_h_a_t')

%auxiliary variables for the results of ode (second question)
x = var_2(:,1);
x_hat = var_2(:,2);
a_hat = var_2(:,3);
b_hat = var_2(:,4);

%plots of second question
figure(Name="x and x_hat with time_series - parallel")
plot(t,x)
hold on 
plot (t,x_hat)
title("x and x_h_a_t with time series - parallel")
xlabel("t")
ylabel('x,x_h_a_t')
figure(Name="x-x_hat with time_series - parallel")
plot (t,x-x_hat)
title("x-x_h_a_t with time series - parallel")
xlabel("t")
ylabel('x-x_h_a_t')
figure(Name="a_hat_series - parallel")
plot(t,a_hat)
title("a_h_a_t series - parallel")
xlabel("t")
ylabel('a_h_a_t')
figure(Name="b_hat_series - parallel")
plot(t,b_hat)
title("b_h_a_t series - parallel")
xlabel("t")
ylabel('b_h_a_t')


%implimentation of lyapunov parallel cofiguration for 1st degree system
function dy = odefun_1(t,var,a,b,g1,g2)
%var(1)=x var(2)=x_hat var(3)=th1->a_hat var(4)=th2->b_hat
u=10*sin(3*t);
n=0.4*sin(2*pi*40*t);
dx=-a*var(1)+b*u;
dx_hat=-var(3)*var(2)+var(4)*u;
dth1=-g1*(var(1)-var(2)+n)*var(2);
dth2=g2*(var(1)-var(2)+n)*u;
dy=[dx;dx_hat;dth1;dth2];
end

%implimentation of lyapunov series-parallel cofiguration for 1st degree system
function dy = odefun_2(t,var,a,b,g1,g2,thm)
%var(1)=x var(2)=x_hat var(3)=th1 var(4)=th2 
u=10*sin(3*t);
n=0.5*sin(2*pi*40*t);
dx=-a*var(1)+b*u;
dx_hat=-var(3)*(var(1)+n)+var(4)*u+thm*(var(1)-var(2)+n);
dth1=-g1*(var(1)-var(2)+n)*(var(1)+n);
dth2=g2*(var(1)-var(2)+n)*u;
dy=[dx;dx_hat;dth1;dth2];
end