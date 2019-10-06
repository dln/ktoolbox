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
 _______          _ _                         Context: ${KTOOLBOX_CONTEXT}
|__   __|        | | |                      Namespace: ${K8S_POD_NAMESPACE}
   | | ___   ___ | | |__   _____  __             Node: ${K8S_NODE_NAME}
   | |/ _ \\ / _ \\| | '_ \\ / _ \ \\/ /          Host IP: ${K8S_HOST_IP}
   | | (_) | (_) | | |_) | (_) >  <          Pod Name: ${K8S_POD_NAME}
   |_|\\___/ \\___/|_|_.__/ \\___/_/\\_\\           Pod IP: ${K8S_POD_IP}
                                      Service Account: ${K8S_POD_SERVICE_ACCOUNT}

EOF
fi
