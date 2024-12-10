import matplotlib.pyplot as plt
from collections import Counter
import numpy as np

# Funkce pro generování součtů při hodu dvěma kostkami
def generate_dice_sums():
    dice_sides = range(1, 7)
    sums = []
    
    for dice1 in dice_sides:
        for dice2 in dice_sides:
            sums.append(dice1 + dice2)
    
    return sums

# Generování součtů a jejich četnosti
sums = generate_dice_sums()
print(sums)
sums_count = Counter(sums)
print(sums_count)
print(sums_count.items())

# Pravděpodobnostní funkce (relativní četnosti)
total_combinations = len(sums)
probability_function = {key: value / total_combinations for key, value in sums_count.items()}

# Výpis pravděpodobnostní funkce (tabulka)
print("Hodnota X (součet)", "Pravděpodobnost", sep="\t")
for sum_value, prob in sorted(probability_function.items()):
    print(f"{sum_value}\t\t{prob:.3f}")

# Graf pravděpodobnostní funkce
plt.bar(probability_function.keys(), probability_function.values())
plt.xlabel('Součet dvou kostek (X)')
plt.ylabel('Pravděpodobnost')
plt.title('Pravděpodobnostní funkce náhodné veličiny X')
plt.show()

# Výpočet distribuční funkce (kumulativní součet pravděpodobností)
cumulative_probabilities = {}
cumulative_sum = 0

for sum_value in sorted(probability_function.keys()):
    cumulative_sum += probability_function[sum_value]
    cumulative_probabilities[sum_value] = cumulative_sum

# Výpis distribuční funkce (tabulka)
print("\nHodnota X (součet)", "Distribuční funkce F(X)", sep="\t")
for sum_value, cum_prob in sorted(cumulative_probabilities.items()):
    print(f"{sum_value}\t\t{cum_prob:.3f}")

# Graf distribuční funkce
plt.step(list(cumulative_probabilities.keys()), list(cumulative_probabilities.values()), where='mid')
plt.xlabel('Součet dvou kostek (X)')
plt.ylabel('Kumulativní pravděpodobnost F(X)')
plt.title('Distribuční funkce náhodné veličiny X')
plt.show()

# Pravděpodobnost P(X <= 3)
p_x_leq_3 = cumulative_probabilities[3]
print(f"P(X <= 3): {p_x_leq_3:.3f}")

# Pravděpodobnost P(X > 9) je 1 - P(X <= 9)
p_x_gt_9 = 1 - cumulative_probabilities[9]
print(f"P(X > 9): {p_x_gt_9:.3f}")

# Pravděpodobnost P(8 <= X <= 11) je P(X <= 11) - P(X < 8)
p_8_leq_x_leq_11 = cumulative_probabilities[11] - cumulative_probabilities[7]
print(f"P(8 <= X <= 11): {p_8_leq_x_leq_11:.3f}")

# Pravděpodobnost P(X = 2) je přímo pravděpodobnostní funkce pro X = 2
p_x_eq_2 = probability_function[2]
print(f"P(X = 2): {p_x_eq_2:.3f}")


