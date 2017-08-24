
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

-- Creating table 'Agentes'
CREATE TABLE [dbo].[Agentes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Equipes'
CREATE TABLE [dbo].[Equipes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(100)  NOT NULL,
    [Treinador_Id] int  NOT NULL
);
GO

-- Creating table 'Treinadores'
CREATE TABLE [dbo].[Treinadores] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Atletas'
CREATE TABLE [dbo].[Atletas] (
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

-- Creating primary key on [Id] in table 'Agentes'
ALTER TABLE [dbo].[Agentes]
ADD CONSTRAINT [PK_Agentes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Equipes'
ALTER TABLE [dbo].[Equipes]
ADD CONSTRAINT [PK_Equipes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Treinadores'
ALTER TABLE [dbo].[Treinadores]
ADD CONSTRAINT [PK_Treinadores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Atletas'
ALTER TABLE [dbo].[Atletas]
ADD CONSTRAINT [PK_Atletas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Treinador_Id] in table 'Equipes'
ALTER TABLE [dbo].[Equipes]
ADD CONSTRAINT [FK_EquipeTreinador2]
    FOREIGN KEY ([Treinador_Id])
    REFERENCES [dbo].[Treinadores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipeTreinador'
CREATE INDEX [IX_FK_EquipeTreinador2]
ON [dbo].[Equipes]
    ([Treinador_Id]);
GO

-- Creating foreign key on [Equipe_Id] in table 'Atletas'
ALTER TABLE [dbo].[Atletas]
ADD CONSTRAINT [FK_EquipeAtletas2]
    FOREIGN KEY ([Equipe_Id])
    REFERENCES [dbo].[Equipes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipeAtletas'
CREATE INDEX [IX_FK_EquipeAtletas2]
ON [dbo].[Atletas]
    ([Equipe_Id]);
GO

-- Creating foreign key on [Id] in table 'Treinadores'
ALTER TABLE [dbo].[Treinadores]
ADD CONSTRAINT [FK_Treinador_inherits_Agente2]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Agentes]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Atletas'
ALTER TABLE [dbo].[Atletas]
ADD CONSTRAINT [FK_Atleta_inherits_Agente2]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Agentes]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------