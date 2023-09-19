#!/usr/bin/env bash

set -aeuo pipefail

kubectl delete -f composition.yaml --ignore-not-found
kubectl delete -f configure/ --ignore-not-found
kubectl delete -R -f setup/ --ignore-not-found
kubectl delete clusterrolebinding provider-helm-admin-binding --ignore-not-found
kubectl delete clusterrolebinding provider-kubernetes-admin-binding --ignore-not-found
kubectl wait --for=delete providers.pkg.crossplane.io --all
kubectl wait --for=delete xrds --all
up uxp uninstall