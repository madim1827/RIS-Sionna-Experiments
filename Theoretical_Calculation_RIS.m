clear;
close all;
clc;

%% Parameters

freq = 28*1e9;          % Carrier Frequency
c = 3*1e8;              % Speed of the Light   
P_t = 20;               % Transmit Power in dBm
G_t = 20;               % Transmit Antenna (Horn) Gain in dBm
G_r = 20;               % Receive Antenna (Horn) Gain in dBm
RIS_ES0030 = 65.02;     % RIS gain for incident angle at 0 degree and reflection at 30 degree
RIS_ES0045 = 63.63;     % RIS gain for incident angle at 0 degree and reflection at 45 degree
RIS_ES0060 = 59.11;     % RIS gain for incident angle at 0 degree and reflection at 60 degree
RIS_ES3045 = 66.90;     % RIS gain for incident angle at -30 degree and reflection at 45 degree
RIS_ES3060 = 62.70;     % RIS gain for incident angle at -30 degree and reflection at 60 degree
Sys_Loss   = 9.6;       % System Loss in dB because of cabels and hardware imperfections

%% A Single RIS-aided System

dist_Tx_RIS = 3;      % Distance between Tx and RIS (check the paper)
dist_RIS_Rx = 3;      % Distance between RIS and Rx (check the paper)

FSPL_Tx_RIS = 20*log10(dist_Tx_RIS) + 20*log10(freq) + 20*log10(4*pi/(c));
FSPL_RIS_Rx = 20*log10(dist_RIS_Rx) + 20*log10(freq) + 20*log10(4*pi/(c));

P_r_single = P_t + G_t - FSPL_Tx_RIS - FSPL_RIS_Rx + G_r + RIS_ES0030 - Sys_Loss;

%% Cascaded RISs-aided System

dist_Tx_RIS_1    = 3;   % Distance between Tx and RIS #1     (check the paper)
dist_RIS_1_RIS_2 = 3;   % Distance between RIS #1 and RIS #2 (check the paper)
dist_RIS_2_Rx    = 3;   % Distance between RIS #2 and RX     (check the paper)

FSPL_Tx_RIS_1 = 20*log10(dist_Tx_RIS_1) + 20*log10(freq) + 20*log10(4*pi/(c));
FSPL_RIS_1_RIS_2 = 20*log10(dist_RIS_1_RIS_2) + 20*log10(freq) + 20*log10(4*pi/(c));
FSPL_RIS_2_Rx = 20*log10(dist_RIS_2_Rx) + 20*log10(freq) + 20*log10(4*pi/(c));

P_r_cascaded = P_t + G_t - FSPL_Tx_RIS_1 - FSPL_RIS_1_RIS_2 - FSPL_RIS_2_Rx + G_r + RIS_ES0060 + RIS_ES0030 - Sys_Loss;


%% RIS Partitioning System

RIS_ES0060_30 = 30;   % RIS gain of ES0060 reflector at 30 degree (for exact value check TMYTEK datasheet in our paper)
RIS_ES0030_30 = 60;   % RIS gain of ES0030 reflector at 60 degree (for exact value check TMYTEK datasheet in our paper)

dist_Tx_RIS = 3;      % Distance between Tx and RIS (check the paper)
dist_RIS_Rx = 3;      % Distance between RIS and Rx (check the paper)

FSPL_Tx_RIS = 20*log10(dist_Tx_RIS) + 20*log10(freq) + 20*log10(4*pi/(c));
FSPL_RIS_Rx = 20*log10(dist_RIS_Rx) + 20*log10(freq) + 20*log10(4*pi/(c));

P_r_partitioning =  P_t + G_t - FSPL_Tx_RIS + RIS_ES0030 + RIS_ES0060_30 - FSPL_RIS_Rx + G_r - Sys_Loss;
