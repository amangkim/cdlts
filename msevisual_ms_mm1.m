% msevisual_ms
%%%%%%%%%%%%%%%%%%%%%%%%%
% MSE visualizing 

[mse_min i_star] = min(MSE);
delta_star = delta(i_star)
mse_min

%%%%%%%%%%%%%%%%

%plot(delta,MSE);
x = delta;
y = MSE;

%%%%%%%%%%%%%%%%
tle = ['M/M/1 Queue Sampling Demo'];
x_lb = ['Sampling duration (delta)'];
y_lb = ['Mean Square Error (MSE)'];
lgnd_1 = ['MSE per sampling duration'];
%lgnd_2 = ['rho(x) from g(x) (decreased)'];
%lgnd_3 = ['xi(x) = phi x rho; CBPM'];
lgnd_2 = ['Optimal (sigma* = ' num2str(x(i_star),'%.3f') ')'];
%lgnd_4 = ['Optimal (x* = ' num2str(x(i)) ')'];
%%%%%%%%%%%%%%%%

figure
hold on
grid on

title(tle);
xlabel(x_lb);
ylabel(y_lb);

%plot(x,y);%,'Color',[0.8500 0.3250 0.0980]);
%bar(x,y);%,'Color',[0.8500 0.3250 0.0980]);
plot(x,y, 'Color', [0.4940 0.1840 0.5560],'LineWidth',1.5);
plot(x(i_star),y(i_star)-(0.4*y(i_star)),'r^','MarkerSize',8,'MarkerFaceColor','r');
%plot(x(i_star),y(i_star)+(0.4*y(i_star)),'rv','MarkerSize',8,'MarkerFaceColor','r');

%plot(x(i),PH(i)-0.05,'r^','MarkerSize',8,'MarkerFaceColor','r');
legend(lgnd_1,lgnd_2, 'location', 'north');
hold off
