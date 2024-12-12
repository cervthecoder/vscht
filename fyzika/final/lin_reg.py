import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# Data
I = np.array([4.49, 4.46, 4.26, 4.23, 3.96, 3.89, 3.76, 3.51, 3.31, 3.19])  # Intensity values
x = np.array([2.902, 5.804, 8.706, 11.608, 14.51, 17.412, 20.314, 23.216, 26.118, 29.02])  # Corresponding x values

# Reshape x for linear regression
x = x.reshape(-1, 1)

# Perform linear regression
model = LinearRegression()
model.fit(x, I)
slope = model.coef_[0]  # Slope of the line
intercept = model.intercept_  # Intercept of the line

# Calculate residuals
predicted = model.predict(x)
residuals = I - predicted

# Calculate uncertainty in slope
n = len(I)  # Number of data points
s_yx = np.sqrt(np.sum(residuals**2) / (n - 2))  # Standard error of residuals
s_xx = np.sum((x.flatten() - np.mean(x))**2)  # Variance of x
slope_uncertainty = s_yx / np.sqrt(s_xx)

# Plot scatter plot and regression line
plt.scatter(x, I, label='Data points', color='blue')
plt.plot(x, predicted, label=f'Linear fit: I = {slope:.3f}x + {intercept:.3f}', color='red')
plt.xlabel('x')
plt.ylabel('I')
plt.title('Scatter Plot of I(x) and Linear Regression')
plt.legend()
plt.grid()
plt.show()

# Print coefficients and uncertainty
print(f"Slope (m): {slope:.3f}")
print(f"Intercept (b): {intercept:.3f}")
print(f"Uncertainty in slope (Δm): {slope_uncertainty:.3f}")
