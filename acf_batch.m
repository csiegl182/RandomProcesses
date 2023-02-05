function [phi_xx, tau] = acf_batch(x, Ts)

[phi_xx, tau] = ccf_batch(x, x, Ts);

end

