beta=0.1;
k2=100;

Out=[];

for(k1=logspace(-2,2,50))

Test=[];

dtFunmRNA_P = @(t,x) [beta-x(1)-k2*x(1)*x(3) ; beta-x(2)-k2*x(2)*x(3) ; k1-x(3)- k2*x(1)*x(3)- k2*x(2)*x(3)];

[t1,x1] = ode45(dtFunmRNA_P, [0 200], [0.1 0.1 0.1]);

Off=x1(end,1);

clear x1
clear t1

dtFunmRNA_P = @(t,x) [1-x(1)-k2*x(1)*x(3) ; 1-x(2)-k2*x(2)*x(3) ; k1-x(3)- k2*x(1)*x(3)- k2*x(2)*x(3)];

[t1,x1] = ode45(dtFunmRNA_P, [0 200], [0.1 0.1 0.1]);

On=x1(end,1);

clear x1
clear t1

Out=[Out On/Off];

end

p=loglog(logspace(-2,2,50),Out)
p.LineWidth=3
xlabel('k_1/k_2')
ylabel('On/Off Ratio')
title('Theoretical On/Off Ratio vs. k_1/k_2')
fontsize(16,"points")

