function v=price2(s,t,d,st,v0)
ns=length(s);
nt=length(t);
nd=length(d);
dt=t(2)-t(1);
v=zeros(ns,nt,nd);
for i=1:nd-1
    v(:,nt,i)=st;
end
for i=nt-1:-1:1
    for j=nd-1:-1:1
        v(:,i,j)=v(:,i+1,j+1)+dt*L2(v(:,i+1,j+1),v0(i));
    end
end




