#!/bin/bash

# SmartFIT Google Cloud Deployment Script
# This script deploys the SmartFIT survey to Google Cloud Storage

PROJECT_ID="smartfit-survey"
BUCKET_NAME="smartfit-survey-web"
REGION="us-central1"

echo "🚀 SmartFIT Google Cloud Deployment"
echo "=================================="

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ Google Cloud CLI not found. Installing..."
    curl https://sdk.cloud.google.com | bash
    exec -l $SHELL
    echo "✅ Google Cloud CLI installed. Please run this script again."
    exit 1
fi

echo "✅ Google Cloud CLI found"

# Check if user is authenticated
if ! gcloud auth list --filter=status:ACTIVE --format="value(account)" | grep -q .; then
    echo "🔐 Please authenticate with Google Cloud..."
    gcloud auth login
fi

echo "✅ Authenticated with Google Cloud"

# Create project if it doesn't exist
if ! gcloud projects describe $PROJECT_ID &> /dev/null; then
    echo "📁 Creating project: $PROJECT_ID"
    gcloud projects create $PROJECT_ID --name="SmartFIT Survey"
else
    echo "✅ Project $PROJECT_ID already exists"
fi

# Set project
echo "⚙️ Setting project to $PROJECT_ID"
gcloud config set project $PROJECT_ID

# Enable required APIs
echo "🔧 Enabling required APIs..."
gcloud services enable storage.googleapis.com
gcloud services enable cloudbuild.googleapis.com

# Create bucket if it doesn't exist
if ! gsutil ls gs://$BUCKET_NAME &> /dev/null; then
    echo "🪣 Creating storage bucket: $BUCKET_NAME"
    gsutil mb -l $REGION gs://$BUCKET_NAME
else
    echo "✅ Bucket $BUCKET_NAME already exists"
fi

# Make bucket public for website hosting
echo "🌐 Making bucket public for website hosting..."
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME

# Upload files
echo "📤 Uploading files to bucket..."
gsutil cp index.html gs://$BUCKET_NAME/
gsutil cp manifest.json gs://$BUCKET_NAME/

# Configure website
echo "⚙️ Configuring website settings..."
gsutil web set -m index.html gs://$BUCKET_NAME

# Set cache headers for better performance
echo "⚡ Setting cache headers for performance..."
gsutil setmeta -h "Cache-Control:public, max-age=3600" gs://$BUCKET_NAME/index.html
gsutil setmeta -h "Cache-Control:public, max-age=3600" gs://$BUCKET_NAME/manifest.json

echo ""
echo "✅ Deployment complete!"
echo "🌐 Your SmartFIT survey is now live at:"
echo "   https://storage.googleapis.com/$BUCKET_NAME/index.html"
echo ""
echo "📊 To view your bucket in the console:"
echo "   https://console.cloud.google.com/storage/browser/$BUCKET_NAME"
echo ""
echo "🔧 To update your site, run:"
echo "   gsutil cp index.html gs://$BUCKET_NAME/"
echo ""
echo "🎉 Enjoy your deployed SmartFIT survey!" 