function [v1,v2] = pari4( s,t,d,st,B,model)
ns=length(s);
nt=length(t);
nd=length(d);
ds=s(2)-s(1);
dt=t(2)-t(1);
s1=s(1):ds:B;
s2=B+ds:ds:s(ns);
r=0.05;
q=0;
ns1=length(s1);
ns2=length(s2);
v1=zeros(ns1,nt);
v2=zeros(ns2,nt,nd);
v1(:,nt)=st(1:ns1);
for i=1:nd-1
    v2(:,nt,i)=st(ns1+1:ns);
end
for i=nt-1:-1:1
    a=pa(r,q,s,t(i),dt,ds,model);
    b=pb(r,s,t(i),dt,ds,model);
    c=pc(r,q,s,t(i),dt,ds,model);
    aa=-a;aa(ns)=c(ns)-a(ns);
    bb=1-b;bb(1)=1-2*a(1)-b(1);bb(ns)=1-2*c(ns)-b(ns);
    cc=-c;cc(1)=a(1)-c(1);
    v=chase(aa,bb,cc,[v1(:,i+1);v2(:,i+1,2)]);
    v1(:,i)=v(1:ns1);
    v2(:,i,1)=v(ns1+1:ns);
    for d=2:nd-1
        vx=chase([0,aa(ns1+1:ns)],[1,bb(ns1+1:ns)],[0,cc(ns1+1:ns)],[v1(ns1,i);v2(:,i+1,d+1)]);
        v2(:,i,d)=vx(2:ns2+1);
    end
end