[t,x] = ode45(@HGO,[0,10],[-1,-2 0 0])
plot(t,x)
grid on 
legend('x1','x2','xh1','xh2')
figure(2)
plot(t,x(:,1)-x(:,3))
hold on 
plot(t,x(:,2)-x(:,4),'r')