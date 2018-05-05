kubectl create -f cassandra-service.yaml
kubectl get svc cassandra
kubectl create -f cassandra-statefulset.yaml
kubectl get statefulset cassandra
kubectl get pods -l="app=cassandra"
kubectl exec cassandra-0 -- nodetool status
#kubectl edit statefulset cassandra

# check quotas
gcloud compute project-info describe --project myproject

#https://kubernetes.io/docs/reference/kubectl/cheatsheet/
kubectl explain pods,svc
kubectl get services 
kubectl get pods --all-namespaces 
kubectl get pods -o wide
kubectl get deployment my-dep 
kubectl get pods --include-uninitialized 
 kubectl describe nodes my-node
 kubectl describe pods my-pod
kubectl get services --sort-by=.metadata.name 
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'
kubectl get pods --selector=app=cassandra rc -o   jsonpath='{.items[*].metadata.labels.version}'
kubectl get pods --field-selector=status.phase=Running
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'
sel=${$(kubectl get rc my-rc --output=json | jq -j '.spec.selector | to_entries | .[] | "\(.key)=\(.value),"')%?}
echo $(kubectl get pods --selector=$sel --output=jsonpath={.items..metadata.name})
JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}'  && kubectl get nodes -o jsonpath="$JSONPATH" | grep "Ready=True"

