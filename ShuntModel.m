E_T=100
K_m=10
S_0=1

figure()
for(m=1:6)

S_T=logspace(-3,6,73)

SE=((E_T*m+K_m+S_T+S_0)-sqrt((E_T*m+K_m+S_T+S_0).^2-4*m*E_T*(S_T+S_0)))/(2*m)

p=loglog(S_T,SE)
p.LineWidth=3;
hold on
end
legend('m=1','m=2','m=3','m=4','m=5','m=6')
xlim([1e-3 1e4])
ylim([1e-1 200])
xlabel('Input')
ylabel('Output')
title('Effect of Multiple Identical Promoters')
