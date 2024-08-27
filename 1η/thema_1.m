clear all
clc
syms y(t)
m=10;
b=0.5;
k=2.5;

%differential solve
[t,y] = ode45(@(t,y) odefun(t,y,b,m,k), 0:0.1:10 , [0;0]);

%output
yout=y(:,1);

%input
for i = 1:1:length(t)  
    u(i,1)=15*sin(3*t(i))+8;
end

%create every factor of array theta
A = tf([1 0],[1 4 4]);
B = tf(1,[1 4 4]);
C = tf(1,[1 4 4]);

%create every collumn of matrix F
F1=lsim(A,yout,t);
F2=lsim(B,yout,t);
F3=lsim(C,u,t);

%get together matrix F
F=[F1 F2 F3];

%calculate theta0 matrix
th0 = (yout'*F*(inv(F'*F)))';

%calculate the parameters of the system bassed on theta*T
m = 1/th0(3)
k = -(th0(2)-4)*m
b = -(th0(1)-4)*m

%calculate the approximation of y

%[t,yn]=ode45(@(t,y) odefun(t,y,b,m,k), 0:0.1:10 , [0;0]);
yn=0;
for i = 1:1:length(t)
    yn(i) = th0' * F(i,:)';
end 
yout2=yn;
%yout2=yn(:,1);

%create plot for the real y and approximation
plot(t,yout,color = "blue")
hold on
plot(t,yout2,Color= "red")

%calculate and plot the differece between real y and the approximation
err=yout2'-yout;
%err=yout2-yout;
figure
plot(t,err)

%create our differential equation 
function dy=odefun(t,y,b,m,k)
u=15*sin(3*t)+8;
%y1=y
%y1'=y2
%y2'=-(b*1/m*y2)-(k*1/m*y1)+(1/m*u)
dy=[y(2);-(b*(1/m)*y(2))-(k*(1/m)*y(1))+((1/m)*u)];
end