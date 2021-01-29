
SELECT * FROM tabela_de_produtos;

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO 
FROM tabela_de_produtos;

SELECT EMBALAGEM,
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM, 
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END 
ORDER BY EMBALAGEM;

[0:00] Vamos falar agora do CASE. O que é o CASE? Como o próprio nome diz, o CASE é o seguinte: se acontece uma determinada condição, eu faço uma coisa; senão, eu faço outra.

[0:15] Então, eu uso o CASE dessa maneira como está sendo mostrado aqui em cima. Coloco o CASE, a condição, THEN, eu pego algum tipo de campo; se for outra condição, outro tipo de campo, e assim por diante.

[0:31] No final, caso nenhuma das condições se satisfaça, eu executo o ELSE, que aí significa que ele vai executar uma condição de desvio, caso ninguém satisfaça a condição, eu me desvio para aquele outro valor.

[0:55] Por exemplo, a gente usa isso muito para classificar alguns registros. Então, digamos que eu tenha aqui um campo que representa clientes - vou botar o apontador aqui - e uma nota do cliente, ok?

[1:13] Bem, eu posso chegar e fazer o seguinte: olha, clientes que têm entre oito e dez, são do tipo ótimo; clientes que têm de sete a oito, são do tipo bom; e clientes de cinco a sete, são clientes médios; e se nenhum desses clientes tiver uma nota de sete a dez, vão ser clientes ruins.

[1:37] Então, eu vou substituir a saída por uma classificação. Então, essa é uma forma de a gente usar o CASE.

[1:45] A gente pode usar o CASE também, por exemplo, se tal condição acontece, então eu faço uma conta; senão, eu faço outra. Então, o que você vai colocar aqui dentro do THEN, pode ser uma constante, pode ser um outro campo, pode ser uma série de coisas.

[2:09] Bem, vamos fazer exemplos práticos disso. Vou voltar para o Workbench, vou clicar aqui e criar uma tela de script nova, e vou pegar, por exemplo, isso aqui: FROM, tabela de produtos. Aí, eu tenho lá meu preço de lista . Cada produto tem um preço de lista.

[2:36] Digamos que eu queira classificar os meus produtos por produtos que são baratos, produtos que são em conta, e produtos que são caros, por exemplo. Então, eu posso dizer o seguinte, eu posso fazer isso daqui: SELECT, vou pegar aqui o nome do produto, vou pegar o preço, e aqui, depois, eu vou usar o meu CASE.

[3:13] Então, eu escrevo isso aqui: CASE, WHEN, preço de lista for, por exemplo, maior ou igual que 12, THEN, produto caro; WHEN, preço de lista, maior ou igual que sete, AND, preço de lista menor que 12, THEN, produto em conta; aí eu posso colocar um ELSE, produto barato.

[4:12] Aí eu tenho um END, esse END vai fechar o meu CASE, e eu coloco um alias: AS, por exemplo, status preço, FROM, tabela de produtos.

[4:31] Então vamos rodar pra ver como é que ficou isso? Na verdade, deixa eu até indentar, a coisa seria assim: WHEN, ELSE, então seria assim, mais ou menos, o meu CASE.

[4:51] Eu vou selecionar, vou rodar, e aí eu tenho lá. Sabor da Montanha é um produto barato, Linha Citros é um produto em conta, Videira do Campo é um produto em conta, o quarto produto é um produto caro, e assim por diante. Eu tenho lá minha relação do que é produto barato e do que é, por exemplo, produto caro. Deixa eu ver aqui se tem mais alguma observação.

[5:19] Eu posso, por exemplo, fazer isso daqui: eu posso pegar essa mesma condição aqui e, em vez de usar o preço de lista, eu coloco aqui, por exemplo, embalagem. E aí, aqui, eu coloco, por exemplo, AVG de preço de lista, preço médio. Estou pegando preço médio por embalagem, está bom? Então, se eu rodar essa consulta aqui, eu tenho o seguinte: embalagem, garrafa, produto barato, o preço médio é 11 ponto alguma coisa.

[6:15] Aí você vai notar: "poxa, mas cadê os outros produtos? Por que é que não apareceram as outras embalagens?". Bem, não apareceram as outras embalagens porque eu não coloquei o meu GROUP BY, por isso que deu erro, desculpe meu vacilo.

[6:36] No GROUP BY, eu vou colocar embalagem, e aí, dentro do GROUP BY, eu vou colocar, também, esse CASE todo aqui. Então, olha só, fez parte do GROUP BY, o CASE completo, e vou aqui rodar. Agora, sim. Eu tenho garrafa, barato, pet, caro.

[7:17] Aí o que tem isso daqui, eu tenho o seguinte: o que é um produto barato? Um produto barato é menor que sete, porque entre sete e 12, é em conta. Então, garrafas baratas, a média entre elas, ou seja, se pegar todas as garrafas que são baratas, que têm o preço menor que sete, e a média de preço é 5.23.

[7:44] Se eu pegar os pets em conta, a média de todos os produtos pet que são em conta, ou seja, pets que têm preço entre sete e 12, a média é 9.10. Se eu pegar, por exemplo, os pets que são caros, em média, o preço médio é 20.40.

[8:08] Então, eu consigo aqui, não somente ver qual é o preço médio de garrafas pets caras, de garrafas pets baratas ou de garrafas pets em conta, levando em consideração o critério que eu coloquei, que o que custar mais do que 12, é caro; o que custa entre sete e 12, é em conta; e o que for menos que sete, é barato.

[8:36] Então, vocês veem que eu começo, aqui, a misturar coisas, começo a misturar CASE com GROUP BY, posso botar um ORDER BY aqui, por exemplo. GROUP BY está aqui, eu posso botar um ORDER BY, embalagem. Então, vai vir todo mundo, por exemplo, olha lá, vem as garrafas primeiro.

[9:09] Então, garrafa barata, em média, o preço é 5.23; as garrafas caras, em média, 13.31; e as garrafas em conta, a média é 8,05. Lata, só tem barato, não tem lata cara nem em conta, e a média é 3.49. Já os pets, não tem barato, só tem pet em conta ou caro, e está lá: os pets caros são 20.40; e os pets em conta, 9.10.

[9:42] E aí, eu consigo ver a coisa ordenada por garrafas, e eu posso colocar aqui assim: antes, aqui, eu posso colocar um WHERE, digamos assim: são produtos, vamos ver que campos eu tenho, aqui, de produtos. Por exemplo, tamanho. Não, sabor. Eu só quero ver isso com produtos de sabor uva. Uva tem pouco, vamos pegar um produto aqui: laranja, manga tem bastante produto, tem três aqui.

[10:26] Então eu posso botar isso aqui: sabor, igual a manga. Então, ao fazer esse igual a manga, e se eu rodar esse SELECT todo, o que eu estou vendo? Garrafa barata e média, só para as mangas, é 15.17. Os em conta, 7.71. Lata, em média, produtos do sabor manga, produtos baratos, custam 3,85.

[11:03] Ou seja, eu posso começar a fazer comandos de SQL complexos, misturando tudo que eu estou aprendendo desde os primeiros vídeos desse curso. Então, eu quis dar esse exemplo aqui, um pouquinho mais complexo, para vocês entenderem até onde a gente vai chegar com o SQL.

Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação.
SELECT NOME,
CASE WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'WHEN YEAR(data_de_nascimento) >= 1990 AND
YEAR(data_de_nascimento) <= 1995 THEN 'Jovens' 
ELSE 'Crianças' END
FROM tabela_de_clientes