#!/bin/sh
set -x
cd /home/jovyan
{{- if .Values.gitNotebooks.secretName }}
cp -r /tmp/.ssh /root/
chmod 600 /root/.ssh/*
{{- else }}
mkdir /root/.ssh
{{- end }}
echo "Loading notebooks from git repo"
{{- range .Values.gitNotebooks.repos }}
if [ ! -d "/home/jovyan/{{ .name }}" ]
then
    echo "Cloning {{ .name }} notebook repository"
    {{- if or (hasPrefix "git" .repo) (hasPrefix "ssh" .repo) }}
    ssh-keyscan {{ .repo | regexFind "@([a-zA-Z0-9.]*)" | replace "@" "" }} >> ~/.ssh/known_hosts
    {{- end }}
    git clone {{ .repo }} {{ .name }}
else 
    echo "{{ .name }} notebook repository already cloned"
fi
{{- end }}
# exit code 0 to continue deployment even if git clone fails
exit 0