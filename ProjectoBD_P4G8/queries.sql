-- Queries

-- 1. Lista com todos os funcionarios
select*from cafe.Funcionario

select*from cafe.Cliente

--2. Lista com os funcion�rios supervisionados
select * from cafe.Funcionario
where SuperFunc is not null

--3. Lista com todos os funcion�rios supervisionados pela Dona Alcina
select nomeFunc as Nome_Funcionario, numFunc as Numero, SuperFunc as Supervisor
from (cafe.Funcionario Join((select numFunc as Supervisor
							from cafe.Funcionario
							where nomeFunc='Dona Alcina')) as Sp
							on Funcionario.SuperFunc = Sp.Supervisor);


-- 4.Lista de CLientes que efectuaram compras
select nomeCli as NomeCliente, NIF
from cafe.Cliente Join cafe.Compras on NIF=compras_nifCli

-- 5. Lista de Clientes que n�o efectuaram qualquer compra
select nomeCli as NomeCliente, NIF
from cafe.Cliente Left Outer Join cafe.Compras on NIF=compras_nifCli
where compras_nifCli is null


-- 6. Lista de todos os Fornecedores
select *from cafe.Fornecedor

-- 7. Lista de Fornecedores que tamb�m s�o clientes
select nomeForn as Nome, moradaForn as Morada
from cafe.Fornecedor, cafe.Cliente
where CC_Forn=CC_Cliente

--8. Lista de Funcion�rios que tamb�m s�o clientes
select nomeFunc as Nome_Funcion�rio, moradaFunc as Morada
from cafe.Funcionario, cafe.Cliente
where CCFunc=CC_Cliente

--9. Numero compras registadas pelo funcion�rio numero 4
select nomeFunc as Nome_Funcion�rio, count(n�compra) as pedidos_atendidos
from cafe.Funcionario Join cafe.Compras on numFunc=compras_numFunc
where numFunc=4
group by nomeFunc

--10. Quantidade de compras efectuadas por dinheiro, por Cliente
select nomeCli as Nome_Cliente, NIF, count(n�compra) as Compras_efectuadas
from cafe.Cliente Join cafe.Compras on NIF=compras_nifCli
where forma_pagamento='dinheiro'
group by nomeCli, NIF

-- 11. Numero total de vendas por produto
select nomeProd, count(unidades) as TotalProdutoVendido
from cafe.Contidos Join cafe.Produto on prodID_cont=prodID 
group by nomeProd

delete from cafe.Funcionario
where numFunc = 12345


-- 12. Compras efectuadas, total gasto e produto comprados por um cliente

select nomeCli,n�compra_contid, sum(preco) as Total, NIF
from (((cafe.Cliente Join cafe.Compras on NIF=compras_nifCli) Join cafe.Contidos on n�compra = n�compra_contid) Join cafe.Produto on prodID_cont = prodID)   
where NIF = 768362101 
group by nomeCli, n�compra_contid, NIF


select *from cafe.Compras