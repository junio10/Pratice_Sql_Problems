use Northwind
--Pegar o nome das tabelas do banco
SELECT name FROM sys.tables;

SP_TABLES -- procedimento armazenado específico do SQL Server que retorna uma lista de tabelas e visualizações disponíveis em um determinado banco de dados.
SP_TABLES @TABLE_NAME = 'Categories'
--Parametros que podem ser colocados
--sp_tables [ @table_name = 'table_name'
--         , @table_owner = 'table_owner'
--         , @table_qualifier = 'table_qualifier'
--         , @table_type = "table_type" ]
