%map y to x
%y(x), 1 -center, 2 - line, 3 - node
function []=mapd(x, m, y, n, key)
global n1 nexp l iq iu iv;
iw = ones(n,1);
iu = zeros(10,1);
iv = zeros(10,1);
y = zeros(n,1);
p = 0;
n1 = n-1;
nexp = 2^n;
d = x;
r=0.5;
it=1;
dr = nexp;
mne = dr^m;
if key == 2
    d = d*(1-1/mne);
    k=0;
elseif key > 2
    dr = mne/nexp;
    dr = dr-fmod(dr,1);
    dd = mne-dr;
    dr = dd * d;
    dd = dr-fmod(dr, 1);
    dr = dd+(dd -1)/(nexp-1);
    dd = dr - fmod(dr, 1);
    d = dd*(1/mne);
end
for j = 1:m
    iq = 0;
    if x == 1
        is = nexp-1;
        d = 0;
    else
        d = d*nexp;
        is = d;
        d = d-is;
    end
    i = is;
    node(i, n1);
    i = iu(1);
    iu(1) = iu(it);
    iu(it) = i;
    i = iv(1);
    iv(1) = iv(it);
    iv(it) = i;
    if l == 0
        l = it;
    elseif l == it
        l = 0;
    end
    if (iq > 0) || ((iq==0) && (is ==0))
        k=l;
    elseif iq < 0
        if it ==n1
            k = 0;
        else
            k = n1;
        end
    end
    r = r*0.5;
    it = l;
    for i=1:n
        iu(i) = iu(i)*iw(i);
        iw(i) = -iv(i)*iw(i);
        p = r*iu(i);
        p = p+y(i);
        y(i) = p;
    end
end
if key == 2
    if is == nexp-1
        i=-1;
    else 
        i=1;
    end
    p=2*i*iu(k)*r*d;
    p = y(k)-p;
    y(k) = p;
elseif key==3
    for i=1:n
        p = r*iu(i);
        p = p+y(i);
        y(i)=p;
    end
end
    
end

