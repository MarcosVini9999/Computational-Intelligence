function accuracy = Accuracy(Y_test, prediction)
    [~, categories_prediction_outputs] = max(prediction);
    [~, outputs_category] = max(Y_test);
  
    accuracy = (sum(categories_prediction_outputs == outputs_category)) / width(Y_test);
end

