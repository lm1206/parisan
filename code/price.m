function v=price(s,t,st)
ns=length(s);
nt=length(t);
dt=t(2)-t(1);
v=zeros(ns,nt);
v(:,nt)=st;
for i = nt-1:-1:1
    v(:,i)=v(:,i+1)+dt*L(v(:,i+1));
end