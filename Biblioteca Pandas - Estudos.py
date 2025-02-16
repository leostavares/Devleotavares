import pandas as pd

loja={
    'Produtos':['Celular','Fone de ouvido','Teclado','Mouse'],
    'Quantidade':[10,20,10,6],
    'Preço':[3000,150,60,60]
}

df=pd.DataFrame(loja)
print(df)
