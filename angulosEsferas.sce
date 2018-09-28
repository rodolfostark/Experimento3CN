exec('C:\Users\bennb\OneDrive\Área de Trabalho\Experimento3CN\tabelaComPosicoesDeCadaEsfera.sce'); // "path" é o caminho para o arquivo "tabelaComPosicoesDeCadaEsfera.sce", enquanto document é o nome do próprio arquivo

arc = eye(3,4); //definição de uma matriz cujas dimensões são 3x4 (3 esferas e 4 fotos). Logo, as colunas se referem às fotos e as linhas às cores

X = [x_vermelha; x_verde; x_azul]; //concatenação dos vetores x em uma única matriz X de forma a facilitar as operações
Y = [y_vermelha; y_verde; y_azul] //concatenação dos vetores y em uma única matriz Y de forma a facilitar as operações

[nl, nc] = size(X); 

for i=1:1:nl
    for j=1:1:nc
        arc(i,j) = Y(i,j)/X(i,j); //por definição, tg(alpha) = cateto_oposto/cateto_adjacente
        arc(i,j) = atan(arc(i,j)); //por definição alpha = arctg(.)
    end
end

clc

//exibição das matrizes utilizadas

disp("Matriz X");
disp(X);
disp("Matriz Y");
disp(Y);
disp("Matriz de arcotangentes:");
disp(arc);

//exibição dos vetores correspondentes

for k=1:1:nl
        if(k == 1)
            disp("Esfera vermelha: ");
            disp(arc(1,:));
        elseif(k==2)
            disp("Esfera verde: ");
            disp(arc(2,:));
        else
            disp("Esfera azul: ");
            disp(arc(3,:));
        end
end


