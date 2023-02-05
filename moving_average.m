function y = moving_average(x, Ts, Taverage)

window_length = round(Taverage/Ts);
window = ones(1, window_length);
y = conv(x, window)/window_length;
y = y(1:size(x,2));

end


