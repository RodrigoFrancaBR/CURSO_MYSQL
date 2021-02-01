
SELECT * FROM tabela_de_clientes;

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;

SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_Produtos GROUP BY EMBALAGEM;

SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes GROUP BY BAIRRO;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
GROUP BY ESTADO, BAIRRO;

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO;

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
WHERE CIDADE = 'Rio de Janeiro' 
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;

[0:00] Vamos falar agora de agrupar o resultado. 
A gente viu no vídeo anterior como eu ordeno a resposta,
eu agora vou falar como eu agrupo a resposta.

[0:11] E o que é agrupar a resposta?
Agrupar a resposta é juntar campos que são repetidos 
e no caso dos campos numéricos quando eu faço essa junção eu posso aplicar
uma fórmula matemática, que pode ser soma, média, máximo, mínimo valor.

[0:31] Bem, para gente entender melhor, olha aqui do lado, eu tenho uma tabela,
campo X e campo Y, o campo X tem letras e o campo Y tem valores. 
Então se eu executar esse Select o campo X FROM a tabela, GROUP BY esse campo X,
eu vou agrupar quem está igual, então esse A e esse A vão virar uma linha 
só e esse 2 e esse 1 vão virar o número 3.

[1:02] Por quê? Porque eu vou aplicar esta consulta aqui usando o SUM desse campo. 
Então a minha seleção vai ficar assim, a minha resposta vai ficar assim: o A vai ficar com 3, o B com 6, o C com 8 e D com 3.

[1:25] Eu posso aplicar então lá no momento do GROUP BY não somente soma, que é SUM, mas eu posso aplicar o máximo, o mínimo, a média e o COUNT, ele vai contar o número de linhas que existem no momento que eu agrupo as informações.

[1:46] Então, por exemplo, o SUM, essa tabela que está ao lado o SUM eu vou ter essa resposta.

[1:51] O máximo no caso do A é 2, porque aqui onde tem A eu tenho o 1 e tenho o 2, quem é o máximo é o 2. No caso de B, o B eu tenho na primeira linha 2, na segunda 3 e na terceira 1, então máximo será o 3, e assim por diante.

[2:11] O mínimo é ao contrário, do meu agrupamento eu só vou selecionar os menores valores.

[2:22] O AVG faz uma média, no caso do A ele vai pegar o 2 mais 1 é três dividido por dois dá 1,5. O B ele vai pegar 2 mais 3, 5, mais um 6, divide por 3, que são três linhas que eu tenho, vai dar 2.

[2:42] E o COUNT é o número de ocorrências, no caso do A eu tenho duas linhas, então aparece 2, no caso do B eu tenho três linhas, aparece o 3 e o C trem três linhas, 3, e o D tem uma linha só, aparece o 1. Está bom?

[2:59] Quando a gente omite dentro do Select o campo que a gente quer usar como critério de agregação e a gente coloca somente o SUM de alguma coisa, o AVG, ou mínimo ou máximo ou o COUNT, eu não preciso colocar a cláusula GROUP BY. Então se eu fizer isso daqui, Select SUM de Y ele vai pegar a soma de todo mundo e só vai escrever aqui o número 20. Tá bom?

[3:28] Se for máximo seria um 1, o mínimo, desculpe, seria 1, menor número daqui da lista é o 5, o AVG seria a média de todo mundo aqui e o COUNT seria 9 porque eu tenho nove linhas.

[3:46] O.k., vamos no Work Bench fazer alguns exemplos. Então eu vou criar aqui uma nova consulta e eu vou pegar agora aqui a tabela de clientes. Eu vou fazer uma seleção agora do estado e depois o limite de crédito da tabela de clientes.

[4:26] Ao fazer isso eu estou vendo lá São Paulo, esse é o limite de crédito, depois um cliente do Rio tem isso, depois outro cliente do Rio tem isso, assim por diante.

[4:37] Mas eu quero agrupar, eu quero saber por exemplo qual é o total de limite de créditos que eu tenho em São Paulo e qual é o total de limite de crédito que eu tenho no Rio, então posso fazer isso daqui: Select, ESTADO, SUM de limite de crédito, um parênteses, quando a gente utiliza uma fórmula, o SUM é uma fórmula, o nome do campo eu tenho que colocar um alias, então eu vou botar AS LIMITE_TOTAL FROM tabela_de_clientes.

