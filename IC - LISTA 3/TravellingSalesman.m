    %Matriz simétrica
    X =[0 1 2 4 6 2 2 3 3 5 6 1 4 5;
        1 0 3 2 1 3 6 3 4 4 2 4 4 4;
        2 3 0 1 3 3 2 3 4 1 3 5 5 6;
        4 2 1 0 5 1 4 2 3 4 4 8 2 2;
        6 1 3 5 0 2 1 6 5 2 3 4 2 2;
        2 3 3 1 2 0 3 1 2 3 5 7 3 4;
        2 6 2 4 1 3 0 2 1 2 5 2 4 3;
        3 3 3 2 6 1 2 0 5 5 1 5 3 6;
        3 4 4 3 5 2 1 5 0 1 4 4 5 3;
        5 4 1 4 2 3 2 5 1 0 5 4 4 2;
        6 2 3 4 3 5 5 1 4 5 0 4 2 1;
        1 4 5 8 4 7 2 5 4 4 4 0 1 3;
        4 4 5 2 2 3 4 3 5 4 2 1 0 1;
        5 4 6 2 2 4 3 6 3 2 1 3 1 0;];

    %Inicialização do array de cidades por ordem de percorrimento
    z = zeros(1,14);

    %Seleção
    %Crossver (mapeamento parcial)
    %Mutação (permutação de elementos)