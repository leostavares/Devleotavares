import pandas as pd 
class Produto:
    def __init__(self,nome,preco,quantidade):
        self.nome=nome
        self.preco=preco
        self.quantidade=quantidade
class Estoque:
    def __init__(self):
        self.produtos=[]
    def adicionar_produtos(self,produto):
            self.produtos.append(produto)
    def remover_produtos(self,nome_produto):
         for produto in self.produtos:
              if nome_produto==produto.nome:
                   self.produtos.remove(produto)
                   break
         else:
            print('Produto nao encontrado!')
    def listar_produtos(self):
         if not self.produtos:
              print('0 produtos cadastrados!')
         else:
              data={
                   'nome':[produto.nome for produto in self.produtos],
                   'preco':[produto.preco for produto in self.produtos],
                   'quantidade':[produto.quantidade for produto in self.produtos]

              }
              df=pd.DataFrame(data)
              print(df)

              
estoque = Estoque()
produto1 = Produto('Arroz', 5.50, 100)
produto2 = Produto('Feijão', 6.00, 50)

estoque.adicionar_produtos(produto1)
estoque.adicionar_produtos(produto2)

estoque.listar_produtos()
estoque.remover_produtos('Arroz')
estoque.listar_produtos()


