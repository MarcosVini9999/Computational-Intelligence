function [output] = EvaluationFunction(array, database)
    %Função de avaliação que soma as ditancias entre as cidades do vetor
    %Databse é a matriz a matriz adjacencia com as distâncias entre cidades

    %Distância total percorrida pelo caxeiro
    totalDistance = 0;
    
    %Soma as distâncias entre todas as cidades presentes no array
    for city = 1: (width(array) -1)
        currentCity = array(city);
        nextCity = array(city + 1);
        totalDistance = totalDistance + database(currentCity, nextCity);
    end
    
    %Soma a distância da última cidade até a primeira cidade
    totalDistance = totalDistance + database(array(1),array(width(array)));

    output = 1/totalDistance;
end

