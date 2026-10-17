using Dapper;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using System.Data;
using System.Data.SqlClient;

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("settings.json", optional: false, reloadOnChange: true)
    .Build();

var connectionString = configuration["dbConnectionStr"];

using (IDbConnection db = new SqlConnection(connectionString))
{
    var x = db.Query(@"SELECT TOP (1000) [PriceId]
      ,[SupplierId]
      ,[Brand]
      ,[Article]
      ,[Qty]
      ,[Price]
      ,[Descr]
      ,[Error]
    FROM [ECommerce].[dbo].[Prices]");
}