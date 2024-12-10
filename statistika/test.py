import scipy.stats as stats
import numpy as np
import matplotlib.pyplot as plt

data = [4.1, 4.0, 3.8, 3.9, 3.8, 3.8, 3.8, 3.5, 3.7, 4.0, 4.0]

mu_0 = 3.9
mean = sum(data) / len(data)
variance = sum((x - mean) ** 2 for x in data) / (len(data)-1)

print(f"Mean: {mean}")
print(f"Variance: {variance}")


t_value = (mean - mu_0) / (variance ** 0.5 / len(data) ** 0.5)


print(f"t-value: {t_value}")


data1 = [62, 54, 55, 60, 53, 58]
data2 = [52, 56, 49, 50, 51]

mu1 = np.mean(data1)
mu2 = np.mean(data2)

n1 = len(data1)
n2 = len(data2)

var1 = np.var(data1, ddof=1)
var2 = np.var(data2, ddof=1)

R = (mu1 - mu2) / np.sqrt(var1 / len(data1) + var2 / len(data2))

numerator_l = (var1 / n1 + var2 / n2) ** 2

denominator_l = ((var1 / n1) ** 2 / (n1 - 1)) + ((var2 / n2) ** 2 / (n2 - 1))



# Correct degrees of freedom

l = numerator_l / denominator_l

print(f"R: {R}")
print(f"l: {l}")


n = 20
k = 5
misto_a = [404.8, 404.8, 407.9, 408.7, 405.5, 401.2, 401.3, 402.7, 405.9, 404.1, 406.9, 400.6, 401.5, 406.5, 409.9, 402.9, 403.8, 405.7, 406.2, 402.5]
misto_b = [403.2, 403.8, 398.6, 399.8, 398.9, 404.9, 403.9, 400.6, 397.6, 401.8, 400.8, 400.8, 412.9, 402.3, 397.3, 402.8, 407.1, 401.8, 406.1, 407.4]
misto_c = [398.0, 400.1, 404.1, 403.7, 398.2, 398.4, 403.2, 401.2, 405.8, 405.5, 404.5, 406.2, 405.4, 407.2, 409.2, 401.5, 408.0, 402.5, 405.3, 404.4]
misto_d = [402.7, 397.9, 400.3, 403.5, 403.6, 399.5, 396.9, 400.3, 400.7, 401.7, 400.8, 394.3, 405.2, 401.9, 395.9, 398.6, 399.6, 401.6, 399.4, 397.9]
misto_e = [401.1, 410.6, 405.1, 407.5, 401.2, 402.4, 407.1, 404.7, 406.1, 406.6, 404.5, 403.5, 406.2, 399.0, 398.6, 407.7, 400.0, 404.0, 406.0, 404.9]

mu_a = np.mean(misto_a)
mu_b = np.mean(misto_b)
mu_c = np.mean(misto_c)
mu_d = np.mean(misto_d)
mu_e = np.mean(misto_e)

print(f"mu_a: {mu_a}")
print(f"mu_b: {mu_b}")
print(f"mu_c: {mu_c}")
print(f"mu_d: {mu_d}")
print(f"mu_e: {mu_e}")

mu = np.mean([misto_a, misto_b, misto_c, misto_d, misto_e])

var_a = np.var(misto_a, ddof=1)
var_b = np.var(misto_b, ddof=1)
var_c = np.var(misto_c, ddof=1)
var_d = np.var(misto_d, ddof=1)
var_e = np.var(misto_e, ddof=1)

print(f"var_a: {var_a}")
print(f"var_b: {var_b}")
print(f"var_c: {var_c}")
print(f"var_d: {var_d}")
print(f"var_e: {var_e}")

numerator = n*np.sum(np.square([mu_a, mu_b, mu_c, mu_d, mu_e] - mu))/(5-1)

denominator =  np.sum([var_a, var_b, var_c, var_d, var_e])/5

F = numerator/denominator

print(f"F: {F}")



