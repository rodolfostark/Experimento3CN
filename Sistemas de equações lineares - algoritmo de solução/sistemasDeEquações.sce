function x = resret (A, b)    //A é a minha matriz de coeficientes. 
                            //b é minha matriz de termos independenets.
[L, C] = size(A);           //L = quantidade de linhas; C = quantidade de colunas.

for i = L: -1 : 1 //variamos da quantidade máxima de linhas até a primeira linha (estamos indo de baixo para cima).
    soma = 0; //inicializando o acumulador!
    
    for j = i+1 : C //Não entra na primeira iteração! Por isso que o algoritmo dá certo!
        soma = soma + A(i,j)*x(j);//Não usamos j=i+1 porque podemos mais de uma coluna(?)
    end
    
    x(i) = (b(i) - soma) / A(i, i); //estamos dividindo por A(i,i) porque o denominador é sempre o coeficiente da posição i,i da minha matriz A!
end


endfunction
