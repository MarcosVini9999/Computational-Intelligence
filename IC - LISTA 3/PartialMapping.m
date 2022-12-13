function [firstChild,secondChild] = PartialMapping(firstWay,secondWay)  
    %Pontos de corte
    cut1 = floor(rand(1, 1) .* (width(firstWay) - 2) + 1);
    cut2 = cut1 + floor(rand(1, 1) .* (width(firstWay) - cut1 -2) + 1);
    
    firstWayCuts = zeros(1,0);
    secondWayCuts = zeros(1,0);
    
    %Subsequência de cortes do pai 1 e do pai 2
    for cutIndex = cut1+1 : cut2
        for wayIndex  = 1 : width(firstWay)
            if (cutIndex==wayIndex)
                firstWayCuts = [firstWayCuts, firstWay(wayIndex)];
                secondWayCuts = [secondWayCuts,secondWay(wayIndex)];
            end
        end
    end
    
    firstWayAux = firstWay;
    secondWayAux = secondWay;


    map = ones(1,width(firstWay))*(-1);

    for i = cut1 : cut2
        map(firstWay(i)) = secondWay(i);
        map(secondWay(i)) = firstWay(i);
    end
    
    for i = 1 : width(firstWay)
        if (map(firstWayAux(i)) ~= -1)
            aux1=map(firstWayAux(i));
            if(map(aux1)==firstWayAux(i))
                firstWayAux(i)=map(firstWayAux(i));
            end
        end
    end
    
    for i = 1 : width(secondWay)
        if (map(secondWayAux(i)) ~= -1)
            aux1=map(secondWayAux(i));
            if(map(aux1)==secondWayAux(i))
                secondWayAux(i)=map(secondWayAux(i));
            end
        end
    end
    
    firstChild = firstWayAux;
    secondChild = secondWayAux;
end

