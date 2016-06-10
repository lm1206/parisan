function v = pari5( s,t,d,st,B,model)
ns=length(s);
nt=length(t);
nd=length(d);
ds=s(2)-s(1);
dt=t(2)-t(1);
s1=s(1):ds:B;
r=0.05;
q=0;
ns1=length(s1);
v=zeros(ns,nt,nd);
for i=1:nd-1
    v(:,nt,i)=st;
end
for i=nt-1:-1:1
    a=pa(r,q,s,t(i),dt,ds,model);
    b=pb(r,s,t(i),dt,ds,model);
    c=pc(r,q,s,t(i),dt,ds,model);
    aa=-a;aa(ns)=c(ns)-a(ns);
    bb=1-b;bb(1)=1-2*a(1)-b(1);bb(ns)=1-2*c(ns)-b(ns);
    cc=-c;cc(1)=a(1)-c(1);
    for d=1:nd-1
    v(:,i,d)=chase(aa,bb,cc,[v(1:ns1,i+1,d);v(ns1+1:ns,i+1,d+1)]);
    end
end
