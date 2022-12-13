function [output] = Wheel(allWays, database)
    %Função que faz a seleção roleta
    
    sumOfRatings = 0;
    for i = 1 : height(allWays)
        sumOfRatings = sumOfRatings + EvaluationFunction(allWays(i, :), database);
    end
    
    limit = rand(1,1)*sumOfRatings;
    
    i=1;
    aux=EvaluationFunction(allWays(1, :), database);
    
    while(aux<limit)
        i=i+1;
        aux =aux + EvaluationFunction(allWays(i,:),database);
    end
    
    output = i;
end