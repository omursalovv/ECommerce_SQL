using Dapper;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using PricesApp;
using System.Data;
using System.Data.SqlClient;

var rand = new Random();

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("settings.json", optional: false, reloadOnChange: true)
    .Build();

var suppliers = new[] { "ООО Хорошие вещи", "Goods", "W and S" };
var brands = new[] { "Parade", "FX", "Nemar", "WinterAndSummer", "Blue Light" };
var descrs = new[] { "Хороший товар", "Good position", "We are the champions", "Fix it..", "Спасибо!!" };

var connectionString = configuration["dbConnectionStr"];

var tasks = new List<Task>();
for (var i = 0; i < 100; i++)
{
    var priceDto = new PriceDto
    {
        SupplierName = suppliers[rand.Next(0, suppliers.Length - 1)],
        Brand = brands[rand.Next(0, brands.Length - 1)],
        Article = $"Article {i + 1}",
        Qty = rand.Next(1, 10),
        Price = rand.Next(10000, 50000),
        Descr = descrs[rand.Next(0, descrs.Length - 1)]
    };

    tasks.Add(new SqlConnection(connectionString).QueryAsync(@"
        INSERT INTO [dbo].[Prices]
               (CreatedOn
               ,[SupplierName]
               ,[Brand]
               ,[Article]
               ,[Qty]
               ,[Price]
               ,[Descr])
         VALUES
               (getdate()
               ,@SupplierName
               ,@Brand
               ,@Article
               ,@Qty
               ,@Price
               ,@Descr)", priceDto));
}

await Task.WhenAll(tasks);