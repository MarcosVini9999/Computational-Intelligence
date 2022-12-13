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

%Quantidade de individuos
amount= 100;

%Inicialização da matriz de cidades por ordem de percorrimento
z = zeros(amount,height(X));

%Primeira geração de pais
%Cada linha é um possível caminho a ser percorrido
%Z é a matriz de pais
for l = 1 : height(z)
    z(l,:) = randperm(14);
end

allBestWayValue = zeros(height(z), 1);
allBestWay = zeros(height(z),width(z));
wayIndex = zeros(1, amount);
children = zeros(amount, height(X));
totalGenerations = 100;

for generation = 1 : totalGenerations
    %Seleção
    %Salva todos os indexes em um array de indexes
    %Cada index é obtido pela função Wheel
    %A seleção é feita por uma roleta
    for i=1:length(z)
        index = Wheel(z, X);
        wayIndex(i) = index;
    end

    %Crossover (mapeamento parcial)
    %Cruza de 2 em 2 indexes do array de indexes chamado wayIndex
    for i = 1:2:(width(wayIndex))
        currentWayIndex = wayIndex(i);
        nextWayIndex = wayIndex(i + 1);
        [child1, child2] = PartialMapping(z(currentWayIndex, :),z(nextWayIndex, :));
        children(i,:) = child1;
        children(i+1,:) = child2;
    end

    %Mutação (permutação de elementos)
    %Aplica a chance de uma linha de filhos sofrer mutações
    for i=1:height(children)
        children(i, :) = OrderBasedMutation(children(i, :));
    end
    
    z=children;
    
    %Procura o melhor caminho da geração
    bestWayValue = 1/(EvaluationFunction(z(1,:), X));
    bestWay = z(1,:);
    for i=2:height(z)
        value = 1/(EvaluationFunction(z(i,:), X));
        if(value<bestWayValue)
            bestWayValue = value;
            bestWay = z(i,:);
        end
    end
    
    %Imprime o melhor caminho da geração
    fprintf('Geração: %d ', generation);
    fprintf('Melhor caminho: [');
    way = string(bestWay);
    for i = 1 : width(z)
        fprintf(way(i));
        fprintf(' ')
    end
    fprintf(']');
    fprintf('Distancia percorrida: %d \n', bestWayValue);

    %Salva o melhor caminho da geração atual
    allBestWayValue(generation, :) = bestWayValue;
    allBestWay(generation,:) = bestWay;
end

%Imprime o melhor caminho entre as gerações
[dist, index]=min(allBestWayValue);
fprintf('Melhor caminho de todos: [');
way = string(allBestWay(index, :));
for i = 1 : width(z)
    fprintf(way(i));
    fprintf(' ')
end
fprintf(']');
fprintf('Distancia percorrida pelo melhor caminho: %d \n', dist);

