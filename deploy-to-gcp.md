# Deploy SmartFIT to Google Cloud Platform

## 🚀 Option 1: Google Cloud Storage (Recommended for Static Sites)

### **Step 1: Install Google Cloud CLI**
```bash
# Download and install gcloud CLI
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
```

### **Step 2: Create a Project**
```bash
# Create new project (or use existing)
gcloud projects create smartfit-survey --name="SmartFIT Survey"
gcloud config set project smartfit-survey

# Enable billing (required)
gcloud billing accounts list
gcloud billing projects link smartfit-survey --billing-account=YOUR_BILLING_ACCOUNT_ID
```

### **Step 3: Enable Required APIs**
```bash
# Enable Cloud Storage API
gcloud services enable storage.googleapis.com
```

### **Step 4: Create Storage Bucket**
```bash
# Create bucket (use your preferred region)
gsutil mb gs://smartfit-survey-web

# Make bucket public for website hosting
gsutil iam ch allUsers:objectViewer gs://smartfit-survey-web
```

### **Step 5: Upload Files**
```bash
# Copy all files to bucket
gsutil cp index.html gs://smartfit-survey-web/
gsutil cp manifest.json gs://smartfit-survey-web/

# Set website configuration
gsutil web set -m index.html gs://smartfit-survey-web
```

### **Step 6: Configure Custom Domain (Optional)**
```bash
# Add CNAME record in your DNS
# Point your domain to: c.storage.googleapis.com
```

**Your site will be live at:** `https://storage.googleapis.com/smartfit-survey-web/index.html`

---

## 🚀 Option 2: Google Cloud Run (For Future Backend Integration)

### **Step 1: Create Dockerfile**
```dockerfile
# Create Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
COPY manifest.json /usr/share/nginx/html/
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
```

### **Step 2: Build and Deploy**
```bash
# Build container
gcloud builds submit --tag gcr.io/smartfit-survey/smartfit-web

# Deploy to Cloud Run
gcloud run deploy smartfit-survey \
  --image gcr.io/smartfit-survey/smartfit-web \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

---

## 🚀 Option 3: Google App Engine (Traditional Web Hosting)

### **Step 1: Create app.yaml**
```yaml
runtime: python39
handlers:
- url: /
  static_files: index.html
  upload: index.html

- url: /(.*)
  static_files: \1
  upload: .*
```

### **Step 2: Deploy**
```bash
# Deploy to App Engine
gcloud app deploy
```

---

## 🚀 Option 4: Google Cloud Load Balancer (Production Setup)

### **Step 1: Create Backend Bucket**
```bash
# Create backend bucket
gcloud compute backend-buckets create smartfit-backend \
  --gcs-bucket-name=smartfit-survey-web \
  --enable-cdn
```

### **Step 2: Create Load Balancer**
```bash
# Create URL map
gcloud compute url-maps create smartfit-lb \
  --default-backend-bucket=smartfit-backend

# Create HTTPS proxy
gcloud compute target-https-proxies create smartfit-https-proxy \
  --url-map=smartfit-lb \
  --ssl-certificates=YOUR_SSL_CERT

# Create forwarding rule
gcloud compute forwarding-rules create smartfit-https \
  --target-https-proxy=smartfit-https-proxy \
  --global \
  --ports=443
```

---

## 💰 Cost Comparison

| Service | Monthly Cost | Best For |
|---------|-------------|----------|
| **Cloud Storage** | ~$0.02/GB | Static sites, simple setup |
| **Cloud Run** | ~$0.40/month | Dynamic content, auto-scaling |
| **App Engine** | ~$0.05/hour | Traditional web hosting |
| **Load Balancer** | ~$18/month | Production, custom domains |

---

## 🔧 Quick Setup Script

Create this script to automate Option 1:

```bash
#!/bin/bash
# deploy-to-gcp.sh

PROJECT_ID="smartfit-survey"
BUCKET_NAME="smartfit-survey-web"
REGION="us-central1"

echo "🚀 Deploying SmartFIT to Google Cloud..."

# Set project
gcloud config set project $PROJECT_ID

# Enable APIs
gcloud services enable storage.googleapis.com

# Create bucket
gsutil mb -l $REGION gs://$BUCKET_NAME

# Make public
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME

# Upload files
gsutil cp index.html gs://$BUCKET_NAME/
gsutil cp manifest.json gs://$BUCKET_NAME/

# Configure website
gsutil web set -m index.html gs://$BUCKET_NAME

echo "✅ Deployment complete!"
echo "🌐 Your site: https://storage.googleapis.com/$BUCKET_NAME/index.html"
```

Run with: `chmod +x deploy-to-gcp.sh && ./deploy-to-gcp.sh`

---

## 🔒 Security Considerations

### **For Production:**
1. **HTTPS Only:** Configure SSL certificates
2. **CORS Headers:** Set appropriate cross-origin policies
3. **Security Headers:** Add CSP, HSTS headers
4. **Monitoring:** Enable Cloud Monitoring
5. **Logging:** Set up Cloud Logging

### **Add Security Headers:**
```html
<!-- Add to your index.html -->
<meta http-equiv="Content-Security-Policy" content="default-src 'self'">
<meta http-equiv="X-Content-Type-Options" content="nosniff">
<meta http-equiv="X-Frame-Options" content="DENY">
```

---

## 📊 Monitoring & Analytics

### **Enable Cloud Monitoring:**
```bash
# Enable monitoring
gcloud services enable monitoring.googleapis.com

# Create monitoring dashboard
gcloud monitoring dashboards create --config-from-file=dashboard.json
```

### **Add Google Analytics:**
```html
<!-- Add to your index.html head section -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

---

## 🚀 Recommended Approach

**For your current needs, I recommend Option 1 (Cloud Storage):**

1. **Fastest setup** - 5 minutes
2. **Lowest cost** - ~$0.02/month
3. **Global CDN** - Fast worldwide
4. **Easy maintenance** - Simple file uploads
5. **Scalable** - Handles any traffic

**Commands to run:**
```bash
# 1. Install gcloud CLI
curl https://sdk.cloud.google.com | bash

# 2. Initialize and create project
gcloud init
gcloud projects create smartfit-survey --name="SmartFIT Survey"

# 3. Deploy (using the script above)
./deploy-to-gcp.sh
```

**Your site will be live at:** `https://storage.googleapis.com/smartfit-survey-web/index.html`

---

## 📞 Next Steps

1. **Choose your deployment option** (I recommend Cloud Storage)
2. **Set up billing** in Google Cloud Console
3. **Run the deployment commands**
4. **Configure custom domain** (optional)
5. **Set up monitoring** (recommended)

**Need help?** Check the [Google Cloud documentation](https://cloud.google.com/docs) or contact your development team. 