
class Tabela:
    def __init__(self, nome):
        self.nome = nome
        self.referencias = list()

    def add_referencia(self, referencia):
        self.referencias.append(referencia)

    def get_referencias(self):
        return len(self.referencias)

class ListaTabela:
    def __init__(self):
        self.list = list()

    def add_tabela(self, tabela):
        self.list.append(tabela)