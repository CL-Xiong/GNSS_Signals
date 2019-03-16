%����C/A�벢�������ϵ��
%
%mod(a+b,2)����a��b��ģ2��
CODE_LENGTH   = 1023;           %��Ƭ��   
NUM           = 500;            %��λ������ֵ

%2-2(a)--------------------------------------------------------------------
 CA_19_0 = generateC_A(19,CODE_LENGTH,0);
 CA_19_0 = Trans(CA_19_0,CODE_LENGTH);
 R1 = Relafunc(CA_19_0,CA_19_0,CODE_LENGTH,NUM);
 figure(1);
 plot((-NUM:NUM),R1);
 axis([-NUM NUM -0.2 1.05])
 xlabel('��λn');
 ylabel('��غ���');
 title('PRN19����غ���');
 
%2-2(b)--------------------------------------------------------------------
CA_19_200 = generateC_A(19,CODE_LENGTH,200);
CA_19_200 = Trans(CA_19_200,CODE_LENGTH);
R2 = Relafunc(CA_19_0,CA_19_200,CODE_LENGTH,NUM);
figure(2);
plot((-NUM:NUM),R2);
xlabel('��λn');
ylabel('��غ���');
title('�ӳ�200��ƬPRN19��PRN19������غ���');
axis([-NUM NUM -0.2 1.05])

%2-2(c)--------------------------------------------------------------------
CA_25_0 = generateC_A(25,CODE_LENGTH,0);
CA_25_0 = Trans(CA_25_0,CODE_LENGTH);
R3 = Relafunc(CA_19_0,CA_25_0,CODE_LENGTH,NUM);
figure(3);
plot((-NUM:NUM),R3);
xlabel('��λn');
ylabel('��غ���');
title('PRN19��PRN25������غ���');
axis([-NUM NUM -0.2 1.05])

%2-2(d)--------------------------------------------------------------------
CA_5_0 = generateC_A(5,CODE_LENGTH,0);
CA_5_0 = Trans(CA_5_0,CODE_LENGTH);
R4 = Relafunc(CA_19_0,CA_5_0,CODE_LENGTH,NUM);
figure(4);
plot((-NUM:NUM),R4);
xlabel('��λn');
ylabel('��غ���');
title('PRN19��PRN5������غ���');
axis([-NUM NUM -0.2 1.05])

%2-2(e)--------------------------------------------------------------------
CA_19_350 = generateC_A(19,CODE_LENGTH,350);
CA_19_350 = Trans(CA_19_350,CODE_LENGTH);
CA_25_905 = generateC_A(25,CODE_LENGTH,905);
CA_25_905 = Trans(CA_25_905,CODE_LENGTH);
CA_5_75 = generateC_A(5,CODE_LENGTH,75);
CA_5_75 = Trans(CA_5_75,CODE_LENGTH);
CA_123=CA_19_350+CA_25_905+CA_5_75;

R5=Relafunc(CA_19_0,CA_123,CODE_LENGTH,NUM);
figure(5);
plot((-NUM:NUM),R5);
xlabel('��λn');
ylabel('��غ���');
title('(x1+x2+x3)��PRN19������غ���');
axis([-NUM NUM -0.2 1.05])

%2-2(f)--------------------------------------------------------------------
figure(6);
noise = 4*randn(1,CODE_LENGTH);
subplot(4,1,1);
plot((1:CODE_LENGTH),CA_19_350);
axis([0 CODE_LENGTH+1 -4.1 4.1])

subplot(4,1,2);
plot((1:CODE_LENGTH),CA_25_905);
axis([0 CODE_LENGTH+1 -4.1 4.1])

subplot(4,1,3);
plot((1:CODE_LENGTH),CA_5_75);
axis([0 CODE_LENGTH+1 -4.1 4.1])

subplot(4,1,4);
plot((1:CODE_LENGTH),noise);
axis([0 CODE_LENGTH+1 -4.1 4.1])

%2-2(g)--------------------------------------------------------------------
CA_123n=CA_123+noise;
R7=Relafunc(CA_19_0,CA_123n,CODE_LENGTH,NUM);
figure(7);
plot((-NUM:NUM),R7);
xlabel('��λn');
ylabel('��غ���');
title('(x1+x2+x3+noise)��PRN19������غ���');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ת����{0��1}->{1,-1}
function CA=Trans(CA,CodeLength)
for i=1:CodeLength
    if CA(i)==0
        CA(i)=1;
    elseif CA(i)==1
            CA(i)=-1;
    end
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�������ϵ��
function Rkl = Relafunc(Rk,Rl,CodeLength,NUM)
Rkl= zeros(2*NUM+1);
for k = 1:2*NUM+1
    n = k-NUM-1;
        for i = 1:CodeLength
            if i+n>1023
                Rl_n=Rl(i+n-1023);
            elseif i+n<1
                Rl_n=Rl(i+n+1023);
            elseif i+n>=1 && i+n<=1023
                Rl_n=Rl(i+n);
            end
        Rkl(k)=Rkl(k)+Rk(i)*Rl_n;
        end
   
    Rkl(k)=Rkl(k)/CodeLength;
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����C/A��
function C_A = generateC_A(PRN,CodeLength,Delay)
PRN_SELECTION = [2,6;3,7;4,8;5,9;1,9;2,10;1,8;2,9;3,10;2,3;
                 3,4;5,6;6,7;7,8;8,9;9,10;1,4;2,5;3,6;4,7;
                 5,8;6,9;1,3;4,6;5,7;6,8;7,9;8,10;1,6;2,7;
                 3,8;4,9;5,10;];
% ����ѡ��PRN
S1=PRN_SELECTION(PRN,1);
S2=PRN_SELECTION(PRN,2);
%G1��G2��������ʼ��
G1=ones(1,10);
G2=ones(1,10);
C_A=zeros(1,CodeLength);

for i=1:CodeLength+Delay
    NewBit=mod(G1(3)+G1(10),2);
    G_1=G1(10);
    G1=[NewBit G1(1:9)];

    NewBit=mod(G2(S1)+G2(S2),2); 
    G_2i=G2(10);
    G2=[NewBit G2(1:9)];
    
    if i>Delay
    C_A(i-Delay)=mod(G_1+G_2i,2);
    end
end
end
