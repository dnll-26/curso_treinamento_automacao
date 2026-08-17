from robot.api.deco import keyword


@keyword("Calcular Preco Total E Validar")
def calcular_preco_total_e_validar(item_total: str, tax: str) -> float:
    """Limpa a formatação de moeda (ex: '$29.99' -> 29.99) e calcula o valor total."""
    # Remove símbolos de cifrão e espaços em branco
    valor_item = float(item_total.replace("$", "").strip())
    valor_taxa = float(tax.replace("$", "").strip())

    total = round(valor_item + valor_taxa, 2)
    return total