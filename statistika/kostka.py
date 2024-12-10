# Funkce pro generování všech možností hodu dvěma kostkami
def generate_dice_combinations():
    dice_sides = range(1, 7)  # Kostka má 6 stran, hodnota od 1 do 6
    combinations = []
    
    for dice1 in dice_sides:
        for dice2 in dice_sides:
            combinations.append((dice1, dice2))  # Přidání každé kombinace do seznamu
    
    return combinations

# Výpis všech kombinací
combinations = generate_dice_combinations()
for combo in combinations:
    print(combo)

# Celkový počet kombinací
print(f"Celkový počet možností: {len(combinations)}")
