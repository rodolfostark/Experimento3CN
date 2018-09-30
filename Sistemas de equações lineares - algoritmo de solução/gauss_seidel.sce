function [x, numItera] = gauss_seidel(A, b, x0, e, numIteraMax)//a função vai retornar um vetor solução x e o número de iterações e deve receber o sistema linear A, b e x0, o erro e e o número máximo de iterações
    [l, c] = size(A);
    erro = 1;
    numItera = 0;
    x = x0;
    while  erro > e & numIntera < numIteraMax
        numItera = numItera + 1;
        xa = x;        
        for i=1:l
            soma = 0;
            for j=1:l
                if j ~= i 
                    soma = soma + A(i,j)*x(j)
                end
            end
            x(i) = (b(i) - soma)/A(i, i);
        end
        erro = max(abs(x - xa))/max(abs(x));
    end
endfunction
