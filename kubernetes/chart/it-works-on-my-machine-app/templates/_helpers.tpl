{{/*
Expand the name of the chart.
*/}}
{{- define "it-works-on-my-machine-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "it-works-on-my-machine-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "it-works-on-my-machine-app.backend.fullname" -}}
{{ include "it-works-on-my-machine-app.fullname" . }}-backend
{{- end }}

{{- define "it-works-on-my-machine-app.frontend.fullname" -}}
{{ include "it-works-on-my-machine-app.fullname" . }}-frontend
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "it-works-on-my-machine-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "it-works-on-my-machine-app.labels" -}}
helm.sh/chart: {{ include "it-works-on-my-machine-app.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common Backend labels
*/}}
{{- define "it-works-on-my-machine-app.backend.labels" -}}
{{ include "it-works-on-my-machine-app.labels" . }}
{{ include "it-works-on-my-machine-app.backend.selectorLabels" . }}
{{- end }}

{{/*
Common Frontend labels
*/}}
{{- define "it-works-on-my-machine-app.frontend.labels" -}}
{{ include "it-works-on-my-machine-app.labels" . }}
{{ include "it-works-on-my-machine-app.frontend.selectorLabels" . }}
{{- end }}

{{/*
Selector Backend labels
*/}}
{{- define "it-works-on-my-machine-app.backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "it-works-on-my-machine-app.name" . }}-backend
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector Frontend labels
*/}}
{{- define "it-works-on-my-machine-app.frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "it-works-on-my-machine-app.name" . }}-frontend
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
