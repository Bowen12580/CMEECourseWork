import numpy as np
import scipy.integrate as integrate
import matplotlib.pylab as p

# Area under a curve
y = np.array([5, 20, 18, 19, 18, 7, 4])

# Compute the area using the trapezoidal rule
area_trapz_dx2 = integrate.trapz(y, dx=2)
area_trapz_dx1 = integrate.trapz(y, dx=1)
area_trapz_dx3 = integrate.trapz(y, dx=3)

# Compute the area using Simpson's rule
area_simps_dx2 = integrate.simps(y, dx=2)
area_simps_dx1 = integrate.simps(y, dx=1)
area_simps_dx3 = integrate.simps(y, dx=3)

# Lotka-Volterra model
def dCR_dt(pops, t=0):
    R = pops[0]
    C = pops[1]
    dRdt = r * R - a * R * C 
    dCdt = -z * C + e * a * R * C
    return np.array([dRdt, dCdt])

# Assign parameter values
r = 1.
a = 0.1 
z = 1.5
e = 0.75

# Define the time vector
t = np.linspace(0, 15, 1000)

# Set initial conditions
R0 = 10
C0 = 5 
RC0 = np.array([R0, C0])

# Numerically integrate the system
pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)

# Plotting the population dynamics
f1 = p.figure()
p.plot(t, pops[:,0], 'g-', label='Resource density')
p.plot(t, pops[:,1], 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population density')
p.title('Consumer-Resource population dynamics')
f1.savefig('../results/LV_model.pdf')


# Plotting the Lotka-Volterra phase plot
f2 = p.figure()
p.plot(pops[:,0], pops[:,1], 'r-')
p.grid()
p.xlabel('Resource density')
p.ylabel('Consumer density')
p.title('Consumer-Resource population dynamics')
f2.savefig('../results/LV_phase_plot.pdf')

