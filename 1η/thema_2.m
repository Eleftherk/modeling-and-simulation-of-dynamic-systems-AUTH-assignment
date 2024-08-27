clc
clear all
format long


el=100;

t = 0:0.00001:6;
[VR,VC] = v(t);
for i = 1:1:length(t)
    u1(i) = 2*sin(4*t(i));
    u2(i) = 4;
end

A = tf([1 0],[1 2*el el^2]);
B = tf(1,[1 2*el el^2]);
C = tf([1 0],[1 2*el el^2]);
D = tf([1 0],[1 2*el el^2]);
E = tf(1,[1 2*el el^2]);

F1 = lsim(A,VC,t);
F2 = lsim(B,VC,t);
F3 = lsim(C,u1,t);
F4 = lsim(D,u2,t);
F5 = lsim(E,u2,t);

FC = [F1 F2 F3 F4 F5];
th0 = (VC*FC*(inv(FC'*FC)))


A=0;
B=0;
C=0;
D=0;
F1=0;
F2=0;
F3=0;
F4=0;


A = tf([1 0],[1 2*el el^2]);
B = tf(1,[1 2*el el^2]);
C = tf([1 0 0],[1 2*el el^2]);
D = tf([1 0 0],[1 2*el el^2]);
E = tf(1,[1 2*el el^2]);

F1 = lsim(A,VR,t);
F2 = lsim(B,VR,t);
F3 = lsim(C,u2,t);
F4 = lsim(D,u1,t);
F5 = lsim(E,u1,t);
%{
A = tf([1 0],[1 2*el el^2]);
B = tf(1,[1 2*el el^2]);
C = tf([1 0 0],[1 2*el el^2]);
D = tf(1,[1 2*el el^2]);

F1 = lsim(A,VR,t);
F2 = lsim(B,VR,t);
F3 = lsim(C,u1,t);
F4 = lsim(D,u1,t);
%}

FR = [F1 F2 F3 F4 F5];

th01 = (VR*FR*(inv(FR'*FR)))

for i = 1:1:length(t)
    VCn(i) = th0 * FC(i,:)';
    VRn(i) = th01 * FR(i,:)';
end
figure("Name","VC-VCn")
plot(t,VCn)
hold on
plot(t,VC)
figure("Name","VR-VRn")
plot(t,VRn)
hold on
plot(t,VR)
errVC = VCn-VC;
errVR = VRn-VR;
figure("Name","errorVR")
plot(t,errVR)
figure("Name","errorVC") 
plot(t,errVC)



VC(100)=VC(100)+1050;
VR(100)=VR(100)+3043;

VC(200000)=VC(200000)+930;
VR(200000)=VR(200000)+6033;

VC(420000)=VC(420000)+7050;
VR(420000)=VR(420000)+3143;


A=0;
B=0;
C=0;
D=0;
F1=0;
F2=0;
F3=0;
F4=0;

A = tf([1 0],[1 2*el el^2]);
B = tf(1,[1 2*el el^2]);
C = tf([1 0],[1 2*el el^2]);
D = tf([1 0],[1 2*el el^2]);
E = tf(1,[1 2*el el^2]);

F1 = lsim(A,VC,t);
F2 = lsim(B,VC,t);
F3 = lsim(C,u1,t);
F4 = lsim(D,u2,t);
F5 = lsim(E,u2,t);

FC = [F1 F2 F3 F4 F5];
th0 = (VC*FC*(inv(FC'*FC)))


A=0;
B=0;
C=0;
D=0;
F1=0;
F2=0;
F3=0;
F4=0;
F5=0;

A = tf([1 0],[1 2*el el^2]);
B = tf(1,[1 2*el el^2]);
C = tf([1 0 0],[1 2*el el^2]);
D = tf([1 0 0],[1 2*el el^2]);
E = tf(1,[1 2*el el^2]);

F1 = lsim(A,VR,t);
F2 = lsim(B,VR,t);
F3 = lsim(C,u2,t);
F4 = lsim(D,u1,t);
F5 = lsim(E,u1,t);
%{
A = tf([1 0],[1 2*el el^2]);
B = tf(1,[1 2*el el^2]);
C = tf([1 0 0],[1 2*el el^2]);
D = tf(1,[1 2*el el^2]);

F1 = lsim(A,VR,t);
F2 = lsim(B,VR,t);
F3 = lsim(C,u1,t);
F4 = lsim(D,u1,t);
%}

FR = [F1 F2 F3 F4 F5];

th01 = (VR*FR*(inv(FR'*FR)))

for i = 1:1:length(t)
    VCn(i) = th0 * FC(i,:)';
    VRn(i) = th01 * FR(i,:)';
end

figure("Name","VC-VCn-noice")
plot(t,VCn)
hold on
plot(t,VC)
figure("Name","VR-VRn-noice")
plot(t,VRn)
hold on
plot(t,VR)
errVC = VCn-VC;
errVR = VRn-VR;
figure("Name","errorVR-noice")
plot(t,errVR)
figure("Name","errorVC-noice") 
plot(t,errVC)


