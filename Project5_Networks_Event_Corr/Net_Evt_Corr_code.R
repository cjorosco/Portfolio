
# title: "Network Event Correlation"
# Objective: Determine validity of using Clustering, Network Diagrams, 
# and Time-Series Anomaly Detection to identify anomalous computer network traffic.

  
library(lubridate)
library(dplyr)
library(anytime)
library(iptools)
library(cluster)
library(factoextra)
library(fpc)
library(dbscan)
library(tidyverse)
library(network)
library(data.table)
library(anomalize)
library(tsibble)
library(tibbletime)
library(autoplotly)
library(gplots)
library(palmerpenguins)
library(knitr)
library(tidygraph)
library(ggraph)
library(igraph)

## Data Importing and Cleaning   

test_data <- read.csv('~/clean_data.csv', header = TRUE, stringsAsFactors = FALSE)

##### Create Clustering Subset
#Change Proto and IP to Numeric for clustering need all numeric except sav_index.
 
subset_clus <- test_data

sav_clus <- subset_clus
 
#Convert Protocol to Factors
 
subset_clus$Proto <- as.factor(subset_clus$Proto)
subset_clus$Proto <- as.numeric(subset_clus$Proto)
 
# Convert IPs to Numeric
 
subset_clus$Src_IP <- ip_to_numeric(subset_clus$Src_IP)
subset_clus$Dst_IP <- ip_to_numeric(subset_clus$Dst_IP)
 
# Scale the dataframe
 
subset_clus <- scale(subset_clus)
 
#####  Create Test Set for Network Diagrams
# Change epoch to UTC,  for node_edge, time series, and anomalzing 
 
test_data$UTC <- anytime(test_data$UTC, asUTC=TRUE )
 
# Create Subset
 
test.ts <- test_data[,c(1,3,5)]
test.ts[order(test.ts$UTC),]

test.ts$Src_IP <- as.factor(test.ts$Src_IP)
test.ts$Dst_IP <- as.factor(test.ts$Dst_IP)

 
## Create Clusters
##### K-means using WSS Method

 
k_clus <- fviz_nbclust(subset_clus, FUNcluster = kmeans,
                       nstart=2, nboot = 50,  method = "wss")
 
# Display optimal nbr of clusters
 
k_clus
 
##### K-means Using Silhouette Method
 
k_clus1 <- fviz_nbclust(subset_clus, FUNcluster = kmeans, nstart=2, 
                        nboot = 50,method = "silhouette")
k_clus1
 
##### Plot K-means
###### Plot with 4 Clusters

 

km.res <- kmeans(subset_clus, 4, nstart=4)

fviz_cluster(km.res, subset_clus,  geom = "point", 
             ellipse.type = "norm", show.clust.cent = TRUE,
             main = "Cluster Plot using K-means with 4 Clusters")


 
###### Plot with 7 Clusters
 

km.res1 <- kmeans(subset_clus, 7, nstart=4)

fviz_cluster(km.res1, subset_clus,  geom = "point", 
             ellipse.type = "norm", show.clust.cent = FALSE,
             main = "Cluster Plot using K-means with 7 Clusters")

 
# Kmeans Summary Results
 

km.res1$centers
km.res1$withinss
km.res1$tot.withinss
km.res1$betweenss
#km.res1$size
km.res1$iter
km.res1$ifault
 
## Cluster Analysis
##### K-means Cluster Analysis 
 

best_kmeans <- kmeans(subset_clus, 4, nstart=4)
 
# Display cluster members
 

head(subset_clus[best_kmeans$cluster==1],5)
 
# Append cluster assignment to data frame
 

best_kmeans_clus <- data.frame(subset_clus, best_kmeans$cluster)
best_kmeans_clus
tmp <- sav_clus
tmp1 <- sav_clus
 
# Add best_kmeans.cluster to saved set 
 

sav_clus <- data.frame(tmp, best_kmeans$cluster)

 
# Determine number of clusters using another WSS method


wss <- (nrow(subset_clus)-1)*sum(apply(subset_clus,2,var))
nrow(subset_clus)
for (i in 2:15) wss[i] <- sum(kmeans(subset_clus,
                                     centers=i)$withinss)
 
###### Plot K-means using WSS method

plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")
 
## Hierarchical Clusters
#Compute dissimilarity matrix
 
res.dist <- dist(as.matrix(subset_clus, method = "euclidean"))
 
# Create hierarchical clustering
 
res.hc <- hclust(res.dist, method = "complete", members = NULL)
 
###### Plot Hierarchy
 
plot(res.hc, cex = 0.2, main = "Cluster Dendrogram", xlab = "Cluster Groups",
     ylab = "Height")
 
### Clustering with K-medoids
# With dissimilarity matrix from above

pam.res <- pam(res.dist, k=4)
summary(pam.res)
clus <- pam.res$clustering

clusplot(res.dist, clus, diss=TRUE,
         color = TRUE, labels=4,
         plotchar=TRUE, 
         main = "Cluster Plot using Pam with Dissimilar Matrix")

