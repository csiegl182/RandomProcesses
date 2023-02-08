function show_model(model)
[~, model_name, ~] = fileparts(model);
print(['-s', model_name], [model_name, '.png'], '-dpng')
imshow(imread([model_name, '.png']))
end

