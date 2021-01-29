
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
WHERE SOMA_LIMITE > 900000
GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

[0:00] Vamos falar do HAVING. O HAVING, ele é um filtro, mas que se aplica não sobre o meu SELECT, mas sobre o resultado de um SELECT que é agrupado.

[0:15] Por exemplo, digamos que eu tenha uma tabela com o Campo X e o Campo Y. Eu executo esse comando aqui: SELECT, X, SUM de Y, FROM, TAB GROUP BY X. Então, eu vou ter aqui, o A vai virar 3 - dois mais um, três - o B vai virar seis, o C vai virar oito, e o D vai virar três.

[0:44] E aí, desse resultado aqui, eu só quero pegar elementos cuja soma, o GROUP BY, dê maior que seis. Então, vai ser o B e o C. Para fazer isso, eu utilizo o HAVING. Eu coloco isso depois do meu GROUP BY, aí eu coloco o HAVING e a condição, ok?

[1:15] Vamos fazer exemplos práticos disso aqui. Vou criar um novo script, vou pegar aqui um SELECT, Estado, SUM de limite de crédito, vou chamar esse cara, vou botar como alias, por exemplo, uma soma limite, FROM, tabela de clientes, GROUP BY. Então, vamos rodar.

[2:00] Aqui, errei, esqueci o underscore aqui em tabela de clientes. Vamos lá, rodei. Aí eu tenho lá, como resultado: São Paulo, 810 mil; Rio de Janeiro, 995 mil.

[2:17] Então, eu quero só listar o estado cuja soma do limite de crédito foi maior que 900 mil. Como eu tenho isso aqui como aliás, eu poderia fazer o seguinte: WHERE, soma limite, maior que 900 mil. Seria uma coisa mais natural.

[2:50] Se eu rodar esse comando, eu tenho um erro, eu não consigo rodar esse comando. Por quê? Porque, quando eu aplico WHERE, o GROUP BY ainda não aconteceu, ok?

[3:08] Então, para fazer esse limite, eu faço assim: então esse cara não tem, vamos apagar essa linha, e aí eu coloco HAVING, SUM de limite de crédito, maior que 900 mil. Ou seja, eu aplico o HAVING à condição que eu quero depois de eu agrupar, depois do GROUP BY. Vamos executar? Aí eu tenho lá, é o Rio de Janeiro, 995 mil.

[4:02] Eu posso, por exemplo, juntar mínimo com HAVING, com SUM; não necessariamente o critério que eu uso aqui tem que ser igual ao critério que eu uso aqui.

[4:21] Vamos pegar aqui um exemplo: eu vou pegar SELECT, embalagem, e vou pegar o MAX do preço de lista, e vou pegar o mínimo do preço de lista. Então peguei o máximo e o mínimo, FROM, tabela de produtos, GROUP BY, embalagem.

[5:09] Esse aqui é até um exemplo legal, que note que eu coloquei, no mesmo SELECT, um MAX, e um mínimo. Não tem problema; ele vai me mostrar, para cada embalagem, o maior e menor valor. Eu vou até botar um alias aqui, maior preço, e aqui eu vou colocar um AS menor preço.

[5:42] Vamos rodar de novo, só para ver como é que fica. Então está lá: garrafa, o produto que tem o maior preço é 13, e o que tem o menor é o 3,7. Pet, o mais caro é 38, e o mais barato, 7. Lata, o mais caro é 4,56, e o mais barato é 2,80.

[6:08] Mas aí eu poderia dizer o seguinte: eu só quero ver o maior ou o menor preço, por exemplo, de produtos cujo preço de lista seja menor que 80. Então eu posso colocar isso daqui: HAVING, SUM de preço de lista, é menor ou igual a 80.

[6:41] Então, quando eu rodar isso daqui, eu só vou ter o resultado, do maior e do menor preço de embalagens, respeitando essa condição aqui.

[6:56] Então, você vê que o MAX e o mínimo foram usados dentro do SELECT, e no HAVING, eu usei o SUM.

[7:07] E eu posso, também, fazer coisas desse tipo aqui: AND, por exemplo, MAX, preço de lista, por exemplo, maior ou igual que cinco. Então olha só, que lata, eu tenho um quatro aqui, vamos ver se ela vai continuar aparecendo? Não aparece mais, porque essa condição aqui, fez com que a lata desaparecesse.

[7:43] Então, dentro do HAVING, eu também posso estar usando um filtro composto, usando AND, OR, OR com AND, e assim por diante.

Quais foram os clientes que fizeram mais de 2000 compras em 2016?