function [G] = konvolusi(F, H)
% KONVOLUSI Melakukan konvolusi kernel H dengan citra F
%     H harus mempunyai tinggi dan lebar ganjil
%     Hasil: citra G

[tinggi_f, lebar_f] = size(F);
[tinggi_h, lebar_h] = size(H);

m2 = floor(tinggi_h/2);
n2 = floor(lebar_h/2);

F2=double(F);
for y=m2+1 : tinggi_f-m2
    for x=n2+1 : lebar_f-n2
        % Pelaksanaan konvolusi F(baris, kolom)
        jum = 0;
        for p=-m2 : m2
            for q=-n2 : n2
                jum = jum + H(p+m2+1,q+n2+1) * ...
                      F2(y-p, x-q);
            end
        end
        
        G(y-m2, x-n2) = jum;
    end
end
   
