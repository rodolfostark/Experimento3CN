// A matriz A sempre tem que ser triangular! Sempre!
// Mas não precisa ser superior ou inferior

function x = resret (A, b)    //A é a minha matriz de coeficientes. 
                            //b é minha matriz de termos independenets.
[L, C] = size(A);           //L = quantidade de linhas; C = quantidade de colunas.

if apenasUm(A)>1 then //se a última linha da matriz não possui apenas um termo diferente de zero, sendo ela triangular, implica que ela é triangular inferior
    [A,b] = perm(A,b); 
else
    A = A;
end

for i = L: -1 : 1 //variamos da quantidade máxima de linhas até a primeira linha (estamos indo de baixo para cima).
    soma = 0; //inicializando o acumulador!
    
    for j = i+1 : C //Não entra na primeira iteração! Por isso que o algoritmo dá certo!
        soma = soma + A(i,j)*x(j);//Não usamos j=i+1 porque podemos mais de uma coluna(?)
    end
    
    x(i) = (b(i) - soma) / A(i, i); //estamos dividindo por A(i,i) porque o denominador é sempre o coeficiente da posição i,i da minha matriz A!
end
endfunction

// Para mais informações do método aqui utilizado, consultar:
//<https://en.wikipedia.org/wiki/Permutation_matrix>
//<https://en.wikipedia.org/wiki/LU_decomposition#LU_factorization_with_partial_pivoting>
//<https://www.ime.unicamp.br/~valle/Teaching/2015/MS211/Aula7.pdf>, slide 10
function [PA,Pb] = perm(A,b) // a matriz PA é o produto entre a matriz A e a matriz de permutação P


    P = eye(L, C); // gerando uma matriz identidade com as mesmas dimensões de A


// precisamos permutar as linhas até o meio da matriz
// assim, o loop vai terminar em pontos diferentes, se a quantidade de linhas forem impares ou pares
    if modulo(L,2)==0 then
        meio = L/2;
    else
        meio = (L/2)-0.5;
    end
    // P virá a se tornar a matriz de permutação P
    //Aqui irei gerar minha matriz de permutação
    for k=1:1:meio // o loop de troca vai até o meio da matriz
            aux = P(k,:); // auxiliar recebe a linha que receberá a linha k
            P(k,:) = P(L-k+1,:); // a linha L-k+1 vai para linha k (linha no fim da matriz)
            P(L-k+1,:) = aux; // linha no fim da matriz recebe a linha k, através do auxiliar
    end
    // gerada a matriz de permutação, basta multiplicá-la por A.
    PA = P*A; // essa instrução permuta as linhas da matriz A de forma a torná-la triangular superior
    Pb = P*b; // multiplicando o vetor b pela matriz de permutação, ele também vai ter suas coordenadas permutadas
endfunction

// é preciso saber se a última linha possui apenas um termo não nulo
function flag = apenasUm (A)
    flag = 0;
    for o=1:1:C
        if A(L,o)~=0 then
            flag = flag +1;
        end
    end
endfunction
