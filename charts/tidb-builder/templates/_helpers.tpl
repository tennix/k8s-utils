{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "tidb-builder.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tidb-builder.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tidb-builder.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "pd.gitUser" -}}
{{- if .Values.pd -}}
{{- .Values.pd.gitUser | default "pingcap" -}}
{{- else -}}
{{- "pingcap" -}}
{{- end -}}
{{- end -}}

{{- define "pd.branch" -}}
{{- if .Values.pd -}}
{{- .Values.pd.branch | default "master" -}}
{{- else -}}
{{- "master" -}}
{{- end -}}
{{- end -}}

{{- define "tikv.gitUser" -}}
{{- if .Values.tikv -}}
{{- .Values.tikv.gitUser | default "tikv" -}}
{{- else -}}
{{- "tikv" -}}
{{- end -}}
{{- end -}}

{{- define "tikv.branch" -}}
{{- if .Values.tikv -}}
{{- .Values.tikv.branch | default "master" -}}
{{- else -}}
{{- "master" -}}
{{- end -}}
{{- end -}}

{{- define "tidb.gitUser" -}}
{{- if .Values.tidb -}}
{{- .Values.tidb.gitUser | default "pingcap" -}}
{{- else -}}
{{- "pingcap" -}}
{{- end -}}
{{- end -}}

{{- define "tidb.branch" -}}
{{- if .Values.tidb -}}
{{- .Values.tidb.branch  | default "master" -}}
{{- else -}}
{{- "master" -}}
{{- end -}}
{{- end -}}