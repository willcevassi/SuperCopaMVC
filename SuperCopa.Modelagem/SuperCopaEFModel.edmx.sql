
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/23/2017 19:19:16
-- Generated from EDMX file: C:\Users\willi\Projetos\Git\Apex\SuperCopa\SuperCopa.Modelagem\SuperCopaEFModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [supercopa];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AgenteSet'
CREATE TABLE [dbo].[AgenteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'EquipeSet'
CREATE TABLE [dbo].[EquipeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(100)  NOT NULL,
    [Treinador_Id] int  NOT NULL
);
GO

-- Creating table 'AgenteSet_Treinador'
CREATE TABLE [dbo].[AgenteSet_Treinador] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'AgenteSet_Atleta'
CREATE TABLE [dbo].[AgenteSet_Atleta] (
    [Altura] decimal(12,2)  NULL,
    [PosicaoPrincipal] nvarchar(30)  NULL,
    [Peso] decimal(12,2)  NULL,
    [DataNascimento] datetime  NULL,
    [Id] int  NOT NULL,
    [Equipe_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AgenteSet'
ALTER TABLE [dbo].[AgenteSet]
ADD CONSTRAINT [PK_AgenteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EquipeSet'
ALTER TABLE [dbo].[EquipeSet]
ADD CONSTRAINT [PK_EquipeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AgenteSet_Treinador'
ALTER TABLE [dbo].[AgenteSet_Treinador]
ADD CONSTRAINT [PK_AgenteSet_Treinador]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AgenteSet_Atleta'
ALTER TABLE [dbo].[AgenteSet_Atleta]
ADD CONSTRAINT [PK_AgenteSet_Atleta]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Treinador_Id] in table 'EquipeSet'
ALTER TABLE [dbo].[EquipeSet]
ADD CONSTRAINT [FK_EquipeTreinador]
    FOREIGN KEY ([Treinador_Id])
    REFERENCES [dbo].[AgenteSet_Treinador]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipeTreinador'
CREATE INDEX [IX_FK_EquipeTreinador]
ON [dbo].[EquipeSet]
    ([Treinador_Id]);
GO

-- Creating foreign key on [Equipe_Id] in table 'AgenteSet_Atleta'
ALTER TABLE [dbo].[AgenteSet_Atleta]
ADD CONSTRAINT [FK_EquipeAtletas]
    FOREIGN KEY ([Equipe_Id])
    REFERENCES [dbo].[EquipeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipeAtletas'
CREATE INDEX [IX_FK_EquipeAtletas]
ON [dbo].[AgenteSet_Atleta]
    ([Equipe_Id]);
GO

-- Creating foreign key on [Id] in table 'AgenteSet_Treinador'
ALTER TABLE [dbo].[AgenteSet_Treinador]
ADD CONSTRAINT [FK_Treinador_inherits_Agente]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[AgenteSet]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'AgenteSet_Atleta'
ALTER TABLE [dbo].[AgenteSet_Atleta]
ADD CONSTRAINT [FK_Atleta_inherits_Agente]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[AgenteSet]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------