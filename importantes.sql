
DROP TRIGGER IF EXISTS TG_CALCULAR_PRECO_TOTAL_INSERT;

DELIMITER //
CREATE TRIGGER -- CRIA TRIGGER
	TG_CALCULAR_PRECO_TOTAL_INSERT -- NOME_DA_TRIGGER
AFTER INSERT -- DEPOIS_DO_INSERT
ON TB_ITEM_NOTA_FISCAL -- NA_TABELA
FOR EACH ROW -- PARA_CADA_LINHA_AFETADA_FAÇA
BEGIN -- INICIO
-- ESTRUTURA_DO_TRIGGER		
	INSERT INTO TB_FATURAMENTO (ID,PRECO_TOTAL) 
	VALUES (NEW.ID,NEW.PRECO_UNITARIO*NEW.QUANTIDADE);
-- FIM_DA_ESTRUTURA_TRIGGER    
END//
DELIMITER ;

Podemos sim usar ROLLBACKs seguidos num mesmo script,
 mesmo que não haja iniciado nova transação.
  Mais o comando se torna inútil porque nada acontece.



UPDATE CLIENTES A INNER JOIN VENDEDORES B
ON A.BAIRRO = B.BAIRRO
SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;

USE sucos_vendas; -- define qual banco está usando;
select cpf as identificador from tabela_de_clientes as clientes;
select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889'; -- filtrando por codigo de produto
select * from tabela_de_produtos where sabor = 'uva'; -- se busca por sabor é algo muito usado, deve se criar indices 
select * from tabela_de_produtos where EMBALAGEM = 'Pet';
select * from tabela_de_produtos where PRECO_DE_LISTA = 19.51; -- float não traz nada se for consulta exata
select * from tabela_de_produtos where PRECO_DE_LISTA between 19.49 and 19.51; -- todos os produtos que custam a partir de 19.51 até 19.52
select * from tabela_de_produtos where PRECO_DE_LISTA >= 19.49 and PRECO_DE_LISTA <= 19.51;
select * from tabela_de_produtos;

select embalagem, SUM(preco_de_lista) as soma from tabela_de_produtos group by embalagem;
select embalagem, count(*) from tabela_de_produtos group by embalagem;
select *, max(PRECO_DE_LISTA) from tabela_de_produtos group by embalagem; 
select * from tabela_de_produtos group by embalagem;

select tamanho, embalagem from tabela_de_produtos group by tamanho,EMBALAGEM;

select * from tabela_de_produtos where 
tamanho = '1 Litro' or tamanho = '1,5 Litros' or tamanho = '2 Litros';

select * from tabela_de_produtos 
where tamanho = '1 Litro' or
 tamanho = '1,5 Litros' or
 tamanho = '2 Litros';
 
 select estado, limite_de_credito from tabela_de_clientes;
 select estado, sum(limite_de_credito) as LIMITE_DE_CREDITO from tabela_de_clientes group by estado;



select sum(preco_de_lista), embalagem from tabela_de_produtos where embalagem = 'Garrafa';

select EMBALAGEM, PRECO_DE_LISTA from tabela_de_produtos group by embalagem;
select embalagem, count(*) from tabela_de_produtos group by embalagem;


-- total de limite de credito por bairro do rio de janeiro
select bairro, cidade, sum(limite_de_credito) from tabela_de_clientes group by bairro, cidade;
select cidade, bairro, sum(limite_de_credito) from tabela_de_clientes where cidade = 'Rio de Janeiro' group by cidade, bairro order by bairro desc;

-- quantos itens de venda existem com a maior quantidade do produto '1101035'?
select count(*) from tabela_de_produtos;
select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '1101035';

select * from notas_fiscais;

select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035';
select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' and QUANTIDADE = 98;
select codigo_do_produto, quantidade from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' group by quantidade;

select count(*), quantidade, max(quantidade) from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' group by quantidade order by QUANTIDADE desc;

select quantidade as groupQuantidade
, count(*) as qtd 
,sum(preco)
,max(quantidade)
from itens_notas_fiscais 
where CODIGO_DO_PRODUTO = '1013793' 
group by quantidade 
-- order by quantidade desc
-- limit 1
having(max(quantidade)) = 99
;


select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1013793' and quantidade = 14;

select sum(preco) from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1013793' and quantidade = 14;

select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' and quantidade = 99;

select count(*) from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' and quantidade = 99;


SELECT CODIGO_DO_PRODUTO
-- , quantidade
, max(QUANTIDADE) as MAIOR_QUANTIDADE 
-- , count(Quantidade) 
FROM itens_notas_fiscais 
WHERE CODIGO_DO_PRODUTO = '1101035' group by QUANTIDADE 
-- order by MAIOR_QUANTIDADE 
-- desc limit 1;
;






SELECT EMBALAGEM
,sum(preco_de_lista)
,MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM
 HAVING SUM(PRECO_DE_LISTA) <= 80
;

select * from notas_fiscais where cpf = '1471156710' and data_venda = '2015-01-01';
select * from notas_fiscais where data_venda like '%2016%';

-- Quais foram os clientes que fizeram mais de 2000 compras em 2016?
select cpf
, data_venda 
, count(*) as qtd
from notas_fiscais 
where DATA_VENDA like '%2016%'
-- where cpf = '7771579779' 
group by cpf 
having qtd >2000
;



