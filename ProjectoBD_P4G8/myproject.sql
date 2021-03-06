USE [p4g8]
GO
/****** Object:  Schema [cafe]    Script Date: 05/06/2015 22:34:49 ******/
CREATE SCHEMA [cafe]
GO
/****** Object:  StoredProcedure [cafe].[SearchFunc]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [cafe].[SearchFunc](@filter varchar(20))
as
begin
	select *from cafe.Funcionario 
	where nomeFunc like +@filter+'%'
end
GO
/****** Object:  StoredProcedure [cafe].[sp_Contidos_INS_byPK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_Contidos_INS_byPK]
       @numcompra_contid             int, 
       @produtoID_cont				    int, 
       @unidades                    int 
                   
AS 

BEGIN 
     SET NOCOUNT ON 

     INSERT INTO cafe.Contidos
          ( 
            nºcompra_contid,                   
            prodID_cont,                    
            unidades                                  
          ) 
     VALUES 
          ( 
            @numcompra_contid,                   
            @produtoID_cont,                    
            @unidades                      
          ) 
END 


GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteCliente_by_CC]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteCliente_by_CC]

	@ccCliente int
as
	delete from cafe.Cliente 
	where CC_Cliente = @ccCliente

GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteCompras_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteCompras_by_PK]

	@numCompra int
as
	delete from cafe.Compras 
	where nºcompra = @numCompra

GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteEncomenda_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteEncomenda_by_PK]

	@numEncomenda int
as
	delete from cafe.Encomenda 
	where nºencomenda = @numEncomenda

GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteForn_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteForn_by_PK]

	@codigoFornecedor int
as
	delete from cafe.Fornecedor 
	where codigo_interno = @codigoFornecedor

GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteFunc_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteFunc_by_PK]

	@numFuncionario int
as
	delete from cafe.Funcionario 
	where numFunc = @numFuncionario 


GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteHorario_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteHorario_by_PK]

	@turnoFunc varchar(20)
as
	delete from cafe.horario 
	where turno = @turnoFunc

GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteProduto_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteProduto_by_PK]

	@IDProd int
as
	delete from cafe.Produto 
	where prodID = @IDProd

GO
/****** Object:  StoredProcedure [cafe].[sp_DeleteReclamacao_by_PK]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_DeleteReclamacao_by_PK]

	@numReclam int
as
	delete from cafe.Reclamacao 
	where nºreclamacao = @numReclam

GO
/****** Object:  StoredProcedure [cafe].[sp_InsertCliente]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertCliente]
	@NomeCli varchar(20),
	@CCCliente int,
	@NIF int,
	@MoradaCli varchar(35),
	@TelefoneCli int
 
as
 
	begin 
		insert into cafe.Cliente(nomeCli, CC_Cliente, NIF, moradaCli, telefoneCli) 
		values(@NomeCli, @CCCliente, @NIF, @MoradaCli, @TelefoneCli)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertCompras]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertCompras]
	@numero int,
	@pagamento varchar(20),
	@data date,
	@nomeProdutos varchar(35),
	@FuncAtendeu int,
	@NIFCliente int
 
as
 
	begin 
		insert into cafe.Compras(nºcompra, forma_pagamento, data_compra, nome_prod, 
					compras_numFunc, compras_nifCli) 
		values(@numero, @pagamento, @data, @nomeProdutos, @FuncAtendeu, @NIFCliente)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertEncomendas]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [cafe].[sp_InsertEncomendas]
	@numero int,
	@data date,
	@quantity int,
	@codFornecedor varchar(20),
	@FuncResponsavel int
 
as
 
	begin 
		insert into cafe.Encomenda(nºencomenda, data_realizacao, quantidade, Enc_cod_int, enc_numFunc) 
		values(@numero, @data, @quantity, @codFornecedor, @Funcresponsavel)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertForn]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertForn]
	@NomeForn varchar(20),
	@CCForn int,
	@codigo varchar(20),
	@MoradaForn varchar(20),
	@TelefoneForn int,
	@Fax int,
	@pagamento varchar(20)
 
as
 
	begin 
		insert into cafe.Fornecedor(nomeForn, CC_Forn, codigo_interno, moradaForn, 
					telefoneForn, fax, forma_pag) 
		values(@NomeForn, @CCForn, @codigo, @MoradaForn, @TelefoneForn, @Fax, @pagamento)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertFunc]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertFunc]
	@NomeFunc varchar(20),
	@CCFunc int,
	@NumFunc int,
	@MoradaFunc varchar(35),
	@TelefoneFunc int,
	@SalarioFunc decimal(10,2),
	@SuperFunc int, 
	@TurnoFunc varchar(20)
 
as
 
	begin 
		insert into cafe.Funcionario(nomeFunc, CCFunc, numFunc, moradaFunc, telefoneFunc, salario, SuperFunc, turnoFunc) 
		values(@NomeFunc, @CCFunc, @NumFunc, @MoradaFunc, @TelefoneFunc, @SalarioFunc, @SuperFunc, @TurnoFunc)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertHorario]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertHorario]
	@horario varchar(20),
	@horas int
 
as
 
	begin 
		insert into cafe.horario(turno, numeroHoras) 
		values(@horario, @horas)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertProdutos]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertProdutos]
	@ID int,
	@nomeproduto varchar(20),
	@tipo varchar(20),
	@price decimal(10,2),
	@FuncServiu int,
	@EncomendaProd int
 
as
 
	begin 
		insert into cafe.Produto(prodID, nomeProd, familia, preco, prod_numFunc, prod_nºencomenda) 
		values(@ID, @nomeproduto, @tipo, @price, @FuncServiu, @EncomendaProd)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_InsertReclamacao]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_InsertReclamacao]
	@numeroRecla int,
	@motivoRecla varchar(15),
	@NIFRecla int
 
as
 
	begin 
		insert into cafe.Reclamacao(nºreclamacao, motivo, reclam_nifCli) 
		values(@numeroRecla, @motivoRecla, @NIFRecla)
	end 


GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateCliente]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateCliente]
	@NomeCli varchar(20),
	@CCCliente int,
	@NIF int,
	@MoradaCli varchar(35),
	@TelefoneCli int
 
AS
	BEGIN
		UPDATE cafe.Cliente
		SET nomeCli =  @NomeCli, CC_Cliente = @CCCliente, NIF = @NIF, moradaCli = @MoradaCli, 
				telefoneCli = @TelefoneCli
		WHERE CC_Cliente = @CCCliente
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateCompras]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateCompras]
	@numero int,
	@pagamento varchar(20),
	@data date,
	@nomeProdutos varchar(35),
	@FuncAtendeu int,
	@NIFCliente int
 
AS
	BEGIN
		UPDATE cafe.Compras
		SET nºcompra = @numero, forma_pagamento = @pagamento, data_compra = @data, nome_prod = @nomeProdutos, 
			compras_numFunc = @FuncAtendeu, compras_nifCli = @NIFCliente  
		WHERE nºcompra = @numero  
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateEncomendas]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateEncomendas]
	@numero int,
	@data date,
	@quantity int,
	@codFornecedor varchar(20),
	@FuncResponsavel int
 
AS
	BEGIN
		UPDATE cafe.Encomenda
		SET nºencomenda =  @numero, data_realizacao = @data, quantidade = @quantity, Enc_cod_int = @codFornecedor, enc_numFunc = @FuncResponsavel 
		WHERE nºencomenda = @numero 
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateFornecedor]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateFornecedor]
	@NomeForn varchar(20),
	@CCForn int,
	@codigo varchar(20),
	@MoradaForn varchar(20),
	@TelefoneForn int,
	@Fax int,
	@pagamento varchar(20)
 
AS
	BEGIN
		UPDATE cafe.Fornecedor
		SET nomeForn =  @NomeForn, CC_Forn = @CCForn, codigo_interno = @codigo, moradaForn = @MoradaForn, 
				telefoneForn = @TelefoneForn, fax = @Fax, forma_pag = @pagamento
		WHERE CC_Forn = @CCForn
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateFunc]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateFunc]
	@NomeFunc varchar(20),
	@CCFunc int,
	@NumFunc int,
	@MoradaFunc varchar(35),
	@TelefoneFunc int,
	@SalarioFunc decimal(10,2),
	@SuperFunc int, 
	@TurnoFunc varchar(20)
 
AS
	BEGIN
		UPDATE cafe.Funcionario
		SET nomeFunc =  @NomeFunc, CCFunc = @CCFunc, numFunc = @NumFunc, moradaFunc = @MoradaFunc, 
				telefoneFunc = @TelefoneFunc, salario = @SalarioFunc, SuperFunc = @SuperFunc, turnoFunc = @TurnoFunc 
		--WHERE CCFunc = @CCFunc
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateHorario]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateHorario]
	@horario varchar(20),
	@horas int

AS
	BEGIN
		UPDATE cafe.horario
		SET turno = @horario, numeroHoras = @horas
		WHERE numeroHoras = @horas 
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateProdutos]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateProdutos]
	@ID int,
	@nomeproduto varchar(20),
	@tipo varchar(20),
	@price decimal(10,2),
	@FuncServiu int,
	@EncomendaProd int
 
AS
	BEGIN
		UPDATE cafe.Produto
		SET prodID = @ID, nomeProd = @nomeproduto, familia = @tipo, preco = @price, 
				prod_numFunc = @FuncServiu, prod_nºencomenda = @EncomendaProd 
		WHERE prodID = @ID 
	END

GO
/****** Object:  StoredProcedure [cafe].[sp_UpdateReclamacao]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [cafe].[sp_UpdateReclamacao]
	@numeroRecla int,
	@motivoRecla varchar(15),
	@NIFRecla int

AS
	BEGIN
		UPDATE cafe.Reclamacao
		SET nºreclamacao = @numeroRecla, motivo = @motivoRecla, reclam_nifCli = @NIFRecla 
		WHERE nºreclamacao = @numeroRecla 
	END

GO
/****** Object:  StoredProcedure [dbo].[removeEmployee]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[removeEmployee]
	@ssn int
as
	delete from company.[dependent] where Essn = @ssn;
	delete from company.works_on where Essn = @ssn;
	update company.department set Mgr_ssn=null where Mgr_ssn=@ssn; 
	delete from company.employee where Ssn = @ssn;

GO
/****** Object:  StoredProcedure [dbo].[returnCliente]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[returnCliente]

	@nome varchar(20) output

as
	
		select c.nomeCli, c.CC_Cliente, c.moradaCli, c.telefoneCli
		from cafe.Cliente c
		where c.nomeCli = @nome


GO
/****** Object:  StoredProcedure [dbo].[returnCompra]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[returnCompra]

	@num int output

as
		select c.nºcompra, c.forma_pagamento, c.data_compra , c.nome_prod
		from cafe.Compras c
		where c.nºcompra = @num


GO
/****** Object:  StoredProcedure [dbo].[returnCompras]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[returnCompras]

	@num int output

as
		select c.nºcompra, c.forma_pagamento, c.data_compra , c.nome_prod
		from cafe.Compras c
		where c.nºcompra = @num


GO
/****** Object:  StoredProcedure [dbo].[returnEncomenda]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[returnEncomenda]

	@num int output

as
		select c.nºencomenda, c.data_realizacao, c.quantidade
		from cafe.Encomenda c
		where c.nºencomenda = @num


GO
/****** Object:  StoredProcedure [dbo].[returnFornecedores]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[returnFornecedores]

	@nome varchar(20) output

as
		select c.nomeForn, c.codigo_interno, c.moradaForn, c.telefoneForn, c.forma_pag
		from cafe.Fornecedor c
		where c.nomeForn = @nome


GO
/****** Object:  StoredProcedure [dbo].[returnFunc]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[returnFunc]

	@nome varchar(20) output

as
	
		select distinct f.nomeFunc, f.CCFunc, f.moradaFunc, f.telefoneFunc, f.salario, f.turnoFunc
		from cafe.funcionario f
		where f.nomeFunc = @nome


GO
/****** Object:  StoredProcedure [dbo].[returnProduto]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[returnProduto]

	@nome varchar(20) output

as
		select c.nomeProd, c.prodID, c.familia, c.preco
		from cafe.Produto c
		where c.nomeProd = @nome


GO
/****** Object:  StoredProcedure [dbo].[returnReclamacao]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[returnReclamacao]

	@num varchar(20) output

as
		select c.nºreclamacao, c.motivo, c.reclam_nifCli
		from cafe.Reclamacao c
		where c.nºreclamacao = @num


GO
/****** Object:  UserDefinedFunction [cafe].[compraTotalCliente]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [cafe].[compraTotalCliente](@clienteNIF int = null) returns @ClienteInfo 
	table(Total_Compras_Efectuadas int null, Produtos_Comprados varchar(75) null, Total_Gasto money null)

as
	begin
		insert @ClienteInfo select count(nºcompra), nome_prod, sum(preco)
			from (((cafe.Cliente Join cafe.Compras on NIF=compras_nifCli) Join cafe.Contidos on nºcompra = nºcompra_contid) Join cafe.Produto on prodID_cont = prodID)
			where NIF = @clienteNIF
			group by nome_prod
		return;
	end;

GO
/****** Object:  UserDefinedFunction [cafe].[compraTotalClienteTodos]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [cafe].[compraTotalClienteTodos]() returns @ClienteInfoToda 
	table(Total_Compras_Efectuadas int null, Produtos_Comprados varchar(75) null, Total_Gasto money null, NIF int null)

as
	begin
		insert @ClienteInfoToda select count(nºcompra), nome_prod, sum(preco), NIF
			from (((cafe.Cliente Join cafe.Compras on NIF=compras_nifCli) Join cafe.Contidos on nºcompra = nºcompra_contid) Join cafe.Produto on prodID_cont = prodID)
			group by nome_prod, NIF
		return;
	end;

GO
/****** Object:  UserDefinedFunction [cafe].[totalOrcamentoProduto]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [cafe].[totalOrcamentoProduto](@produto varchar(20) = null) 
		returns @orcamento table(nomeProduto varchar(20) null, Valor_Total money null, Total_vendido int null)
as
	begin
		insert @orcamento select nomeProd, sum(preco) as total, count(prodID)
						from cafe.Produto Join cafe.Contidos on prodID = prodID_cont
						where nomeProd = @produto
						group by nomeProd;
		return;
	end;

GO
/****** Object:  UserDefinedFunction [cafe].[totalOrcamentoTodosProdutos]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [cafe].[totalOrcamentoTodosProdutos]()
		returns @orcamentoTodos table(nomeProduto varchar(20) null, Valor_Total money null, Total_vendido int null)
as
	begin
		insert @orcamentoTodos select nomeProd, sum(preco) as total, count(prodID)
						from cafe.Produto Join cafe.Contidos on prodID = prodID_cont
						group by nomeProd;
		return;
	end;

GO
/****** Object:  Table [cafe].[Cliente]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Cliente](
	[nomeCli] [varchar](20) NOT NULL,
	[CC_Cliente] [int] NULL,
	[NIF] [int] NOT NULL,
	[moradaCli] [varchar](35) NULL,
	[telefoneCli] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[Compras]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Compras](
	[nºcompra] [int] NOT NULL,
	[forma_pagamento] [varchar](20) NULL,
	[data_compra] [date] NULL,
	[nome_prod] [varchar](35) NULL,
	[compras_numFunc] [int] NULL,
	[compras_nifCli] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nºcompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[Contidos]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cafe].[Contidos](
	[nºcompra_contid] [int] NOT NULL,
	[prodID_cont] [int] NOT NULL,
	[unidades] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nºcompra_contid] ASC,
	[prodID_cont] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [cafe].[Encomenda]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Encomenda](
	[nºencomenda] [int] NOT NULL,
	[data_realizacao] [date] NULL,
	[quantidade] [int] NULL,
	[Enc_cod_int] [varchar](20) NULL,
	[enc_numFunc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nºencomenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[Fornecedor]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Fornecedor](
	[nomeForn] [varchar](20) NOT NULL,
	[CC_Forn] [int] NULL,
	[codigo_interno] [varchar](20) NOT NULL,
	[moradaForn] [varchar](20) NULL,
	[telefoneForn] [int] NULL,
	[fax] [int] NULL,
	[forma_pag] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_interno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[Funcionario]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Funcionario](
	[nomeFunc] [varchar](20) NOT NULL,
	[CCFunc] [int] NULL,
	[numFunc] [int] NOT NULL,
	[moradaFunc] [varchar](35) NULL,
	[telefoneFunc] [int] NULL,
	[salario] [decimal](10, 2) NULL,
	[SuperFunc] [int] NULL,
	[turnoFunc] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[numFunc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[horario]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[horario](
	[turno] [varchar](20) NOT NULL,
	[numeroHoras] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[Produto]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Produto](
	[prodID] [int] NOT NULL,
	[nomeProd] [varchar](20) NULL,
	[familia] [varchar](20) NULL,
	[preco] [decimal](10, 2) NULL,
	[prod_numFunc] [int] NULL,
	[prod_nºencomenda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[prodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [cafe].[Reclamacao]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [cafe].[Reclamacao](
	[nºreclamacao] [int] NOT NULL,
	[motivo] [varchar](15) NULL,
	[reclam_nifCli] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nºreclamacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [cafe].[PesquisaFuncionario]    Script Date: 05/06/2015 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [cafe].[PesquisaFuncionario](@nomefuncionario varchar(20)) returns table
as
	return(select nomeFunc, CCFunc 
			from cafe.Funcionario
			where nomeFunc LIKE +@nomefuncionario+'%')


GO
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Timoteo Pereira', 2345346, 56746534, N'Rua do Pascoal', 912367990)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Susana Silva', 12345023, 123345691, N'Rua Assada, Aveiro', 962198910)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Arnaldo Freitas', 45373949, 123454321, N'Rua 25 Abril, Esgueira', 912389009)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Francisca Costa', 38749920, 124547093, N'Rua das Avessas, Estarreja', 912345761)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Anabela Reis', 39845821, 132456545, N'Travessa Gil, Ovar', 932156732)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Fausto', 12352890, 212343168, N'Rua Menezes, Salreu', 919394543)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Adriana Santos', 12305092, 324512678, N'Alameda lore, Cacia', 910008981)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Mário Pereira', 78657432, 345631219, N'Travessa Ana, Anadia', 932198980)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Gisela', 13456729, 364564810, N'Rua Historia, Aveiro', 939192987)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'José Dias', 98292362, 453689181, N'Rua dos Lirios, Aveiro', 967565321)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Chico', 19800341, 654782919, N'Alameda Principal, Anadia', 912379098)
INSERT [cafe].[Cliente] ([nomeCli], [CC_Cliente], [NIF], [moradaCli], [telefoneCli]) VALUES (N'Gabriel', 14472124, 768362101, N'Rua do Rameiral, Anadia', 913557656)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (1, N'dinheiro', CAST(0xCB390B00 AS Date), N'cafe', 2, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (2, N'multibanco', CAST(0x6E390B00 AS Date), N'chá', 1, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (3, N'dinheiro', CAST(0xE9390B00 AS Date), N'água', 3, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (4, N'dinheiro', CAST(0x083A0B00 AS Date), N'fruta, água', 4, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (5, N'multibanco', CAST(0x71390B00 AS Date), N'sumo, sandes', 1, 453689181)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (6, N'dinheiro', CAST(0x90390B00 AS Date), N'café', 4, 453689181)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (7, N'dinheiro', CAST(0x263A0B00 AS Date), N'chocolate', 7, 453689181)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (8, N'multibanco', CAST(0x643A0B00 AS Date), N'pastel, leite', 3, 768362101)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (9, N'dinheiro', CAST(0x453A0B00 AS Date), N'gelado', 9, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (10, N'multibanco', CAST(0xAC390B00 AS Date), N'sandes, café', 6, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (11, N'dinheiro', CAST(0x90390B00 AS Date), N'batatas fritas', 5, 345631219)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (12, N'multibanco', CAST(0xA13A0B00 AS Date), N'sumo,pastel,gelado', 10, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (13, N'dinheiro', CAST(0xE9390B00 AS Date), N'sumo', 8, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (14, N'dinheiro', CAST(0x083A0B00 AS Date), N'café', 5, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (15, N'multibanco', CAST(0x263A0B00 AS Date), N'café, sandes, chocolate', 8, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (16, N'dinheiro', CAST(0x453A0B00 AS Date), N'água', 10, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (17, N'dinheiro', CAST(0x083A0B00 AS Date), N'pastel', 7, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (18, N'dinheiro', CAST(0x823A0B00 AS Date), N'sumo, croissant', 9, 364564810)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (19, N'multibanco', CAST(0xA13A0B00 AS Date), N'sandes, café', 6, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (20, N'dinheiro', CAST(0xBF3A0B00 AS Date), N'croissant', 1, NULL)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (21, N'multibanco', CAST(0xEA390B00 AS Date), N'pastel', 5, 123454321)
INSERT [cafe].[Compras] ([nºcompra], [forma_pagamento], [data_compra], [nome_prod], [compras_numFunc], [compras_nifCli]) VALUES (22, N'multibanco', CAST(0x793A0B00 AS Date), N'leite, batatas fritas', 6, 56746534)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (1, 108, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (2, 101, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (3, 107, 3)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (4, 107, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (4, 112, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (5, 109, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (5, 111, 3)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (6, 108, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (7, 103, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (8, 104, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (8, 105, 4)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (8, 110, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (9, 102, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (10, 108, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (10, 111, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (11, 105, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (12, 102, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (12, 109, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (12, 110, 3)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (13, 109, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (14, 108, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (15, 103, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (15, 108, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (15, 111, 3)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (16, 107, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (17, 110, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (18, 106, 2)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (18, 109, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (19, 108, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (19, 111, 1)
INSERT [cafe].[Contidos] ([nºcompra_contid], [prodID_cont], [unidades]) VALUES (20, 106, 3)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (1, CAST(0xAC390B00 AS Date), 3, N'1231', 3)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (2, CAST(0xBF3A0B00 AS Date), 6, N'1232', 5)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (3, CAST(0xA13A0B00 AS Date), 10, N'1232', 7)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (4, CAST(0x453A0B00 AS Date), 12, N'1236', 1)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (5, CAST(0xAC390B00 AS Date), 5, N'1235', 2)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (6, CAST(0x71390B00 AS Date), 2, N'1239', 2)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (7, CAST(0x083A0B00 AS Date), 4, N'1240', 4)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (8, CAST(0xE9390B00 AS Date), 7, N'1241', 4)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (9, CAST(0xCB390B00 AS Date), 7, N'1233', 5)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (10, CAST(0x90390B00 AS Date), 8, N'1238', 10)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (11, CAST(0xCB390B00 AS Date), 5, N'1237', 9)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (12, CAST(0xD6390B00 AS Date), 2, N'1235', 9)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (13, CAST(0x50320B00 AS Date), 4, N'1238', 1)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (14, CAST(0xAC390B00 AS Date), 3, N'1231', 3)
INSERT [cafe].[Encomenda] ([nºencomenda], [data_realizacao], [quantidade], [Enc_cod_int], [enc_numFunc]) VALUES (15, CAST(0xDB390B00 AS Date), 8, N'1231', 4)
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'José Cola', 23456234, N'1231', N'Rua das Águas, Vilar', 917898982, 123345234, N'dinheiro')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Manuel Cereja', 23123234, N'1232', N'Rua Baixa, Esgueira', 913485671, 123412323, N'multibanco')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'João Pinheiro', 78789976, N'1233', N'Rua da Morte, Aveiro', 932198982, 123723239, N'multibanco')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Joana Silva', 1237123, N'123323', N'rua das tulipas', 9172123, 123123, N'multibanco')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Mário Pereira', 78657432, N'1234', N'Travessa Ana, Anadia', 932198980, 198723234, N'cheque')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Margarida Ribeiro', 12345098, N'1235', N'Alameda lore, Cacia', 922198982, 1231232342, N'dinheiro')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Susana Silva', 12345023, N'1236', N'Rua Assada, Aveiro', 962198910, 1551237842, N'cheque')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Adriana Santos', 12305092, N'1237', N'Alameda lore, Cacia', 910008981, 1990282342, N'multibanco')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Miguel Tavares', 19145099, N'1238', N'Rua Sesamo, Lisboa', 912197701, 1238890232, N'dinheiro')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Liliana Sousa', 12777098, N'1239', N'Avenida Sacre, Faro', 932198911, 1231230000, N'cheque')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Raúl Semedo', 12349999, N'1240', N'Rua Matris, Setúbal', 968998982, 1531552342, N'dinheiro')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Sofia Fernandes', 13345098, N'1241', N'Avenida Lis, Braga', 932000182, 1231552311, N'multibanco')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'leandro', 23565656, N'1242', N'Rua dos ratos', 913232323, 43565, N'multibanco')
INSERT [cafe].[Fornecedor] ([nomeForn], [CC_Forn], [codigo_interno], [moradaForn], [telefoneForn], [fax], [forma_pag]) VALUES (N'Pedro Santos', 23435569, N'34556', N'Rua das Pereira', 912342123, 243576, N'multibanco')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Dona Alcina', 78965456, 1, N'Rua dos Lirios, Aveiro', 234193409, CAST(2000.00 AS Decimal(10, 2)), NULL, N'todo-o-dia')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'António', 53452345, 2, N'Rua Assada, Aveiro', 234634345, CAST(2500.00 AS Decimal(10, 2)), NULL, N'manha')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Jaqueline', 56898052, 3, N'Rua da Morte, Aveiro', 917898764, CAST(500.00 AS Decimal(10, 2)), 3, N'manha')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Tomas', 12345321, 4, N'Rua da Morte, Aveiro', 913420123, CAST(800.00 AS Decimal(10, 2)), 1, N'todo-o-dia')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Gabriel Vieira', 14472124, 5, N'Rua do Rameiral, Anadia', 913557656, CAST(1000.00 AS Decimal(10, 2)), 5, N'tarde')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Joana', 12342345, 6, N'Avenida da Republica, Coimbra', 962356789, CAST(1200.00 AS Decimal(10, 2)), 2, N'todo-o-dia')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Andreia', 16742349, 7, N'Avenida dos Aliados, Porto', 935636280, CAST(700.00 AS Decimal(10, 2)), 2, N'noite')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Filipa', 19841305, 8, N'Praça do Municipio, Coimbra', 917306781, CAST(1200.00 AS Decimal(10, 2)), 2, N'manha')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'João', 13427890, 9, N'Rua Assada, Aveiro', 912345654, CAST(700.00 AS Decimal(10, 2)), 1, N'tarde')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Chico', 19800341, 10, N'Alameda Principal, Anadia', 912379098, CAST(1200.00 AS Decimal(10, 2)), 1, N'noite')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Filipe Santos', 123456, 13, N'Rua da Casasitas', 912345678, CAST(1550.00 AS Decimal(10, 2)), 13, N'tarde')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'adriana', 123123, 16, N'rua das tulipas', 9182541, CAST(560.00 AS Decimal(10, 2)), 3, N'manha')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Luis Semedo', 12340001, 20, N'Rua das taças', 912222212, CAST(600.00 AS Decimal(10, 2)), 1, N'noite')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'André', 12343424, 23, N'Rua do teatro', 912334321, CAST(800.50 AS Decimal(10, 2)), 1, N'noite')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'adriana', 92744, 29, N'rua das tulipas', 918462, CAST(560.00 AS Decimal(10, 2)), 2, N'manha')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Tiago', 23413212, 45, N'Rua do Teatro', 921323212, CAST(600.00 AS Decimal(10, 2)), 2, N'tarde')
INSERT [cafe].[Funcionario] ([nomeFunc], [CCFunc], [numFunc], [moradaFunc], [telefoneFunc], [salario], [SuperFunc], [turnoFunc]) VALUES (N'Rodrigo Alves', 35722423, 50, N'Rua das Camélis', 912345678, CAST(700.00 AS Decimal(10, 2)), 1, N'manha')
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'hora de almoço', 3)
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'hora de jantar', 3)
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'madrugada', 8)
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'manha', 8)
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'noite', 8)
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'tarde', 8)
INSERT [cafe].[horario] ([turno], [numeroHoras]) VALUES (N'todo-o-dia', 16)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (101, N'chá', N'bebida', CAST(0.80 AS Decimal(10, 2)), 3, 1)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (102, N'gelados', N'comida', CAST(1.30 AS Decimal(10, 2)), 5, 2)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (103, N'chocolate', N'comida', CAST(0.75 AS Decimal(10, 2)), 7, 3)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (104, N'leite', N'bebida', CAST(0.75 AS Decimal(10, 2)), 6, 2)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (105, N'batatas fritas', N'comida', CAST(0.85 AS Decimal(10, 2)), 2, 5)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (106, N'croissant', N'comida', CAST(0.90 AS Decimal(10, 2)), 9, 12)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (107, N'água', N'bebida', CAST(0.65 AS Decimal(10, 2)), 4, 7)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (108, N'café', N'comida', CAST(0.50 AS Decimal(10, 2)), 4, 8)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (109, N'sumo', N'bebida', CAST(0.50 AS Decimal(10, 2)), 5, 9)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (110, N'pastel', N'comida', CAST(0.90 AS Decimal(10, 2)), 10, 10)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (111, N'sandes', N'comida', CAST(0.80 AS Decimal(10, 2)), 9, 11)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (112, N'fruta', N'comida', CAST(0.55 AS Decimal(10, 2)), 9, 12)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (114, N'taça de vinho', N'bebida', CAST(0.75 AS Decimal(10, 2)), 4, 3)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (115, N'bolacha', N'comida', CAST(0.60 AS Decimal(10, 2)), 5, 3)
INSERT [cafe].[Produto] ([prodID], [nomeProd], [familia], [preco], [prod_numFunc], [prod_nºencomenda]) VALUES (12344, N'tosta', N'comida', CAST(4.00 AS Decimal(10, 2)), 2, 3)
INSERT [cafe].[Reclamacao] ([nºreclamacao], [motivo], [reclam_nifCli]) VALUES (2, N'esquecimento', NULL)
INSERT [cafe].[Reclamacao] ([nºreclamacao], [motivo], [reclam_nifCli]) VALUES (3, N'leite frio', 768362101)
INSERT [cafe].[Reclamacao] ([nºreclamacao], [motivo], [reclam_nifCli]) VALUES (4, N'sumo estragado', NULL)
INSERT [cafe].[Reclamacao] ([nºreclamacao], [motivo], [reclam_nifCli]) VALUES (5, N'esquecimento', NULL)
INSERT [cafe].[Reclamacao] ([nºreclamacao], [motivo], [reclam_nifCli]) VALUES (6, N'leite frio', 56746534)
SET ANSI_PADDING ON

GO
/****** Object:  Index [nameCli]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [nameCli] ON [cafe].[Cliente]
(
	[nomeCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [datacompra]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [datacompra] ON [cafe].[Compras]
(
	[data_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [dataenco]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [dataenco] ON [cafe].[Encomenda]
(
	[data_realizacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nameFor]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [nameFor] ON [cafe].[Fornecedor]
(
	[nomeForn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nameFunc]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [nameFunc] ON [cafe].[Funcionario]
(
	[nomeFunc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [TurnoFuncionarios]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [TurnoFuncionarios] ON [cafe].[Funcionario]
(
	[turnoFunc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nameProd]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [nameProd] ON [cafe].[Produto]
(
	[nomeProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nameReclama]    Script Date: 05/06/2015 22:34:51 ******/
