{{- define "open5gs-ueransim.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "open5gs-ueransim.selector" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
