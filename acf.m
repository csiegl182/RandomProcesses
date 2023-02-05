function [phi_xx, tau] = acf(x, Ts)

[phi_xx, tau] = ccf(x, x, Ts);

end
