///////POSIÇÂO/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





x_azul = [708 574 571 570]
y_azul = [528 520 520 519]

x_vermelha = [603 423 417 396]
y_vermelha = [481 394 394 385]

x_verde = [636 1225 1242 1273]
y_verde = [468 420 426 438]

tempo = [2.008 2.976 3.013 3.095]









///////////ANGULOS/////////////////////////////////////////////////////////////////////////////////////////////////////////////////







x_azul = [708 574 571 570]
y_azul = [528 520 520 519]

x_vermelha = [603 423 417 396]
y_vermelha = [481 394 394 385]

x_verde = [636 1225 1242 1273]
y_verde = [468 420 426 438]

tempo = [2.008 2.976 3.013 3.095]










//////////////////////Calculadora de velocidades///////////////////////////////////////////////////////////////////////////////////







//iremos concatenar os vetores e usaremos apenas as colunas relativas às duas primeiras fotos
X = [x_vermelha(:,[1,2]); x_verde(:,[1,2]); x_azul(:,[1,2])]; //concatenação dos vetores x em uma única matriz X de forma a facilitar as operações
Y = [y_vermelha(:,[1,2]); y_verde(:,[1,2]); y_azul(:,[1,2])] //concatenação dos vetores y em uma única matriz Y de forma a facilitar as operações

[nl,nc] = size(X);

//inicializando vetor que recebe as velocidades médias de cada esfera.
//Sua unidade é unidades_de_comprimento/segundos
vetorVelocidades = zeros(3,1)

/*  Perceba que cada esfera percorreu um dado caminho que pode ser calculado 
utilizando-se o tamanho de uma hipotenusa (dado que temos duas posições no espaço
bidimensional) e o tempo necessário para cruzar-se esse comprimento.
*/

tt = tempo(2) - tempo(1) //tempo transcorrido
for i=1:1:nl
    x = X(i,2) - X(i,1);
    y = Y(i,2) - Y(i,1);
    comprimento = sqrt(x*x + y*y);
    vetorVelocidades(i) = comprimento/tt;
end
/*
Resultado encontrado: vetorVelocidades = [206.53149 610.48824 138.67623]
o primeiro item refere-se à esfera vermelha, o segundo à verde e a última 
à azul.
*/









/////Fatoração LU/////////////////////////////////////////////////////////////////////////////////////////////////////////////////










function [L, U] = fatoracaoLU(A)//LEMBRAR QUE A DEVE SER QUADRADA!
    [numLinhas, numColunas] = size(A); //pega as dimensões da matriz
    
    // caso a matriz A tenha o elemento (1,1) igual a 0, preciso trocar as linhas
    // de forma que o primeiro elemento da linha não seja nulo. E caso eu troque 
    // as linhas, preciso trocar os elementos do vetor b.
    
    if A(1,1)==0 then 
        A = permutacaoSimples(A);//perm(A) é o produto entre a matriz de permutação P e a matriz A
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







////Permutação simples///////////////////////////////////////////////////////////////////////////////////////////////////////








// Para mais informações do método aqui utilizado, consultar:
//<https://en.wikipedia.org/wiki/Permutation_matrix>
//<https://en.wikipedia.org/wiki/LU_decomposition#LU_factorization_with_partial_pivoting>
//<https://www.ime.unicamp.br/~valle/Teaching/2015/MS211/Aula7.pdf>, slide 10

function PA = permutacaoSimples(A) // a matriz PA é o produto entre a matriz A e a matriz de permutação P
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









///////Solução do sistema/////////////////////////////////////////////////////////////////////////////////////////////////










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










/////////////////////////Nova solução do sistema///////////////////////////////////////////////////////////////////////////////////








//Serão implementadas uma resoução para cada esfera colorida
//calculando os coeficientes da matriz A

//vetor de angulos r g b
// cada ângulo é a média dos ângulos das esferas
theta = [0.7315185 0.4320206 0.705154]

// matriz A do sistema
A_sis = [0 -1*cos(theta(1)) vetorVelocidades(1)*sin(theta(1))*cos(theta(1)); sin(theta(2)) -1*cos(theta(2)) 0; sin(theta(3)) 0 -1*vetorVelocidades(3)*theta(3)*cos(theta(3))];

// vetor b do sistema
b_sis = [-1*cos(theta(1))*y_vermelha(2)+vetorVelocidades(1)*sin(theta(1))*cos(theta(1))*tempo(2); sin(theta(2))*x_verde(2)-cos(theta(2))*y_verde(2); sin(theta(3))*x_azul(2)-vetorVelocidades(3)*sin(theta(3))*cos(theta(3))*tempo(2)];

[L, U] =  fatoracaoLU(A_sis);
y = resret (L, b_sis);
solucao = resret (U, y); 
