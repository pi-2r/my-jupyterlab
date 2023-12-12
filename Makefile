include example.env
export


# Operating with simple Docker container
# --------------------------------------
create:
	docker build -t ${IMAGE_NAME} .
run:
	docker run -d -p ${MY_JUPYTERLAB_ENTRY_PORT}:8888 -v "$(CURDIR)/${MY_JUPYTERLAB_MOUNT_FOLDER}":/opt/notebook --name ${CONTAINER_NAME} ${IMAGE_NAME}

ps:
	docker ps -a | grep "${CONTAINER_NAME}"

log:
	docker logs ${CONTAINER_NAME}

flog:
	docker logs --follow ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

rm:
	docker rm ${CONTAINER_NAME}

remove:
	make stop
	make rm
