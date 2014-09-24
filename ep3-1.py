
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

    #Lista de todas as tabelas referenciadas no arquivo de estrutura
    listaTabela = ListaTabela()

    #lista de tabelas povoadas
    tabelasPovoadas = ListaTabela()
    linha = ""
    for line in estrutura:
        if not (sqlIgnore.match(line)):
            linha = linha + line
            if (';' in line):
                #Faz com que cada bloco do código SQL seja lido em uma única linha
                linha = linha.replace('\n', ' ')

                nome = regexNomeTabela.search(linha)
                dependencias = regexDependencia.findall(linha)

                if(nome != None):
                    tabela = Tabela(nome.group(1)[1:-1])
                    listaTabela.add_tabela(tabela)

                    #Adiciona todas as referenências encontradas, retirando os limitadores (aspas)
                    tabela.add_dependencias([d[1:-1] for d in dependencias])

                    #Adiciona as tabelas sem dependencias na lista de tabelas povoadas
                    if not(dependencias): tabelasPovoadas.add_tabela(tabela)

                #Limpa a variável para a próxima iteração
                linha = ""

    
    while True:
        for t in listaTabela.list:
            if(len(t.dependencias) > 0 and not tabelasPovoadas.find_nome(t.nome)):
                flag_add_table = True
                for d in t.dependencias:
                    if not(tabelasPovoadas.find_nome(d)):
                        flag_add_table = False
                if(flag_add_table):
                    tabelasPovoadas.add_tabela(t)

        if (len(tabelasPovoadas.list) >= len(listaTabela.list)): break
        
    print ('\n'.join([t.nome for t in tabelasPovoadas.list]))




if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("fileName", help="O arquivo deve estar no mesmo diretório do script")
    args = parser.parse_args()
    main()