function y = apply_batch(x, fcn)

y = cell2mat(arrayfun(@(row_idx) fcn(x(row_idx,:)), (1:size(x,1)).', 'UniformOutput', false));

end

