# Use the official .NET 9 runtime as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 8080

# Use the SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["CarInsuranceWebsite.csproj", "."]
RUN dotnet restore "CarInsuranceWebsite.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "CarInsuranceWebsite.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CarInsuranceWebsite.csproj" -c Release -o /app/publish

# Build runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CarInsuranceWebsite.dll"]
