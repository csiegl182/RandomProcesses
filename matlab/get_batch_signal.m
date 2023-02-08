function x = get_batch_signal(name, results)
arguments
    name string
    results (1,:) Simulink.SimulationOutput
end
    
    x = cell2mat(arrayfun(@(r) get_signal(r, name), results, UniformOutput=false)).';

end

function x = get_signal(result, name)
    x = result.logsout.getElement(name).Values.Data;
end
