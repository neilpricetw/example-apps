{{/* Define common template helpers for this chart */}}
{{- define "example-voting-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "example-voting-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}
