{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "spark.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 56 | trimSuffix "-" -}}
{{- end -}}
{{- define "worker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 56 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 56 chars because some Kubernetes name fields are limited to 63 (by the DNS naming spec),
as we append -worker or -master to the names
If release name contains chart name it will be used as a full name.
*/}}
{{- define "spark.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 56 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 56 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 56 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 56 chars because some Kubernetes name fields are limited to 63 (by the DNS naming spec),
as we append -worker or -master to the names
If release name contains chart name it will be used as a full name.
*/}}
{{- define "worker.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 56 | trimSuffix "-" -}}-worker
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 56 | trimSuffix "-" -}}-worker
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 56 | trimSuffix "-" -}}-worker
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "spark.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 56 | trimSuffix "-" -}}
{{- end -}}

