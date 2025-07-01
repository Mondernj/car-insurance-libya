#!/bin/bash

echo "🚀 Starting Car Insurance Website..."
echo "📍 Location: Libya - Benghazi"
echo "🌐 Language: Arabic (RTL)"

# Restore packages
echo "📦 Restoring packages..."
dotnet restore

# Build the application
echo "🔨 Building application..."
dotnet build

# Run database migrations
echo "🗄️ Setting up database..."
dotnet ef database update

# Start the application
echo "🌟 Starting the website..."
echo "🔗 The website will be available at the forwarded port URL"
echo "👤 Admin Login: admin@carinsurance.ly / Admin@123"
echo "🏢 Manager Login: manager@libya-insurance.ly / Manager@123"

dotnet run --urls="http://0.0.0.0:8080"