[5:18] Mas não acabou ainda não, eu tenho que colocar um GROUP BY o ESTADO, que é o campo que vai agrupar a informação. Se eu rodar, eu tenho limite de crédito total, São Paulo, 810.000 de limite de crédito, e Rio de Janeiro, 995.000 de limite de crédito. Ele juntou todo mundo.

[5:51] Vamos pegar aqui a embalagem e vamos pegar a informação sobre o preço de lista, FROM, aqui no caso é a tabela_de_produtos.

[6:14] Estou tendo uma consulta aqui, eu quero saber o seguinte: qual é o produto mais caro PET, qual é o mais caro Garrafa e qual é o mais caro lata. Então eu posso vir aqui, você vai dar um Select, EMBALAGEM, MAX de PRECO_DE_LISTA, vou botar como alias o maior preço FROM tabela_de_produtos GROUP BY EMBALAGEM.

[7:05] Vamos ver como é que ficou? Então está lá, o produto mais caro de Garrafa, eu não sei qual é o produto, mas o preço mais caro de Garrafa é R$13,31, o preço mais caro de PET seria R$38,01 e o produto mais caro de Lata custaria R$4,56, ok?

[7:36] A gente pode também fazer um COUNT, ou seja, se eu fizer isso aqui, EMBALAGEM, só que em vez de MAX eu dou um COUNT, vou chamar esse cara de contador, FROM tabela_de_produtos GROUP BY EMBALAGEM.

[8:07] Pronto, agora acertei o comando. Então eu tenho onze produtos que são Garrafa, quinze que são PET e cinco que são Lata. Eu posso aplicar dentro de um GROUP BY, ou até mesmo de um ORDER BY, critérios de filtro, então por exemplo, Select, vamos pegar aqui a gente tem bairro? Nós temos bairro, então eu vou pegar os bairros e vou pegar o SUM de limite_de_credito FROM tabela_de_clientes GROUP BY BAIRRO.

[9:20] Então se eu rodar isso daqui, vamos lá que eu errei alguma coisa aqui, é tabela_de_clientes, pronto, agora vai.

[9:36] Então pronto, eu tenho lá um limite de crédito por exemplo dos Jardins, de Água Santa, da Tijuca, da Inhaúma, mas eu quero, por exemplo, somente da cidade Rio de Janeiro então eu posso colocar aqui antes do GROUP BY eu coloco um WHERE CIDADE igual a Rio de Janeiro.

[10:05] Ou seja, eu só vou agrupar quem é bairro da cidade do Rio de Janeiro; se eu rodar aqui ele só vai mostrar os bairros da cidade do Rio de Janeiro. Ok?

[10:24] Eu posso ter no meu GROUP BY mais de um campo, por exemplo, eu posso fazer isso daqui: ESTADO, BAIRRO, só que aí no GROUP BY eu tenho que colocar na mesma ordem. Quer dizer, na mesma ordem não, eu posso até exibir de ordens diferentes, essa ordem aqui não precisa ser igual a essa, essa ordem de cima é a que eu vou exibir os dados e a de baixo é a que eu vou agrupar os dados.

[11:06] Então fazendo isso eu tenho lá os dados agrupados e aí, claro, se eu pegar essa última consulta eu posso por exemplo aplicar aqui o filtro, mas a gente consegue ver bastante coisa do resultado.

[11:25] Então eu estou agrupando por estado e bairro, estou pegando a soma do limite de crédito e estou olhando isso somente para a cidade do Rio de Janeiro. Executando isso aparece aqui o RJ, todo mundo é RJ porque foi filtro Rio de Janeiro e aqui aparece os bairros ordenados, ordenados não, agrupados.

[11:54] Eu poderia, se eu quiser ver isso agrupado e ordenado eu posso fazer isso, basta eu fazer isso daqui, agora esse Select é mais complexo: GROUP BY ESTADO BAIRRO ORDER BY BAIRRO, por exemplo.

[12:20] Ou seja, eu estou agrupando por esses campos e estou ordenando por esse. Se eu rodar aqui, note, além de agrupado eu estou vendo A de Água Santa, depois B de Barra, C de Cidade Nova, H de Humaitá e assim por diante.

[12:45] Então nesse Select último aqui eu estou agrupando, ordenando e filtrando, tudo dentro de um único comando SQL. Está legal? É isso aí gente, valeu.