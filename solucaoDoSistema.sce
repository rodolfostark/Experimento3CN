
clear

exec('path\tabelaComPosicoesDeCadaEsfera.sce');
exec('path\tabelaComAngulosDeCadaEsfera.sce');
exec('path\calculadoraDeVelocidades.sce');
exec('path\Sistemas de equações lineares - algoritmo de solução\fatoracao LU.sce');
exec('path\Sistemas de equações lineares - algoritmo de solução\sistemasDeEquações.sce');

//Serão implementadas uma resoução para cada esfera colorida
//calculando os coeficientes da matriz A

A_vermelha = [0 -1*cos(arcosVermelha(1)) vetorVelocidades(1)*sin(arcosVermelha(1))*cos(arcosVermelha(1)); sin(arcosVermelha(2)) -1*cos(arcosVermelha(2)) 0; sin(arcosVermelha(3)) 0 vetorVelocidades(3)];
b_vermelha = [-1*cos(arcosVermelha(1))*y_vermelha(1)+vetorVelocidades(1)*sin(arcosVermelha(1))*cos(arcosVermelha(1))*tempo(4); sin(arcosVermelha(2))*x_vermelha(2)-cos(arcosVermelha(2))*y_vermelha(2); sin(arcosVermelha(3))*x_vermelha(3)-cos(arcosVermelha(2))*tempo(4)];

[L, U] =  fatoracaoLU(A_vermelha);
y = resret (L, b_vermelha);
solucao_vermelha = resret (U, y); 
// o array x possui as soluções para o sistema de equações para a esfera vermelha, contendo x0, y0 e t0
//agora será reproduzido o processo para as outas esferas
A_azul = [0 -1*cos(arcosAzul(1)) vetorVelocidades(1)*sin(arcosAzul(1))*cos(arcosAzul(1)); sin(arcosAzul(2)) -1*cos(arcosAzul(2)) 0; sin(arcosAzul(3)) 0 vetorVelocidades(3)*sin(arcosAzul(3))*cos(arcosAzul(3))];
b_azul = [-1*cos(arcosAzul(1))*y_azul(1)+vetorVelocidades(1)*sin(arcosAzul(1))*cos(arcosAzul(1))*tempo(4); sin(arcosAzul(2))*x_azul(2)-cos(arcosAzul(2))*y_azul(2); sin(arcosAzul(3))*x_azul(3)-cos(arcosAzul(2))*tempo(4)];

[L, U] =  fatoracaoLU(A_azul);
y = resret (L, b_azul);
solucao_azul = resret (U, y); 

A_verde = [0 -1*cos(arcosVerde(1)) vetorVelocidades(1)*sin(arcosVerde(1))*cos(arcosVerde(1)); sin(arcosVerde(2)) -1*cos(arcosVerde(2)) 0; sin(arcosVerde(3)) 0 vetorVelocidades(3)*sin(arcosVerde(3))*cos(arcosVerde(3))];
b_verde = [-1*cos(arcosVerde(1))*y_verde(1)+vetorVelocidades(1)*sin(arcosVerde(1))*cos(arcosVerde(1))*tempo(4); sin(arcosVerde(2))*x_verde(2)-cos(arcosVerde(2))*y_verde(2); sin(arcosVerde(3))*x_verde(3)-cos(arcosVerde(2))*tempo(4)]; 

[L, U] =  fatoracaoLU(A_verde);
y = resret (L, b_verde);
solucao_verde = resret (U, y);


solucao = [solucao_vermelha solucao_verde solucao_azul]

//solucao = [nan nan nan; nan nan nan; nan nan na];
