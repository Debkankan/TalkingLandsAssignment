# For installing Prometheus and Grafana on our Kubernetes Cluster, we need to install HELM on our cluster first, because we use official HELM charts to install Prometheus & Grafana

# Adding Helm repositories for Prometheus and Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts

# Updating Helm repositories
helm repo update

# Installing Prometheus
helm install prometheus prometheus-community/kube-prometheus-stack

# Installing Grafana
helm install grafana grafana/grafana --set adminPassword='admin'

# Exposing Grafana
 To expose the Grafana dashboard, we can either port-forward it or expose it using a LoadBalancer service. We are using the port-forward technique in this scenario

# Port-forwarding
kubectl port-forward svc/grafana 3000:80

# Creating Grafana Dashboard

Once Grafana is set up, we can create a custom dashboard to visualize our Python application’s metrics. Here’s how to set it up:

1. Log in to Grafana.

2. Go to Create → Dashboard.

3. Add a Graph panel and select the data source as Prometheus.

For example, to visualize the CPU usage of your Python application, enter the following query in the Prometheus Query section:
sum(rate(container_cpu_usage_seconds_total{pod=~"python-app.*"}[1m])) by (pod)



