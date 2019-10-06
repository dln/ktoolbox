if [[ -z "${K8S_NODE_NAME}" ]]; then
  export PS1='\h:\W\$ '
  cat <<EOF
 _______          _ _
|__   __|        | | |
   | | ___   ___ | | |__   _____  __
   | |/ _ \\ / _ \\| | '_ \\ / _ \\ \\/ /
   | | (_) | (_) | | |_) | (_) >  <
   |_|\\___/ \\___/|_|_.__/ \\___/_/\\_\\

EOF
else
  export PS1='${K8S_POD_NAMESPACE}/${K8S_POD_NAME}:\W\$ '
  cat <<EOF
 _______          _ _                              Node: ${K8S_NODE_NAME}
|__   __|        | | |                          Host IP: ${K8S_HOST_IP}
   | | ___   ___ | | |__   _____  __      Pod Namespace: ${K8S_POD_NAMESPACE}
   | |/ _ \\ / _ \\| | '_ \\ / _ \ \\/ /           Pod Name: ${K8S_POD_NAME}
   | | (_) | (_) | | |_) | (_) >  <              Pod IP: ${K8S_POD_IP}
   |_|\\___/ \\___/|_|_.__/ \\___/_/\\_\\    Service Account: ${K8S_POD_SERVICE_ACCOUNT}

EOF
fi
