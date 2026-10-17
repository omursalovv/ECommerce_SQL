use ECommerce;
GO
create trigger Prices_Insert_After
on dbo.Prices
after insert as
BEGIN TRY
    SET NOCOUNT ON;

    -- Добавляем артикул, если такого нет
    INSERT INTO dbo.Articles (Article)
    SELECT ins.Article
    FROM INSERTED as ins
    join dbo.Articles as art
        on ins.Article != art.Article
    declare @articleId bigint = @@IDENTITY;

    -- Добавляем бренд
    /*INSERT INTO dbo.Brands (Brand)
    SELECT Brand
    FROM INSERTED as ins
    join dbo.Brands as art
        on ins.Brand != art.Brand
    declare @brandId int = @@IDENTITY;

    -- Добавляем карточку товара
    INSERT INTO dbo.Sku (ArticleId, BrandId)
    values (@articleId, @brandId)*/
END TRY
BEGIN CATCH
    --SET NOCOUNT ON;
    UPDATE p
    SET Error = ERROR_MESSAGE()
    FROM dbo.Prices AS p
    WHERE PriceId = p.PriceId
END CATCH