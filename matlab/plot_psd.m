function line = plot_psd(s1, s2, D, result, varargin)
    nargoutchk(0, 1)

    Ts = result(1).SimulationMetadata.ModelInfo.SolverInfo.FixedStepSize;
    
    x = get_batch_signal(s1, result);
    y = get_batch_signal(s2, result);
    
    x = batch_signal(x, D);
    y = batch_signal(y, D);
    Phi = zeros(1, D);
    for i = 1:size(x,1)
        phi = ccf(x(i,:), y(i,:), Ts)*Ts;
        phi = phi(floor(length(phi)/4):floor(length(phi)/4+D-1));
        phi = phi.*hamming(length(phi)).';
        Phi = Phi + fft(phi);
    end
    Phi = Phi/size(x, 1);
    Phi = fftshift(Phi);
    f = linspace(-1/Ts/4, 1/Ts/4, D);

    line_element = plot(f, abs(Phi), varargin{:});

    if nargout == 0
        grid on
        xlabel('$f [Hz]\rightarrow$', Interpreter="latex")
        ylabel(['$|\Phi_{', s1, s2, '}(f)|\rightarrow$'], Interpreter="latex")
    else
        line = line_element;
    end
end

function x_batched = batch_signal(x, n_batch)
    num_batches = floor(length(x)/n_batch);
    x_batched = x(1:num_batches*n_batch);
    x_batched = reshape(x_batched, [n_batch, num_batches]).';
end

