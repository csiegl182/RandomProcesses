import numpy as np
from scipy import signal

def moving_average(x, Ts, Taverage):
    window_length = int(Taverage/Ts)
    window = np.ones(window_length)
    y = signal.lfilter(window, [1], x)/window_length
    y = y[:len(x)]
    return y

def delay(x, Ts, Td):
    delta = np.concatenate((np.zeros(int(Td/Ts)), [1]))
    return signal.lfilter(delta, [1], x)

def apply_batch(x, fcn):
    return np.array(list(map(fcn, x)))

def align_batch(*signals):
    desired_length = min([x.shape[1] for x in signals])
    return (x[:,:desired_length] for x in signals)

def ccf_batch(x, y, Ts):
    x, y = align_batch(x, y)
    Nbatch, N = x.shape
    lags = signal.correlation_lags(N, N, mode='full')
    phi_xy = sum(list(map(lambda f, g: signal.correlate(f, g, mode='full')/(N-abs(lags)), x, y)))/Nbatch
    tau = Ts*lags
    return phi_xy, tau

def acf_batch(x, Ts):
    return ccf_batch(x, x, Ts)

def random_process(power, Tges, Nbatch, Ts, process=np.random.randn):
    N = int(Tges/Ts)
    return np.sqrt(power/Ts)*process(Nbatch, N)

def filter_ccf(g, h, Ts):
    return signal.convolve(g, h, mode='full'), np.arange(-g.size+1, h.size)*Ts

def filter_acf(g, Ts):
    return filter_ccf(g, g, Ts)
    
    