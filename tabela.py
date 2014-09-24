
class Tabela:
    def __init__(self, nome):
        self.nome = nome
        self.dependencias = list()

    def add_dependencias(self, dependencias):
        self.dependencias = dependencias

    def get_dependencias(self):
        return len(self.dependencias)

class ListaTabela:
    def __init__(self):
        self.list = list()

    def add_tabela(self, tabela):
        self.list.append(tabela)

    def find_nome(self, nome):
        for tabela in self.list:
            if (tabela.nome == nome):
                return True
        return False