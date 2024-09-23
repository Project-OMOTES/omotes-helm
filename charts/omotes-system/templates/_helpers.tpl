{{- define "omotes-system.mesido-deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: {{ .globalContext.Release.Namespace }}
  labels:
    app: {{ .worker.name }}
  name: {{ .worker.name }}
spec:
  replicas: {{ .worker.number_of_replicas }}
  selector:
    matchLabels:
      app: {{ .worker.name }}
  template:
    metadata:
      labels:
        app: {{ .worker.name }}
    spec:
      containers:
        - env:
          - name: INFLUXDB_HOSTNAME
            value: omotes-influxdb
          - name: INFLUXDB_PORT
            valueFrom:
              configMapKeyRef:
                name: omotes-env-vars-cm
                key: INFLUXDB_PORT
          - name: INFLUXDB_USERNAME
            valueFrom:
              secretKeyRef:
                name: omotes-env-vars-secrets
                key: INFLUXDB_FRONTEND_ADMIN_USER
          - name: INFLUXDB_PASSWORD
            valueFrom:
              secretKeyRef:
                name: omotes-env-vars-secrets
                key: INFLUXDB_FRONTEND_ADMIN_USER_PASSWORD
          - name: RABBITMQ_HOSTNAME
            value: omotes-rabbitmq
          - name: RABBITMQ_PORT
            value: "5672"
          - name: RABBITMQ_USERNAME
            valueFrom:
              secretKeyRef:
                name: omotes-env-vars-secrets
                key: RABBITMQ_CELERY_USER_NAME
          - name: RABBITMQ_PASSWORD
            valueFrom:
              secretKeyRef:
                name: omotes-env-vars-secrets
                key: RABBITMQ_CELERY_USER_PASSWORD
          - name: RABBITMQ_VIRTUALHOST
            value: omotes_celery
          - name: GROW_TASK_TYPE
            value: {{ .worker.task_type }}
          - name: LOG_LEVEL
            valueFrom:
              configMapKeyRef:
                name: omotes-env-vars-cm
                key: LOG_LEVEL
          image: {{ .worker.image }}:{{ .worker.version }}
          name: {{ .worker.name }}
      restartPolicy: Always
{{- end -}}
