% *************************************************************************
% AllanVariance.m :Compute Phase or Frequency Sequence's Allan Variance
%  
%           Copyright (C) 2019 by Jason DING , All rights reserved.
%  
%    version :$Revision: 1.0 $ $Date: 2019/04/04 $
%    history : 2019/04/04  1.0  new
% *************************************************************************

function AllanVariance = AVAR_Phase(PhaseSequence,tau)
% ���ܣ�����ʱ���λ�����еİ��׷���.***************************************
% ���룺
%       PhaseSequence      ʱ������   
%       tau                ����ʱ����              
% �����
%       AllanVariance      ���׷���
% *************************************************************************
N = length(PhaseSequence);
bias=PhaseSequence(3:N)-2*PhaseSequence(2:N-1)+PhaseSequence(1:N-2);
AllanVariance=(bias*bias')/(2*(N-2)*tau*tau);
end

function AllanVariance = AVAR_Freq(FrequencySequence)
% ���ܣ�����Ƶ�����еİ��׷���.**********************************************
% ���룺
%       FrequencySequence      Ƶ������                 
% �����
%       AllanVariance          ���׷���
% *************************************************************************
M = length(FrequencySequence);
bias=FrequencySequence(2:M)-FrequencySequence(1:M-1);
AllanVariance=(bias*bias')/(2*(M-1));
end
