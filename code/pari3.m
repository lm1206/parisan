function [v1,v2] = pari3( s,t,d,st,B,model)
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
a=pa(r,q,s,dt,ds,model);
b=pb(r,s,dt,ds,model);
c=pc(r,q,s,dt,ds,model);
for i=nt-1:-1:1
    v1(1,i)=v1(1,i+1)+(2*a(1)+b(1))*v1(1,i+1)+(c(1)-a(1))*v1(2,i+1);
    for j=2:ns1-1
        v1(j,i)=v1(j,i+1)+a(j)*v1(j-1,i+1)+b(j)*v1(j,i+1)+c(j)*v1(j+1,i+1);
    end
    for k=nd-1:-1:1
        v2(ns2,i,k)=v2(ns2,i+1,k+1)+(2*c(ns1+ns2)+b(ns1+ns2))*v2(ns2,i+1,k+1)-(c(ns1+ns2)-a(ns1+ns2))*v2(ns2-1,i+1,k+1);
        for j=2:ns2-1
        v2(j,i,k)=v2(j,i+1,k+1)+a(ns1+j)*v2(j-1,i+1,k+1)+b(ns1+j)*v2(j,i+1,k+1)+c(ns1+j)*v2(j+1,i+1,k+1);
        end
        v2(1,i,k)=v2(1,i+1,k+1)+a(ns1+1)*v1(ns1,i+1)+b(ns1+1)*v2(1,i+1,k+1)+c(ns1+1)*v2(1,i+1,k+1);
    end
    v1(ns1,i)=v1(ns1,i+1)+a(ns1)*v1(ns1-1,i+1)+b(ns1)*v1(ns1,i+1)+c(ns1)*v2(1,i+1,1);
   
end
