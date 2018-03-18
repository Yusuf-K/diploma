    %calculate iu=u[s], iv = v[s], l=l[s] by is=s
function []=node(is)
   global n1 nexp l iq iu iv;
   n = n1+1;
   if is == 0
       l = n1;
       iu = zeros(n,1) - ones(n,1);
       iv = zeros(n,1) - ones(n,1);
   elseif is == nexp-1
       l = n1;
       iu(1) = 1;
       iv(1) = 1;
       for i=2:n
           iu(i) = -1;
           iv(i) = -1;
       end
       iv(n1) = 1;
   else
       iff = nexp;
       k1=-1;
       for i = 1:n
           iff=iff/2;
           if is>=iff
               if (is==iff)&&(is~=1)
                   l=i;
                   iq=-1;
               end
               is=is-iff;
               k2=1;
           else
               k2=-1;
               if (is == iff-1) && (is~=0)
                   l=i;
                   iq=1;
               end
           end
           j=-k1*k2;
           iv(i)=j;
           iu(i)=j;
           k1=k2;
       end
       iv(l)=iv(l)*iq;
       iv(n1)=-iv(n1);
   end
end