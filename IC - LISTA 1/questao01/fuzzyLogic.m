function consumo = fuzzyLogic(temperatura,preco)
    t_ranger = linspace(15, 45, 1000);
    p_ranter = linspace(1, 6, 1000);
    c_ranger = 500:6000;
    if temperatura < t_ranger(1) || temperatura > t_ranger(length(t_ranger))
        error("Temperatura fora do ranger");
    end
    if preco < p_ranter(1) || preco > p_ranter(length(p_ranter))
        error("Preço fora do ranger");
    end

    t_baixa = gaussmf(temperatura, [6.369, 15]);
    t_media = gaussmf(temperatura, [6.369, 30]);
    t_alta = gaussmf(temperatura, [6.369, 45]);

    p_baixa = gaussmf(preco, [1.061, 1]);
    p_media = gaussmf(preco, [1.061, 3.05]);
    p_alta = gaussmf(preco, [1.061, 6]);

    c_pequeno = trimf(c_ranger, [-2250, 500, 3250]);
    c_medio = trimf(c_ranger, [500, 3250, 6000]);
    c_grande = trimf(c_ranger, [3250, 6000, 8750]);
    

    %Regra and
    r1 = prod([t_baixa, p_baixa]);
    r2 = prod([t_baixa, p_media]);
    r3 = prod([t_baixa, p_alta]);
    r4 = prod([t_media, p_baixa]);
    r5 = prod([t_media, p_media]);
    r6 = prod([t_media, p_alta]);
    r7 = prod([t_alta, p_baixa]);
    r8 = prod([t_alta, p_media]);
    r9 = prod([t_alta, p_alta]);

    %Implicação
    consumo_p = prod([r3, r6, r9]);
    consumo_m = prod([r2, r5, r8]);
    consumo_g = prod([r1, r4, r7]);
        
    %Agregação
    c_baixo_pertecimento = min(c_pequeno, consumo_p);
    c_media_pertecimento = min(c_medio, consumo_m);
    c_alta_pertecimento = min(c_grande, consumo_g);
    
    agrega = max(c_baixo_pertecimento, c_media_pertecimento);
    agrega = max(agrega, c_alta_pertecimento);

    %Centroide
    consumo = sum(agrega .* c_ranger) / sum(agrega);

end