SELECT CPF, DATA_DE_NASCIMENTO,
	CASE -- CASO 
	WHEN YEAR (DATA_DE_NASCIMENTO) < 1990
	THEN 'VELHOS'
END AS CLASSIFICACAO
FROM tabela_de_clientes;


-- INNER JOIN -- TUDO QUE É COMUM ENTRE AS 2 TABELAS 

-- ESQUERDA A = { CHAVE = (1,3,4,6) VALOR = (J,M,PE,C) } 

-- DIREITA B = { CHAVE = (1,3,5,8) VALOR = (PR,FU,FO,A) } 

-- INNER JOIN = {CHAVE = 1,3 VALOR JPR,MFU}

-- LEFT JOIN -- TUDO DA ESQUERDA DO JOIN E O QUE É COMUM ENTRE AS 2 TABELAS 
-- LEFT JOIN = {CHAVE = 1,3,4,6 VALOR JPR,MFU,PEnull,Cnull }


-- RIGHT JOIN -- TUDO DA DIREITA DO JOIN E O QUE É COMUM ENTRE AS 2 TABELAS 
-- RIGHT JOIN = {CHAVE = 1,3,5,8 VALOR JPR,MFU,FOnull,Anull }

-- FULL JOIN --TUDO QUE É COMUM ENTRE AS 2 TABELAS E O QUE NÃO FOR COMUM VEM NULL
-- FULL JOIN = {CHAVE = 1,3,5,8 VALOR JPR, MFU, PEnull, Cnull, FOnull, Anull }

-- CROSS JOIN SELECT SEM MOSTRAR COMO AS TABELAS SE RELACIONAM 
-- 2 TABELAS COM 4 REGISTROS CADAS, GERA 16 LINHAS alter
-- PARA CADA REGISTRO DE UMA TABELA ESTE SE RELACIONA COM OS 4 REGISTROS DA OUTRA TABELA 

-- CROSS JOIN = {CHAVE = 1,3,4,6 VALOR JPR, MPR, PEPR, CPR }ETC...




-- QUANTAS NOTAS FISCAIS CADA VENDEDOR EMITIU
SELECT * FROM tabela_de_vendedores;
SELECT A.NOME
		,A.BAIRRO
		,A.MATRICULA
        ,COUNT(*) AS VENDAS 
        FROM TABELA_DE_VENDEDORES AS A -- ESQUERDA 
        INNER JOIN notas_fiscais AS B -- DIREITA
        ON A.MATRICULA = B.MATRICULA
        group by A.MATRICULA;

SELECT * FROM notas_fiscais ORDER BY DATA_VENDA DESC;
SELECT * FROM itens_notas_fiscais WHERE QUANTIDADE = 63 AND CODIGO_DO_PRODUTO = 773912;
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = 773912;

SELECT DATA_VENDA 
	    ,B.NUMERO
		,A.CODIGO_DO_PRODUTO
        ,A.QUANTIDADE
        ,C.PRECO_DE_LISTA PRECO_UNITARIO
        -- ,(A.QUANTIDADE * PRECO_DE_LISTA) PRECO_TOTAL
        ,SUM(A.QUANTIDADE * PRECO_DE_LISTA) TOTAL
-- FROM notas_fiscais A
FROM  itens_notas_fiscais A
INNER JOIN notas_fiscais B
-- INNER JOIN itens_notas_fiscais B
ON  A.NUMERO = B.NUMERO
INNER JOIN tabela_de_produtos C
ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
-- WHERE A.NUMERO = 100
-- GROUP BY DATA_VENDA
WHERE YEAR(DATA_VENDA) = 2018

GROUP BY DATA_VENDA 
	    ,B.NUMERO
		,A.CODIGO_DO_PRODUTO
        ,A.QUANTIDADE
        ,C.PRECO_DE_LISTA 
        -- ,(A.QUANTIDADE * PRECO_DE_LISTA) 
        -- ,SUM(A.QUANTIDADE * PRECO_DE_LISTA)
HAVING (NUMERO)  = 82539
        ORDER BY NUMERO
;
-- 134.1899971961975

SELECT DATA_VENDA 
	    ,B.NUMERO
		,A.CODIGO_DO_PRODUTO
        ,A.QUANTIDADE
        ,C.PRECO_DE_LISTA PRECO_UNITARIO
        -- ,(A.QUANTIDADE * PRECO_DE_LISTA) PRECO_TOTAL
        ,SUM(A.QUANTIDADE * PRECO_DE_LISTA)
-- FROM notas_fiscais A
FROM  itens_notas_fiscais A
INNER JOIN notas_fiscais B
-- INNER JOIN itens_notas_fiscais B
ON  A.NUMERO = B.NUMERO
INNER JOIN tabela_de_produtos C
ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
-- WHERE A.NUMERO = 100
-- GROUP BY DATA_VENDA
WHERE YEAR(DATA_VENDA) = 2018
AND A.NUMERO = 82540
;

SELECT * from tabela_de_clientes;
SELECT * FROM NOTAS_FISCAIS;

SELECT A.CPF
	  ,A.NOME
      ,B.NUMERO
FROM tabela_de_clientes A -- ESQUERDA
-- right JOIN
-- INNER JOIN 
LEFT JOIN
NOTAS_FISCAIS B -- DIREITA
ON A.CPF = B.CPF
GROUP BY A.CPF
;
