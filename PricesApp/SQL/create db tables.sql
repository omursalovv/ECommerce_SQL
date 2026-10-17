use ECommerce

CREATE TABLE dbo.[Articles]
(
    [ArticleId] bigint PRIMARY KEY, 
    [Article] varchar unique
);

CREATE TABLE dbo.Brands
(
    [BrandId] int PRIMARY KEY,
    [Brand] varchar unique
);

CREATE TABLE dbo.Descr
(
    [OfferId] bigint PRIMARY KEY, 
    [Descr] varchar
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
    [Name] varchar,
);

-- Внешний источник..
CREATE TABLE dbo.Prices
(
    [PriceId] int PRIMARY KEY,
    [SupplierId] int, 
    [Brand] varchar, 
    [Article] varchar, 
    [Qty] int, 
    [Price] money, 
    [Descr] varchar,
    [Error] varchar
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