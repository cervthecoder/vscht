import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

# Define the cosine squared function
def cos_squared(x, A, b, phase):
    return A * np.cos(x + phase)**2 + b

# Prepare the data
data = """
-90,0.25,2.427184466,0.71,6.893203883
-80,0.38,3.689320388,2.31,22.42718447
-70,0.61,5.922330097,4.95,48.05825243
-60,1.1,10.67961165,6.67,64.75728155
-50,3.72,36.11650485,8.82,85.63106796
-40,5.36,52.03883495,10.6,102.9126214
-30,6.97,67.66990291,11,106.7961165
-20,8.61,83.59223301,11.07,107.4757282
-10,9.95,96.60194175,10.94,106.2135922
-5,10.16,98.6407767,10.73,104.1747573
0,10.3,100,10.3,100
5,10.22,99.22330097,9.3,90.29126214
10,9.95,96.60194175,7.91,76.7961165
20,8.56,83.10679612,6.09,59.12621359
30,6.81,66.11650485,4.35,42.23300971
40,5.18,50.29126214,1.35,13.10679612
50,2.58,25.04854369,0.53,5.145631068
60,0.9,8.737864078,0.29,2.815533981
70,0.58,5.631067961,0.25,2.427184466
80,0.41,3.980582524,0.4,3.883495146
90,0.29,2.815533981,0.8,7.766990291
"""

# Convert the data to numpy arrays
angles, _, y1, _, y2 = np.genfromtxt(data.splitlines(), delimiter=',', unpack=True)

# Convert angles to radians
x = np.radians(angles)

# Perform curve fitting for y1 (3rd column)
popt1, _ = curve_fit(cos_squared, x, y1, p0=[50, 2, 0])
A1, b1, phase1 = popt1

# Perform curve fitting for y2 (5th column)
popt2, _ = curve_fit(cos_squared, x, y2, p0=[50, 2, 0])
A2, b2, phase2 = popt2

# Generate points for the fitted curves
x_fit = np.linspace(x.min(), x.max(), 1000)
y1_fit = cos_squared(x_fit, A1, b1, phase1)
y2_fit = cos_squared(x_fit, A2, b2, phase2)

# Plot the results
plt.figure(figsize=(12, 6))
plt.scatter(angles, y1, label='Desilovaná voda', color='blue', alpha=0.7)
plt.scatter(angles, y2, label='Vzorek sacharosy (160g/l', color='red', alpha=0.7)
plt.plot(np.degrees(x_fit), y1_fit, label='', color='blue')
plt.plot(np.degrees(x_fit), y2_fit, label='', color='red')
plt.xlabel('β [°]')
plt.ylabel('Relativní Intenzita [%]')
plt.title('')
plt.legend()
plt.grid(True)
plt.show()

print(f"Fit for 3rd column: A = {A1:.4f}, b = {b1:.4f}, phase = {phase1:.4f}")
print(f"Fit for 5th column: A = {A2:.4f}, b = {b2:.4f}, phase = {phase2:.4f}")
