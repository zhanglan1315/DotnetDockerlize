FROM alpine:latest AS stage1
WORKDIR /app
RUN echo "hello world" > output.txt

FROM scratch AS export-stage
COPY --from=stage1 /app/output.txt .

# FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
# WORKDIR /app
# EXPOSE 8086

# ENV ASPNETCORE_URLS=http://+:8086

# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
# WORKDIR /src
# COPY ["DotnetDockerlize.csproj", "./"]
# RUN dotnet restore "DotnetDockerlize.csproj"
# COPY . .
# WORKDIR "/src/."
# RUN dotnet build "DotnetDockerlize.csproj" -c Release -o /app/build

# FROM build AS publish
# RUN dotnet publish "DotnetDockerlize.csproj" -c Release -o /app/publish /p:UseAppHost=false

# COPY --from=publish /app/publish .

