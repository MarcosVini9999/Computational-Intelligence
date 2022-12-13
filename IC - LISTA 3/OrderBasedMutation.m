function [output] = OrderBasedMutation(array)
    %Order Based Mutation

    probability = 0.005;
    r = rand(1,1);

    if (r < probability) 
        index = randperm(14,2);
        aux = array(index(1));
        array(index(1)) = array(index(2));
        array(index(2)) = aux;
    end
    
    output = array;
end

