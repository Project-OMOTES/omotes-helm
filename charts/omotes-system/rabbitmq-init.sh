rabbitmqctl add_vhost omotes;
rabbitmqctl set_permissions --vhost omotes root ".*" ".*" ".*";
rabbitmqctl add_vhost omotes_celery;
rabbitmqctl set_permissions --vhost omotes_celery root ".*" ".*" ".*";
rabbitmqctl add_user --vhost omotes "$RABBITMQ_OMOTES_USER_NAME" "$RABBITMQ_OMOTES_USER_PASSWORD";
rabbitmqctl set_permissions --vhost omotes "$RABBITMQ_OMOTES_USER_NAME" ".*" ".*" ".*";
rabbitmqctl add_user --vhost omotes_celery "$RABBITMQ_CELERY_USER_NAME" "$RABBITMQ_CELERY_USER_PASSWORD";
rabbitmqctl set_permissions --vhost omotes_celery "$RABBITMQ_CELERY_USER_NAME" ".*" ".*" ".*";
