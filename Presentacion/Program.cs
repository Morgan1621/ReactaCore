var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


//new
builder.Services.AddCors(op =>

{
    op.AddPolicy("AllowAll", policy =>

    {
        policy.AllowAnyHeader()
        .AllowAnyMethod()
        .AllowAnyOrigin();

    });


});


//new
var app = builder.Build();


app.UseSwagger();
app.UseSwaggerUI(s =>
{
    s.SwaggerEndpoint("/swagger/v1/swagger.json", "Api ReactaCore");
    s.RoutePrefix = string.Empty;


});

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("AllowAll");

app.UseAuthorization();

app.MapControllers();

app.Run();
