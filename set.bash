export PATH=$PATH:$PWD/google-cloud-sdk/bin
export CLOUDSDK_CONTAINER_USE_V1_API_CLIENT=false && export CLOUDSDK_CONTAINER_USE_V1_API=false && gcloud beta container clusters get-credentials mcortinas --region europe-west1 --project edreams-toy

