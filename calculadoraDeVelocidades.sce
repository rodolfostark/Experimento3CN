//recuperando dados de arquivos/implementações anteriores

exec('caminho\tabelaComPosicoesDeCadaEsfera.sce')
exec('caminho\tabelaComAngulosDeCadaEsfera.sce')

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
