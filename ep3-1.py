
import sys, re
import argparse
from tabela import Tabela, ListaTabela

def main():
    sqlIgnore = re.compile("^[--].*")
    regexNomeTabela = re.compile("CREATE TABLE ([^\s]+)")
    regexDependencia = re.compile("REFERENCES ([^\s]+)")

    try:
        estrutura = open(args.fileName, "r")

    except FileNotFoundError as err:
        print(err)

    listaTabela = ListaTabela()

    linha = ""
    for line in estrutura:
        if not (sqlIgnore.match(line)):
            linha = linha + line
            if (';' in line):
                linha = linha.replace('\n', ' ')
                nome = regexNomeTabela.search(linha)
                dependencias = regexDependencia.findall(linha)
                if(nome != None):
                    tabela = Tabela(nome.group(1)[1:-1])
                    listaTabela.add_tabela(tabela)
                    tabela.add_dependencias([d[1:-1] for d in dependencias])
                linha = ""

    for u in listaTabela.list:
        print (u.nome, u.dependencias)



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("fileName", help="O arquivo deve estar no mesmo diretório do script")
    args = parser.parse_args()
    main()