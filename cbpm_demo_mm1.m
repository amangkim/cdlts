% cbpm_demo_case1_r01

% cbpm_demo_002
% CNN Measure for 

clear all

ep = 0.01;

x=[1:0.01:8]';

y1 = (.6).^(x/1000);
y2 = 2*(x/10).^2;

%y2 = (2).^x;

n = length(x);

alpha0 = y1(1);
alpha1 = y1(n);
beta0 = y2(1);
beta1 = y2(n);

%Del0 = abs(y1(1)-y1(n));
%Del1 = abs(y2(n)-y2(1));

Del0 = y1(1)-y1(n);
Del1 = y2(n)-y2(1);


%ph0 = (1-ep)/Del0*(y1-alpha1)+ep;
%ph1 = (1-ep)/Del1*(y2-beta0)+ep;


ph0 = 1/Del0*(y1-alpha1);
ph1 = 1/Del1*(y2-beta0);

PH = ph0.*ph1;


[a i]=max(PH);
[a j]=min(PH);
%%%%%%%%%%%%%%%%
tle = ['CNN layer optimization'];
x_lb = ['ML hyper-parameter (x)'];
y_lb = ['Performance measure ratio'];
lgnd_1 = ['rho(x) from accuracy (decreased; BIB)'];
lgnd_2 = ['phi(x) from training time (increased; SIB)'];
lgnd_3 = ['xi(x) = phi x rho; CBPM'];
%lgnd_4 = ['Optimal number of layers (n* = ' num2str(x(i),'%.0f') ')'];
lgnd_4 = ['Optimal (x* = ' num2str(x(i)) ')'];
%%%%%%%%%%%%%%%%
figure
hold on
grid on

%title(tle);
xlabel(x_lb);
ylabel(y_lb);

plot(x,[ph0],'Color',[0.4660 0.6740 0.1880]);
plot(x,[ph1],'Color',[0.8500 0.3250 0.0980]);
plot(x,PH,'LineWidth',2,'Color',[0.4940 0.1840 0.5560]);
%plot(x(i),PH(i)-0.05,'r^','MarkerSize',8,'MarkerFaceColor','r');
plot(x(i),PH(i)+0.05,'rv','MarkerSize',8,'MarkerFaceColor','r');

legend(lgnd_1,lgnd_2,lgnd_3, lgnd_4, 'location', 'north');
hold off

%figure
%plot(x,[y1]);

x_star = x(i)
%x_star_SIB = x(j)
acc = y1(i)
time = y2(i)
