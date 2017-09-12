%% Import CPU2
clear all; close all;
j = 0;
for rate=200:10:500
    conn = rate*5;
    j = j+1;
    a(j,:) = zeros(1,60);
    b(j)=rate;
    error_total(j)=0;
    error_acqui(j)=0;
    freq_error(j) = 0;
    hyp_confronto(j,:) = [rate, 1000/(rate)];
    for i=1:30
%         a(j,i)=importfile(strcat('../cpu1_rate',int2str(rate),'_conn',int2str(conn), ...
%             '/rfs_190_',int2str(i),'.txt'));
%         a(j,i+30)=importfile(strcat('../cpu1_rate',int2str(rate),'_conn',int2str(conn), ...
%             '/rfs_191_',int2str(i),'.txt'));
        
        temp_190=importfile1(strcat('../cpu2_rate',int2str(rate),'_conn',int2str(conn), ...
            '/rfs_190_',int2str(i),'.txt'));
        
        temp_error1 = temp_190(1,1) - temp_190(1,2);
        temp_freq_error1 = temp_190(2,1) + temp_190(2,2);
        
        a(j,i) =temp_190(3,1);
        
        temp_191=importfile1(strcat('../cpu2_rate',int2str(rate),'_conn',int2str(conn), ...
                '/rfs_191_',int2str(i),'.txt'));
        
        temp_error2 = temp_191(1,1) - temp_191(1,2);
        temp_freq_error2 = temp_191(2,1) + temp_191(2,2);
        
        a(j,i+30) =temp_191(3,1);
        
        if (temp_error2 ~= 0) 
            error_acqui(j) = error_acqui(j)+1;
            error_total(j) = error_total(j) + temp_error2;
%             a(j,i+30) = NaN;
        else
            if (temp_freq_error2 ~= 0)
%                 a(j,i+30) = NaN;
                freq_error(j) = freq_error(j) + 1;
            end
        end
        
        if (temp_error1 ~= 0) 
            error_acqui(j) = error_acqui(j)+1;
            error_total(j) = error_total(j) + temp_error1;
%             a(j,i) = NaN;
        else
            if (temp_freq_error1 ~= 0)
%                 a(j,i) = NaN;
                freq_error(j) = freq_error(j) + 1;
            end
        end
        
       
        % "basta uno dei due per segare i valori"
%         if ((temp_freq_error1+temp_freq_error2) ~= 0)
%            a(j,i) = NaN;
%            a(j,i+30) = NaN;
%         end
%         if ((temp_error1 + temp_error2) ~= 0)
%             a(j,i) = NaN;
%             a(j,i+30) = NaN;
%         end
    end
end
vec_mean = [b', nanmean(a,2)];
vec_error_total = [b', error_total'];
vec_error_acqui = [b', error_acqui'];
vec_error_freq = [b', freq_error'];
plot(vec_mean(:,1),vec_mean(:,2));
hold on;
% legend('one cpu','freq error one cpu','two cpu','curva confronto','freq error two cpu');
plot(vec_error_acqui(:,1), vec_error_acqui(:,2));
plot(hyp_confronto(:,1), hyp_confronto(:,2));

plot(vec_error_freq(:,1), vec_error_freq(:,2));
% plot(vec_error_total(:,1), vec_error_total(:,2));

legend('2 cpu', 'errors', 'physical limit', 'delays');
xlabel('rate (Hz)');
ylabel('t [s] | #');