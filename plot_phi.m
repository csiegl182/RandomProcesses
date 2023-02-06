function plot_phi(s1, s2, simout, tlim)

Ts = simout.SimulationMetadata.ModelInfo.SolverInfo.FixedStepSize;

x1 = simout.logsout.getElement(s1).Values.Data;
x2 = simout.logsout.getElement(s2).Values.Data;

[phi, tau] = ccf(x1, x2, Ts);
plot(tau, phi)
xlim([-tlim, tlim])
grid on
xlabel('$\tau\rightarrow$', Interpreter="latex")
ylabel(['$\varphi_{', s1, s2, '}(\tau)\rightarrow$'], Interpreter="latex")
end

