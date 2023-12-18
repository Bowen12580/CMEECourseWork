import numpy as np
import scipy.integrate as integrate
import matplotlib.pyplot as plt
import sys

# Function for the modified Lotka-Volterra model with resource density dependence
def dCR_dt(pops, t=0):
    R, C = pops
    dRdt = r * R * (1 - R / K) - a * R * C 
    dCdt = -z * C + e * a * R * C
    return np.array([dRdt, dCdt])

# Command line arguments for parameters
r, a, z, e, K = map(float, sys.argv[1:6])

# Time vector
t = np.linspace(0, 100, 1000)  # Adjust time length if needed

# Initial conditions
R0 = 10
C0 = 5 
RC0 = np.array([R0, C0])

# Numerically integrate the system
pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)

# Create a figure with subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 6), sharex=True)

# Plot resource density
ax1.plot(t, pops[:, 0], 'g-', label='Resource density')
ax1.set_ylabel('Resource Density')
ax1.set_title('Modified Lotka-Volterra Model')
ax1.legend(loc='best')

# Plot consumer density
ax2.plot(t, pops[:, 1], 'b-', label='Consumer density')
ax2.set_xlabel('Time')
ax2.set_ylabel('Consumer Density')
ax2.legend(loc='best')

# Add a title and parameters information
plt.suptitle(f'r={r}, a={a}, z={z}, e={e}, K={K}')

# Save the figure as a PDF
plt.savefig('../results/LV_model_with_density_dependence.pdf')

# Print final population values
print(f'Final Resource Density: {pops[-1,0]}')
print(f'Final Consumer Density: {pops[-1,1]}')

# Show the plot
plt.show()
