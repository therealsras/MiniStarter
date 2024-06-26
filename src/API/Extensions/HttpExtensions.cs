namespace API.Extensions;
public static class HttpExtensions
{
    public static void AddPaginationHeader(this HttpResponse response, MetaData metaData)
    {
        var options = new JsonSerializerOptions{PropertyNamingPolicy = JsonNamingPolicy.CamelCase};

        response.Headers.Append("Access-Control-Expose-Headers", "Pagination");
        response.Headers.Append("Pagination", JsonSerializer.Serialize(metaData, options));
    }
}