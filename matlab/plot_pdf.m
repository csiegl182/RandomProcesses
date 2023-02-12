function plot_pdf(signal, result, varargin)

x = get_batch_signal(signal, result);
[h, edges] = histcounts(x, Normalization="pdf");
plot(edges(1:end-1), h, varargin{:})
grid on

end