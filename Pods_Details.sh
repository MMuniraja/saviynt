#!/bin/bash
echo "The pods are"
kubectl get pods --all-namespaces
echo "The  restarted pods are"
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'
echo " The pods sort by CPU%"
kubectl top pod | sort -k2 -r
