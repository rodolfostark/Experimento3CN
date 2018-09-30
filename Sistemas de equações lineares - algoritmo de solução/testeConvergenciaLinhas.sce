function [x, flag] = testeConvergenciaLinhas(A)
    [l, c] = size(A);
    x = zeros(l, 1);
    for i=1:l
        soma = 0;
        for j=1:c
            soma = soma + A(i, j);
        end
        x(i) = soma;    
    end
        if max(abs(x)) < 1 then
            flag = 1;
        else
            flag = -1;
        end
endfunction
