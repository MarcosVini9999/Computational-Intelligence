function questao03()
    D =[122 139 0.115;
        114 126 0.120;
        086 090 0.105;
        134 144 0.090;
        146 163 0.100;
        107 136 0.120;
        068 061 0.105;
        117 062 0.080;
        071 041 0.100;
        098 120 0.115];
    
    X1 = D(:,1);
    X2 = D(:,2);
    Y = D(:, 3);
    
    %Coeficientes de regressao
    X= ones(length(D),width(D));
    i=1;
    while i<=length(D)
        X(i) = 1;
        X(10+i) = X1(i); 
        X(20+i) = X2(i);
        i=i+1;
    end
    beta_chap = ((X.')*X) \ ((X.')*Y);
    
    %Plotagem do gráfico 3D
    plot3 (X1, X2, Y, '*');
    hold on;
    grid on;
    [X1,X2] = meshgrid (30:0.5:180, 30:0.5:180);
    y_chap = beta_chap(1) + beta_chap(2).*(X1) + beta_chap(3).*(X2);
    mesh (X1,X2, y_chap);
    
    %Coeiciente de determinação
    ymed = sum(Y)/ length(Y);
    y_chap = ones(length(Y),1);
    SQe = ones (length (Y),1);
    Syy = ones (length (Y),1);
    i=1;
    while i<=length(Y)
        y_chap(i) = beta_chap(1) + beta_chap(2)*(X1(i)) + beta_chap(3)*(X2(i));
        SQe(i) = (Y(i)-y_chap(i))^2;
        Syy(i) = (Y(i)-ymed)^2;
        i=i+1;
    end
    R2= 1-((sum(SQe)/sum(Syy)));
    fprintf('R2 = %f\n', R2);
end