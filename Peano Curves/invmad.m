%map y to x
%preimages calculation
%- m - map level (number of partitioning)
%- xp - preimages to be calculated
%- kp - number of preimages that may be calculated (size of xp)
%- kxx - number of preimages being calculated
%- p - image for which preimages are calculated
%- n - dimension of image (size of p)
%- incr - minimum number of map nodes that must be between preimages
function [] = invmad(m, xp, kp, kxx, p, n, incr)
global n1 nexp l iq iu iv,del;
kx = 0;
kp=kp-1;
nexp = 2^n;
u = zeros(n,1) - ones(n,1);
dr = nexp;
mne = dr^n;
r = 0.5^n;
dr = mne/nexp;
dr = dr- fmod(dr, 1);
del = 1/(mne-dr);
d1 = del*(incr+0.5);
for kx=-1:kp
    for i=1:n
        d = p(i);
        y(i) = d-r*u(i);
    end
    i = 0;
    while abs(y(i)) < 0.5
        i=i+1;
    end
    if i>= n
        xyd(x,m,y,n);
        dr=x*mne;
        dd=dr-fmod(dr,1);
        dr=dd/nexp;
        dd=dd-dr+fmod(dr,1);
        x=dd*del;
        if kx>kp
            break;
        end
        k = kx+1;
        if kx ==0 
            xp(1) = x;
        else
            while k>=0
                dr = abs(x-xp(k+1));
                if dr<=d1
                    for k = kx-1:kx
                        xp(k)=xp(k+1);
                        m6(n);
                    end
                else
                    if x <=xp(k)
                        xp(k+1) = xp(k);
                        k = k-1;
                    else
                        break;
                    end
                end
            end
            xp(k+1) = x;
        end
    end
    if i<0
        break;
    end
end
kxx = kx + 1;
end
function m6(n)
i = n-1;
while i  >= 0 && u(i) < 0
    if u(i)<=0
        u(i) = 1;
    else
        u(i) = -1;
    end
    i=i-1;
end
end
