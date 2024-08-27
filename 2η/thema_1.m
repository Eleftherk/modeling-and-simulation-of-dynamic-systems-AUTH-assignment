format long
clear all
clc
syms t

%initialization
a = 3;
b = 0.5;

%question 1

%selection of the parameters
el = 3;
g = 40;

%solution of the system of differential equations
[t,var_1] = ode45(@(t,var) odefun_1(t,var,a,b,g,el),0:0.1:20,[0 0 0 0 0]);

%find xhat for every t  using auxiliary variables for the results of ode
th = [var_1(:,4) var_1(:,5)];
f = [var_1(:,2) var_1(:,3)];
for i= 1:length(t)
    xhat(i)=th(i,:)*f(i,:)';
end

%plots
figure(Name="x,xhat with t_a")
plot(t,xhat)
hold on 
plot (t,var_1(:,1))
title("plot of x and xhat with time question a")
xlabel("t")
ylabel('x,x_h_a_t')

figure(Name="error-difference_a")
err=var_1(:,1) - xhat';
plot(t,err)
title("plot of the difference between x and xhat question a")
xlabel("t")
ylabel('x-x_h_a_t')

figure(Name="plot of ahat_a")
plot(t,el-var_1(:,4))
title("plot of ahat in time question a")
xlabel("t")
ylabel('a_h_a_t')

figure(Name="plot of bhat_a")
plot(t,var_1(:,5))
title("plot of bhat in time question a")
xlabel("t")
ylabel('b_h_a_t')



%question 2

%selection of the parameters
el = 2;
g = 50;

%solution the system of differential equations
[t,var_2] = ode45(@(t,var) odefun_2(t,var,a,b,g,el),0:0.1:20,[0 0 0 0 0]);

%find xhat for every t using auxiliary variables for the results of ode
th = [var_2(:,4) var_2(:,5)];
f = [var_2(:,2) var_2(:,3)];
for i= 1:length(t)
    xhat(i)=th(i,:)*f(i,:)';
end

%plots 
figure(Name="x,xhat with t_b")
plot(t,xhat)
hold on 
plot (t,var_2(:,1))
title("plot of x and xhat with time question b")
xlabel("t")
ylabel('x,x_h_a_t')

figure(Name="error-difference_b")
err=var_2(:,1) - xhat';
plot(t,err)
title("plot of the difference between x and xhat question b")
xlabel("t")
ylabel('x-x_h_a_t')

figure(Name="plot of ahat_b")
plot(t,el-var_2(:,4))
title("plot of ahat in time question b")
xlabel("t")
ylabel('a_h_a_t')

figure(Name="plot of bhat_b")
plot(t,var_2(:,5))
title("plot of bhat in time question b")
xlabel("t")
ylabel('b_h_a_t')

%implimentation of gradiend method for input u=10
function dy = odefun_1(t,var,a,b,g,el)
%var(1)=x var(2)=f1 var(3)=f2 var(4)=th1 var(5)=th2
u=10;
dx=-a*var(1)+b*u;
df1=-el*var(2)+var(1);
df2=-el*var(3)+u;
dth1=g*(var(1)-(var(4)*var(2)+var(5)*var(3)))*var(2);
dth2=g*(var(1)-(var(4)*var(2)+var(5)*var(3)))*var(3);
dy=[dx;df1;df2;dth1;dth2];

end

%implimentation of gradiend method for input u=10*sin(3*t)
function dy = odefun_2(t,var,a,b,g,el)
%var(1)=x var(2)=f1 var(3)=f2 var(4)=th1 var(5)=th2
u=10*sin(3*t);
dx=-a*var(1)+b*u;
df1=-el*var(2)+var(1);
df2=-el*var(3)+u;
dth1=g*(var(1)-(var(4)*var(2)+var(5)*var(3)))*var(2);
dth2=g*(var(1)-(var(4)*var(2)+var(5)*var(3)))*var(3);
dy=[dx;df1;df2;dth1;dth2];

end



