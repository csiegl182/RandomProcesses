function results = run(model, model_params)
arguments
    model string
    model_params.Ts
    model_params.Tges
end
[~, model_name, ~] = fileparts(model);
load_system(model_name)
hws = get_param(model_name, 'modelworkspace');
for param = fields(model_params).'
    hws.assignin(param{1}, model_params.(param{1}))
end
results = sim(model);
end

