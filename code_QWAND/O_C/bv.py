#This program is designed for calculate B-V
#Author : LEE
import numpy as np
B_arg = np.loadtxt('B_v1.dat')
V_arg = np.loadtxt('V_v1.dat')
B_mag = B_arg[:,1]
V_mag = V_arg[:,1]
# minus = B_mag - V_mag
# BV = np.mean(minus)
ave_B = np.mean(B_mag)
ave_V = np.mean(V_mag)
minus = ave_B - ave_V
