function numbr(iss)
global n1 nexp l iq iu iv;
n=n1+1;
iff = nexp;
is=0;
k1=-1;
for i = 1:n
    iff = iff/2;
    k2 = -k1*iu(i);
    iv(i) = iu(i);
    k1=k2;
    if k2<0
        l1=i;
    else
        is=is+iff;
        l=i;
    end
end
if (is==0)
    l=n1;
else
    iv(n1) = -iv(n1);
    if is == nexp-1
        l=n1;
    elseif l1==n1
        iv(l) = -iv(l);
    else l=l1
    end
end
iss=is;

end