from disaggregation import DisaggregationManager
import numpy as np
from more_itertools import windowed

x = np.random.random_sample(10 * 32 * 1024)
w = windowed(x, n=1024, step=128)

z = DisaggregationManager._overlap_average(np.array(list(w)), stride=128)
print(z.shape)
print(x.shape)
assert z.shape == x.shape