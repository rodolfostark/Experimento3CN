function [L, U] = fatoracaoLU(A)//LEMBRAR QUE A DEVE SER QUADRADA!
    [numLinhas, numColunas] = size(A); //pega as dimensões da matriz
    
    L = zeros(size(A)); //Criando minha matriz L completamente zerada, para posteriormente ser preenchida com os fatores.
    
    for i=1:1:numLinhas //vou percorrer apenas a quantidade de elementos da diagonal principal.
        L(i,i) = 1;//Aqui eu adiciono os termos 1 da diagonal principal de minha matriz L.
    end
    
    //MINHA FABRICAÇÃO DA MATRIZ U COMEÇA AQUI!
    
endfunction
