#!/bin/bash


DOCKERHUB_USERNAME=jainrounak6
TEMP_SHA=bbcc5d29a47eb15e48ce2aa7e31ebbea60771a60

# Define the list of image names
images=("loadgenerator" "adservice" "frontend" "cartservice" "paymentservice" "checkoutservice" "emailservice" "currencyservice" "recommendationservice" "shippingservice" "productcatalogservice")

# Initialize an empty SARIF file
echo '#Image scan result' > trivy-results.sarif

# Iterate through each image, run Trivy scan, and append the results to the SARIF file
for image in "${images[@]}"; do
  trivy image -f sarif --no-progress "$DOCKERHUB_USERNAME/$image:$TEMP_SHA" >> trivy-results.sarif
  # Add a separator between individual SARIF results
  echo -e "\n\n" >> trivy-results.sarif
done
