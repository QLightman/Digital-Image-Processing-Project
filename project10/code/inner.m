function [a,b]=inner(bi)
[m,n]=size(bi);
a=floor(n/2);
line=bi(a,:);
e=find(line==1);
c=diff(e);
d=find(c~=1);
b=e(d(1));
end