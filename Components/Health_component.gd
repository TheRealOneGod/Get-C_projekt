class_name HealthComponent extends Node

signal health_changed(current: float, max: float)
signal died

@export var max_health := 100.0
@export var current_health := 0.0

# Funkce vysílá signál, že došo ke změně životů. Všechny lines co říkají _emit() by šlo nahradit samotným emitem health changed, ale eventulně budeme chtít dělat víc věcí při health changed, meaning že má vlastní funkci. Maby změním
func _emit() -> void:
	health_changed.emit(current_health, max_health)

# Při spawnu se current životy nastaví na maximum, ideálně nemít enemáky co nezačínají v půce hpek. Pokud to nastane, tak dojde ke změne
func _ready() -> void:
	current_health = max_health
	_emit()
	
# Funkci voláš když držitel Health_componentu ztratí životy, amount je kolik ztrácí. Pokud dojde k redukci na 0 tak je vyslán signál o smrti. Clamp zařizuje, aby se životy nemohly změnit na číslo mimo range (0, max health)
func damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0.0, max_health)
	_emit()
	if current_health == 0.0:
		died.emit()
# Same jako damage, ale pro healování. ??? Jak handlnout healing -> negative damage, nebo healing? Pokud první možnost tak odstranit heal funkci. Pokud druhá tak přidat conditions, aby damage a heal amount nemohl byt negativni (pokud k tomu dojde)
func heal(amount: float) -> void:
	current_health = clamp(current_health - amount, 0.0, max_health)
	_emit()
