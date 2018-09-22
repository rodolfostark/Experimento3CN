function [L, U] = fatoracaoLU(A)//LEMBRAR QUE A DEVE SER QUADRADA!
    [numLinhas, numColunas] = size(A); //pega as dimensões da matriz
    
    L = zeros(size(A)); //Criando minha matriz L completamente zerada, para posteriormente ser preenchida com os fatores.
    
    for i=1:1:numLinhas //vou percorrer apenas a quantidade de elementos da diagonal principal.
        L(i,i) = 1;//Aqui eu adiciono os termos 1 da diagonal principal de minha matriz L.
    end
    
    //MINHA FABRICAÇÃO DA MATRIZ U COMEÇA AQUI!
    aux = A;//Não quero que minha matriz A seja modificada, por isso usarei uma auxiliar.
    
    //Meu primeiro for serve para a atribuição de meu pivô!
    for i=1:1:numLinhas-1 //o valor da última linha nunca será pivô para elementos mais abaixo (já que é o último elemento)!
        
        pivo = aux(i,i); //o pivô é sempre meu termo da diagonal principal
        
        //começo da linha que está abaixo do meu i-ésimo pivô, por isso j=i+1 !
        for  j=i+1:1:numColunas
            fator = aux(j,i)/pivo; //aqui calculo meu fator que irá tanto participar na eliminação como em achar os termos de L!
            
            aux(j,:) = aux(j,:) - fator*aux(i, :); //eu subtraio da linha que varia, a linha do meu pivô atual!
            
            L(j,i) = fator; //aqui atribuo o devido elemento a minha matriz L.
        end
    end
    
    U = aux;
    
endfunction
