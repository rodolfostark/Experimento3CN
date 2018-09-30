clear

exec('C:\Users\mateu\Documents\UFRN\4o_Periodo\Calculo Numerico\GitCN\3oExperimento\Experimento3CN\tabelaComPosicoesDeCadaEsfera.sce');
exec('C:\Users\mateu\Documents\UFRN\4o_Periodo\Calculo Numerico\GitCN\3oExperimento\Experimento3CN\\tabelaComAngulosDeCadaEsfera.sce');
exec('C:\Users\mateu\Documents\UFRN\4o_Periodo\Calculo Numerico\GitCN\3oExperimento\Experimento3CN\calculadoraDeVelocidades.sce');
exec('C:\Users\mateu\Documents\UFRN\4o_Periodo\Calculo Numerico\GitCN\3oExperimento\Experimento3CN\Sistemas de equações lineares - algoritmo de solução\fatoracao LU.sce');
exec('C:\Users\mateu\Documents\UFRN\4o_Periodo\Calculo Numerico\GitCN\3oExperimento\Experimento3CN\Sistemas de equações lineares - algoritmo de solução\sistemasDeEquações.sce');

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
