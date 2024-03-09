#!/bin/sh

##################################
# Example menu for super kubectl #
##################################

# Syntax: 
# menuInit <menu title>
# submenuHead <sub menu title>
# menuItem <key> <action name> <shell function|shell comand>
# menuItemClm <key> <action name> <shell function|shell command> <key> <action name> <shell function|shell command>

source ./shellmenu.sh
trackchoices=$1

continuemenu=true
while ${continuemenu:=true}; do
clear
menuInit "Super KUBECTL Home"
submenuHead "Kubectl Config:"
menuItemClm a "Show config" "kubectl config view" b "Switch context" switchContext
menuItemClm c "Switch namespace" switchNamespace d "Add cluster" addCluster 
menuItemClm e "Add users (token)" addUsers f "Add context" addContext 
menuItemClm g "Edit config" "vim ~/.kube/config" h "Create namespace" createNamespace  
echo
submenuHead "Pods:"
menuItemClm j "List pods (ns=current)" "kubectl get pods -o wide" k "List pods (all namespaces)" "kubectl get pods --all-namespaces -o wide"
menuItemClm l "Show pod manifest (desired/observed)" showPodManifest m "Describe pod" describePod
menuItemClm n "Get logs" getPodLogs o "Log on to pod" logOnPod
menuItemClm p "Log on to DB" logOnDb r "Apply pod manifest" applyPodManifest
menuItem s "Delete pod" deletePod
echo
submenuHead "Deployments:"
menuItemClm v "List deployments (ns=current)" "kubectl get deployments -o wide" w "List deployments (all namespaces)" "kubectl get deployments --all-namespaces -o wide"
menuItemClm x "Show deployment manifest (desired/observed)" showDeploymentManifest y "Describe deployment" describeDeployment
menuItemClm z "List replicasets (ns=current)" "kubectl get rs -o wide" 1 "Describe replica set" describeReplicaset
menuItemClm 2 "Redeploy" redeploy 3 "Deployment history" deplHist
menuItemClm 4 "Undo deployment" rollbackDeployment 5 "Deployment status" deployState
echo
submenuHead "Services:"
menuItemClm 6 "List services (ns=current)" "kubectl get services -o wide" 7 "List services (all namespaces)" "kubectl get services --all-namespaces -o wide"
menuItemClm 8 "Show service manifest (desired/observed)" showServiceManifest 9 "Describe service" describeService
echo
submenuHead "Other stuff:"
menuItemClm I "List images in contexts" listImagesInUse J "Ingress configuration" "kubectl get ing -o json | jq -r '.items[].spec.rules[].http.paths[]'"
menuItemClm K "Describe ingress" "kubectl describe ing" "L" "Edit config map" editConfigMap

choice
done
echo "bye, bye, homie!"