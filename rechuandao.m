function   u= rechuandao(f,p,q,c,h,k,n,m)
%求一维热传导温度u(x,t)
%c^2=K/(sigma*rou):热扩散系数
%K为导热率，sigma为热容，rou为杆密度
%u(0,t)=p(t),u(a,t)=q(t);u(x,0)=f(x)
%h为杆长步长，n为杆的节点数，t为时间步长，m为时间节点数
r=c^2*k/h^2,x=0:h:(n-1)*h;t=0:k:(m-1)*k;
f=fcnchk(f);p=fcnchk(p);q=fcnchk(q);
u(1,1:m)=p(t);u(n,:)=q(t);
u(:,1)=f(x');
plot(u(:,1)),pause,
for j=1:m-1
    for i=2:n-1
        u(i,j+1)=(1-2*r)*u(i,j)+r*(u(i-1,j)+u(i+1,j));
    end
    plot(u(:,j)),pause
end
mesh(u),
pause
surf(u),
pause
contour3(u)