function results = run(model, n_batch, model_params)
arguments
    model string
    n_batch int64
    model_params.Ts
    model_params.Tges
end
[~, model_name, ~] = fileparts(model);
load_system(model_name)
hws = get_param(model_name, 'modelworkspace');
for param = fields(model_params).'
    hws.assignin(param{1}, model_params.(param{1}))
end
results = cell(1,n_batch);
results = cellfun(@(~) sim(model), results);
end

