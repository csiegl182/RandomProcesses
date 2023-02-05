function [phi_xy, tau] = ccf_batch(x, y, Ts)

[Nbatch, ~] = size(x);
phi_xy = 0;
for row_idx = 1:Nbatch
    [phi, tau] = ccf(x(row_idx,:), y(row_idx,:), Ts);
    phi_xy = phi_xy + phi;
end
phi_xy = phi_xy / Nbatch;

end

