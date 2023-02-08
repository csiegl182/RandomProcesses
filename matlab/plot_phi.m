function line = plot_phi(s1, s2, result, varargin)
    nargoutchk(0, 1)

    Ts = result(1).SimulationMetadata.ModelInfo.SolverInfo.FixedStepSize;
    
    x1 = get_batch_signal(s1, result);
    x2 = get_batch_signal(s2, result);
    
    [phi, tau] = ccf_batch(x1, x2, Ts);
    line_element = plot(tau, phi, varargin{:});

    if nargout == 0
        grid on
        xlabel('$\tau\rightarrow$', Interpreter="latex")
        ylabel(['$\varphi_{', s1, s2, '}(\tau)\rightarrow$'], Interpreter="latex")
    else
        line = line_element;
    end

end

