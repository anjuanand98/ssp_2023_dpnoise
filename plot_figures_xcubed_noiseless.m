% figures: noiseless gaussian, (x^3-y)^2
clc;
close all;
clear all;
Mval=[2 4 8 16 32 64 128 256];
enc_dist=zeros(1,length(Mval));
dec_dist=zeros(1,length(Mval));
for M=Mval
    Mind=find(M==Mval);
load(strcat('xcubed_noiseless_fmincon1_dataM',num2str(M),'.mat'));
enc_dist(Mind)=e_opt;
dec_dist(Mind)=d_opt;
end

stle=strings(1,2);
f=figure;
plot(log(Mval)/log(2),enc_dist,'--o','LineWidth',2.0,'Markersize',15);
stle(1)="encoder distortion";
hold on;
plot(log(Mval)/log(2),dec_dist,'--^','LineWidth',2.0,'Markersize',15);
stle(2)="decoder distortion";
hold off;
grid on;
xlim=[1,8];
lgd=legend(stle);
lgd.FontSize=14;
ax = gca;
ax.FontSize = 14; 
xlabel('rate (in bits)','FontSize',14)
ylabel('encoder distortion','FontSize',14)
saveas(f,strcat('encdist_xcubed_noisy.png'))
saveas(f,strcat('encdist_xcubed_noisy.fig'))