function [phi_xy, tau] = ccf(x, y, Ts)

[phi_xy, lags] = xcorr(x, y, 'unbiased');
tau = lags*Ts;

end
