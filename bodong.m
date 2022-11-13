function   u= bodong(f,g,c,h,k,n,m)
%求一维弦振动幅度u(x,t)
%c^2=T/rou,T为张力，rou为弦密度
%u(0,t)=0,u(a,t)=0;%u(x,0)=f(x),ut(x,0)=g(x)
%h为弦长步长，n为弦的节点数，t为时间步长，m为时间节点数
r=c*k/h,x=0:h:(n-1)*h;t=0:k:(m-1)*k;
f=fcnchk(f);g=fcnchk(g);
u(1,1:m)=0;u(n,:)=0;
u(:,1)=f(x');
plot(x, u(:,1)'),axis([0 1 -2 2]),pause,hold on 
u(2:n-1,2)=(1-r^2)*f(x(2:n-1)')+k*g(x(2:n-1)')+r^2/2*(f(x(3:n)')+f(x(1:n-2)'));
plot(x,u(:,2)'),axis([0 1 -2 2]),pause
for j=2:m-1
    for i=2:n-1
        u(i,j+1)=(2-2*r^2)*u(i,j)+r^2*(u(i+1,j)+u(i-1,j))-u(i,j-1);
    end
    plot(x,u(:,j+1)'),axis([0 1  -2 2]),pause
end
hold off
surf(u)
