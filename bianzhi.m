function [t,x]=bianzhi(p,q,r,a,b,a_,b_,n)
p=fcnchk(p);q=fcnchk(q);r=fcnchk(r);

h=(b-a)/n;
[t,y]=ode45(@(t,y)[y(2);p(t)*y(2)+q(t)*y(1)+r(t);y(4);p(t)*y(4)+q(t)*y(3)],a:h:b,[a_,0,0,1]);
%[n,m]=size(y);

x=y(:,1)+(b_-y(n+1,1))/y(n+1,3)*y(:,3);
plot(t,y(:,1:2:3),t,x);
xlabel('t')
ylabel('x(t)')
legend('u(t)','v(t)','x(t)');



