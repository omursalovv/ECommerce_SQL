use ECommerce

CREATE TABLE dbo.[Articles]
(
    [ArticleId] bigint PRIMARY KEY, 
    [Article] varchar(20) unique
);

CREATE TABLE dbo.Brands
(
    [BrandId] int PRIMARY KEY,
    [Brand] varchar(20) unique
);

CREATE TABLE dbo.Descr
(
    [OfferId] bigint PRIMARY KEY, 
    [Descr] varchar(20)
);

CREATE TABLE dbo.Sku
(
    [SkuId] bigint PRIMARY KEY, 
    [ArticleId] bigint REFERENCES dbo.Articles (ArticleId),
    [BrandId] int REFERENCES dbo.Brands (BrandId),
);

-- Поставщики
CREATE TABLE dbo.Suppliers
(
    [SupplierId] int PRIMARY KEY,
    [Name] varchar(20),
);

-- Внешний источник..
CREATE TABLE dbo.Prices
(
    [PriceId] int IDENTITY(1,1) PRIMARY KEY,
    [SupplierName] varchar(20), 
    [Brand] varchar(20), 
    [Article] varchar(20), 
    [Qty] int, 
    [Price] money, 
    [Descr] varchar(20),
    [Error] varchar(20)
);

CREATE TABLE dbo.Offers
(
    [OfferId] bigint PRIMARY KEY, -- первичный ключ 
    [SupplierId] int REFERENCES dbo.Suppliers (SupplierId), -- поставщик (ссылается на таблицу поставщиков dbo.[Suppliers]) 
    [SkuId] bigint REFERENCES dbo.Sku (SkuId), -- карточка товара (dbo.[Sku]) 
    [Qty] int, -- кол-во товара у поставщика 
    [Price] money, -- цена за единицу товара у поставщика
);

/*DROP TABLE
    dbo.Offers, 
    dbo.Prices, 
    dbo.Suppliers,
    dbo.Sku, 
    dbo.Descr, 
    dbo.[Articles], 
    dbo.Brands*/