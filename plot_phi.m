function line = plot_phi(s1, s2, simout, varargin)
    nargoutchk(0, 1)

    Ts = simout.SimulationMetadata.ModelInfo.SolverInfo.FixedStepSize;
    
    x1 = simout.logsout.getElement(s1).Values.Data;
    x2 = simout.logsout.getElement(s2).Values.Data;
    
    [phi, tau] = ccf(x1, x2, Ts);
    line_element = plot(tau, phi, varargin{:});

    if nargout == 0
        grid on
        xlabel('$\tau\rightarrow$', Interpreter="latex")
        ylabel(['$\varphi_{', s1, s2, '}(\tau)\rightarrow$'], Interpreter="latex")
    else
        line = line_element;
    end

end

