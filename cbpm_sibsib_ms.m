% cbpm_sibsib_ms
% Crossing Detection

ep = 0.01;
%clear all
%x=[1:4]';
%y1 = [90.80 94.76 89.07 89.03];
%y2 = [0.14 15.48 1.88 104.63];%/60;


%y2 = exp(y2);
%y2=log(y2);    

n = length(x);

alpha0 = min(y1);
alpha1 = max(y1);
beta0 = min(y2);
beta1 = max(y2);

Del0 = abs(alpha0-alpha1);
Del1 = abs(beta0-beta1);


ph0 = (1-ep)/Del0*(alpha1-y1)+ep;
ph1 = (1-ep)/Del1*(beta1-y2)+ep;

%ph0 = (1-ep)/Del0*(y1-alpha0)+ep;
%ph1 = (1-ep)/Del1*(beta1-y2)+ep;
%ph0 = (1-ep)/Del0*(y1-alpha0)+ep;
%ph1 = (1-ep)/Del1*(y2-beta0)+ep;

%ph0 = exp(ph0);
%ph1=exp(ph1);    


%ph0 = 1/Del0*(y1-alpha1);
%ph1 = 1/Del1*(beta0-y2);


PH = ph0.*ph1;


[a i]=max(PH);
[a j]=min(PH);
%%%%%%%%%%%%%%%%
x=x/60;
tle = ['CBPM Optmization'];
x_lb = ['Performance parameter (x) [hour]'];
y_lb = ['Performance measure ratio'];
lgnd_1 = ['phi_{0}(x) from frequency (SIB)'];
lgnd_2 = ['phi_{1}(x) from MSE (SIB)'];
lgnd_3 = ['Psi(x) = phi_{0} x phi_{1}; CBPM Objective'];
%lgnd_4 = ['Optimal (x* = ' num2str(x(j),'%.2f') ')'];
lgnd_4 = ['Optimal (x* = ' num2str(x(i),'%.1f') ' [hr])'];
%lgnd_4 = ['Optimal (x* = ' num2str(x(i)) ')'];


%%%%%%%%%%%%%%%%
figure
hold on
grid on

%title(tle);
xlabel(x_lb);
ylabel(y_lb);

plot(x,[ph0],'Color',[0.4660 0.6740 0.1880]);
plot(x,[ph1],'Color',[0.8500 0.3250 0.0980]);
%plot(x,PH,'LineWidth',2,'Color',[0.4940 0.1840 0.5560]);
plot(x,PH,'LineWidth',2,'Color',[0.4940 0.1840 0.5560]);
%plot(x(j),PH(j)-0.05,'r^','MarkerSize',8,'MarkerFaceColor','r');
plot(x(i),PH(i)+0.1,'rv','MarkerSize',8,'MarkerFaceColor','r');

%legend(lgnd_1,lgnd_2,lgnd_3, lgnd_4, 'location', 'southwest');
legend(lgnd_1,lgnd_2,lgnd_3, lgnd_4, 'location', 'south');
hold off

%figure
%plot(x,[PH]);

x_star = x(i)
%x_star_SIB = x(j)