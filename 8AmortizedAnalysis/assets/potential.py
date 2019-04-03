import matplotlib
import matplotlib.pyplot as plt
import numpy as np

matplotlib.rcParams['figure.figsize'] = (20,10)
matplotlib.rcParams.update({'font.size': 22})

x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
y = [0, 1, 2, 2, 4, 2, 4, 6, 8, 2]

plt.plot(x, y, color='b')
plt.grid()
plt.xticks(np.arange(min(x), max(x)+1, 1.0))
#plt.title("Potentialet som funktion af den $i$'te operation")
plt.xlabel('Iteration $i$')
plt.ylabel('$\Phi(D_i)$')

plt.savefig("potential.pdf", transparent = True, bbox_inches = 'tight')
