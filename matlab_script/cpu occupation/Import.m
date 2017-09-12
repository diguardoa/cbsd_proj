clear all; close all;
j = 0;
for rate=200:10:500
    j=j+1;
    x_ax(j)=rate;
    
    % import base
    cpu1_workload_t = importcpu1(strcat('../workload_cpu2/',int2str(rate),'.txt'),4,30);
    cpu1_w(j) = mean(cpu1_workload_t(:,1) + cpu1_workload_t(:,2));
    cpu2_workload_t = importcpu2(strcat('../workload_cpu2/',int2str(rate),'.txt'),4,30);
    cpu2_w(j) = mean(cpu2_workload_t(:,1) + cpu2_workload_t(:,2));

    % import comp
    cpuc_workload_t = importcpu1(strcat('../workload_cpu1/',int2str(rate),'.txt'),4,40);
    cpuc_w(j) = mean(cpuc_workload_t(:,1) + cpuc_workload_t(:,2));

    
end



%%
clear all; close all;
load cpu_workload.mat

plot(x_ax',cpu1_w'); hold on; 
plot(x_ax',cpu2_w');
plot(x_ax',(cpu1_w + cpu2_w)');
plot(x_ax',cpuc_w');
plot(x_ax',100*ones(size(x_ax,2)));
xlabel('rate [Hz]');
ylabel('CPU occupation [%]');
legend('base CPU1','base CPU2','base (sum)','comp');