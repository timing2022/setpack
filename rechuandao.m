function   u= rechuandao(f,p,q,c,h,k,n,m)
%��һά�ȴ����¶�u(x,t)
%c^2=K/(sigma*rou):����ɢϵ��
%KΪ�����ʣ�sigmaΪ���ݣ�rouΪ���ܶ�
%u(0,t)=p(t),u(a,t)=q(t);u(x,0)=f(x)
%hΪ�˳�������nΪ�˵Ľڵ�����tΪʱ�䲽����mΪʱ��ڵ���
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