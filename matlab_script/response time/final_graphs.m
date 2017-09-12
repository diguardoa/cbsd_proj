%% Confronto zoommato
clear all; close all;

load('vec_mean_1cpu.mat'); load('vec_mean_2cpu.mat'); load('hyp_confronto.mat');

plot(vec_mean_1cpu(:,1),vec_mean_1cpu(:,2));
hold on;
plot(vec_mean_2cpu(:,1),vec_mean_2cpu(:,2));
plot(hyp_confronto(:,1), hyp_confronto(:,2));

legend('comp scenario', 'base scenario');
xlabel('rate [Hz]');
ylabel('rt [ms]')

%% Confronto non zoommato
clear all; close all;

load('vec_mean_large_1cpu.mat'); load('vec_mean_large_2cpu.mat'); load('hyp_confronto_large.mat');
subplot(1,2,1);
plot(vec_mean_large_cpu1(:,1),vec_mean_large_cpu1(:,2));
hold on;
plot(vec_mean_large_cpu2(:,1),vec_mean_large_cpu2(:,2));
plot(hyp_confronto(:,1), hyp_confronto(:,2));
legend('rt comp', 'rt base', 'conversion line');
xlabel('rate (Hz)');
ylabel('t [ms]');
%% Add error

load('error_acqui_large_cpu1.mat'); load('error_acqui_large_cpu2.mat');
subplot(1,2,2);
plot(error_acqui_cpu1(:,1), error_acqui_cpu1(:,2));
hold on;
plot(error_acqui_cpu2(:,1), error_acqui_cpu2(:,2));
legend( 'err comp', 'err base');
xlabel('rate (Hz)');
ylabel('#');

