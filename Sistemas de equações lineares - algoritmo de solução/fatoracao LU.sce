function [L, U] = fatoracaoLU(A)//LEMBRAR QUE A DEVE SER QUADRADA!
    [numLinhas, numColunas] = size(A); //pega as dimensões da matriz
    
    // caso a matriz A tenha o elemento (1,1) igual a 0, preciso trocar as linhas
    // de forma que o primeiro elemento da linha não seja nulo. E caso eu troque 
    // as linhas, preciso trocar os elementos do vetor b.
    
    if A(1,1)==0 then 
        A = perm(A);//perm(A) é o produto entre a matriz de permutação P e a matriz A
    end
    
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


// Para mais informações do método aqui utilizado, consultar:
//<https://en.wikipedia.org/wiki/Permutation_matrix>
//<https://en.wikipedia.org/wiki/LU_decomposition#LU_factorization_with_partial_pivoting>
//<https://www.ime.unicamp.br/~valle/Teaching/2015/MS211/Aula7.pdf>, slide 10
function PA = perm(A) // a matriz PA é o produto entre a matriz A e a matriz de permutação P
    P = eye(numLinhas, numColunas); // gerando uma matriz identidade com as mesmas dimensões de A
    // P virá a se tornar a matriz de permutação P
    //Aqui irei gerar minha matriz de permutação
    for k=2:1:numLinhas // precisa-se achar algum elemento A(?,1) não nulo em todas as linhas da matriz
        if A(k,1)~=0 then // se o elemento A(k,1) não for nulo, ele precisará ser jogado para a primeira linha
            aux = P(k,:); // auxiliar recebe a linha que receberá a primeira linha
            P(k,:) = P(1,:); // a primeira linha vai para linha k
            P(1,:) = aux; // linha 1 recebe a linha k, através do auxiliar
            break         // havendo trocado as linhas, não há necessidade de continuar o laço
        end
    end
    // gerada a matriz de permutação, basta multiplicá-la por A.
    PA = P*A;
endfunction
