{{- define "app.name" }}
{{- printf "%s" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "app.labels" }}
labels:
  app: {{ template "app.name" . }}
{{- end }}