CREATE NONCLUSTERED INDEX [nameReclama] ON [cafe].[Reclamacao]
(
	[motivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [cafe].[Compras]  WITH CHECK ADD FOREIGN KEY([compras_numFunc])
REFERENCES [cafe].[Funcionario] ([numFunc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Compras]  WITH CHECK ADD FOREIGN KEY([compras_nifCli])
REFERENCES [cafe].[Cliente] ([NIF])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Contidos]  WITH CHECK ADD FOREIGN KEY([nºcompra_contid])
REFERENCES [cafe].[Compras] ([nºcompra])
GO
ALTER TABLE [cafe].[Contidos]  WITH CHECK ADD FOREIGN KEY([prodID_cont])
REFERENCES [cafe].[Produto] ([prodID])
GO
ALTER TABLE [cafe].[Encomenda]  WITH CHECK ADD FOREIGN KEY([Enc_cod_int])
REFERENCES [cafe].[Fornecedor] ([codigo_interno])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Encomenda]  WITH CHECK ADD FOREIGN KEY([enc_numFunc])
REFERENCES [cafe].[Funcionario] ([numFunc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Funcionario]  WITH CHECK ADD FOREIGN KEY([turnoFunc])
REFERENCES [cafe].[horario] ([turno])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Funcionario]  WITH CHECK ADD  CONSTRAINT [Supervisor] FOREIGN KEY([SuperFunc])
REFERENCES [cafe].[Funcionario] ([numFunc])
GO
ALTER TABLE [cafe].[Funcionario] CHECK CONSTRAINT [Supervisor]
GO
ALTER TABLE [cafe].[Produto]  WITH CHECK ADD FOREIGN KEY([prod_nºencomenda])
REFERENCES [cafe].[Encomenda] ([nºencomenda])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Produto]  WITH CHECK ADD FOREIGN KEY([prod_numFunc])
REFERENCES [cafe].[Funcionario] ([numFunc])
GO
ALTER TABLE [cafe].[Reclamacao]  WITH CHECK ADD FOREIGN KEY([reclam_nifCli])
REFERENCES [cafe].[Cliente] ([NIF])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [cafe].[Funcionario]  WITH CHECK ADD CHECK  (([salario]>(0)))
GO
ALTER TABLE [cafe].[Produto]  WITH CHECK ADD CHECK  (([preco]>(0)))
GO
/****** Object:  Trigger [cafe].[trg_deleteFunc]    Script Date: 05/06/2015 22:34:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [cafe].[trg_deleteFunc] on [cafe].[Funcionario]
for delete

As
	if(select count(*) from deleted) = 1
	begin
		RAISERROR('Funcionários sem supervisor não podem ser removidos!', 16, 1);
		rollback tran	
End
GO
/****** Object:  Trigger [cafe].[trg_insertValue]    Script Date: 05/06/2015 22:34:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [cafe].[trg_insertValue] on [cafe].[Funcionario]
for insert

As
	if(select count(*) from inserted) = 1
		print 'Funcionário inserido com sucesso'


GO
