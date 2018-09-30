
function [x, flag] = testeConvergenciaColunas(A)
    [l, c] = size(A);
    x = zeros(c, 1);
    for i=1:c
        soma = 0;
        for j=1:l
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