pam.res$isolation
pam.res$clusinfo
pam.res$call
 

###### Plot PAM Using Silhouette Method

# Create empty vector, display the cluster summary data, and plot

clus_res <- numeric()

for (k in 2:20) {
  clus_res[k] <- pam(subset_clus, k)$silinfo$avg.width
}

summary(clus_res)

plot(1:20, clus_res, xlab ="Number  of Clusters",
     main = "Pam Clustering with Silhouette Method",
     ylab = "Avg Silhouette Width",
     type = "b")
## Clustering using DBSCAN

set.seed(123)
 
# Create DBScan plot to compare against Kmeans

db_fpc <- fpc::dbscan(subset_clus, eps = 1.3, MinPts = 4)
 
###### Plot DBSCAN Plot

fviz_cluster(db_fpc, data = subset_clus, geom = "point",
             ellipse = TRUE, show.clust.cent = FALSE,
             main = "Cluster Plot using DBSCAN")
 
## Heatmaps
# Use heatmaps to view correlations

heatmap.2(subset_clus, scale = "none", col = bluered(100), 
          trace = "none", density.info = "none")
 
# Split Heatmap by rows and by k-means

set.seed(123)
subset_mat <- as.matrix(subset_clus)
heatmap(subset_mat, k = 4)
 

## Network Diagrams
# Build network diagrams to view anomalies
# Create links and nodes, get unique list of IPs for the nodes list, SRC and Dst IPs

src <- test.ts %>%
  distinct(Src_IP) %>%
  rename(label = Src_IP)

dest <- test.ts %>%
  distinct(Dst_IP) %>%
  rename(label = Dst_IP)
 

# Get unique IPs to create nodes list and add unique rowids

nodes <- full_join(src,dest, by = "label")

nodes <- nodes %>% rowid_to_column("id")
 
# Create list of nodes per route

per_route <- test.ts %>%
  group_by(Src_IP, Dst_IP) %>%
  summarize(weight = n()) %>%
  ungroup()
 
# Create the list of links aka edges

edges <- per_route %>%
  left_join(nodes, by = c("Src_IP" = "label")) %>%
  rename(from = id)

edges <- edges %>%
  left_join(nodes, by = c("Dst_IP" = "label")) %>%
  rename(to = id)
edges


# Create a Community of Links for Network Plot

edges1 <- select(edges, Src_IP, Dst_IP)

edges <- select(edges, from, to, weight)

###### Plot Network Using igraph


routes_i <- graph_from_data_frame(d = edges, vertices = nodes, directed = TRUE)

plot(routes_i, layout = layout_with_graphopt, edge.arrow.linewidth = .01)


###### Build Network Using Tidygraph

routes_tidy <- tbl_graph(nodes = nodes, edges = edges, directed = TRUE)


###### Plot Tidygraph Network

routes_tidy %>% 
  activate(edges) %>% 
  arrange(desc(weight))

ggraph(routes_tidy, layout = "dh") + 
  geom_node_point() +
  geom_edge_link(edge_width = .09) + 
  scale_edge_width(range = c(0.2, 2)) +
  geom_node_text(aes(label = label),  repel = TRUE) +
  labs(edge_width = "Connections")

##  Anomaly Detection in Time Series Data using Anomalize
#  Create Tibble table

test.ts <- tibble(test.ts)

test.ts <- as_tbl_time(test.ts, index = UTC)

###### Plot Time Series Data using QESD Method

test.ts %>% time_decompose(Src_IP, method = "stl", frequency = "auto", 
                           trend = "auto") %>%
  anomalize(remainder, method = "gesd", alpha = 0.05,     max_anoms = 0.3) %>%
  time_recompose() %>%
  plot_anomalies(time_recomposed = TRUE, ncol = 4)
 

###### Plot Time Series Data using IQRD Method

test.ts %>% time_decompose(Dst_IP, method = "stl", frequency = "auto", 
                           trend = "auto") %>%
  anomalize(remainder, method = "iqr", alpha = 0.05, max_anoms = 0.3) %>%
  plot_anomaly_decomposition()
 

###### Plot Anomalies with SRC_IP

###### With SRC_IP

test.ts %>% 
  time_decompose(Src_IP) %>%
  anomalize(remainder) %>%
  time_recompose() %>%
  plot_anomalies(time_recomposed = TRUE, ncol = 6, alpha_dots = 0.5)
 
###### Plot Anomalies with DST_IP

test.ts %>% 
  time_decompose(Dst_IP) %>%
  anomalize(remainder) %>%
  time_recompose() %>%
  plot_anomalies(time_recomposed = TRUE, ncol = 8, alpha_dots = 0.5)
 
###### Extract Anomalous Datapoints

anomaly <- test.ts %>% 
  time_decompose(Src_IP) %>%
  anomalize(remainder) %>%
  time_recompose() %>%
  filter(anomaly == 'Yes')
anomaly
