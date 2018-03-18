function xyd(xx, m, y, n)
global n1 nexp l iq iu iv;
iw = iw = ones(n,1);
n1 = n-1;
nexp = 2^n;
r=0.5;
r1=1;
x=0;
it=0;
for j = 1:m
    r = r*0.5;
    for i = 1:n
        if y(i) < 0
            iu(i) = -1;
        else
            iu(i) = 1;
        end
        y(i) = y(i) - r*iu(i);
        iu(i) = iu(i) *iw(i);
    end
    i = iu(1);
    iu(1) = iu(it);
    iu(it) = i;
    numbr(is);
    i = iv(1);
    iv(1) = iv(it);
    iv(it) = i;
    for i=1:n
        iw(i) = -iw(i)*iv(i);
        if l==0
            l=it;
        elseif l == it
            l=0;
        end
        it = 1;
        r1 = r1/nexp;
        x = x+r1*is;
    end
    xx=x;
end
end
end