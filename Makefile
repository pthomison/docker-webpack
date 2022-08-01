IMAGE_NAME="pthomison/webpack"

build:
	docker build . -t $(IMAGE_NAME):localbuild

shell: build
	$(RUN_CONTAINER) /bin/zsh

tag: build
	docker tag $(IMAGE_NAME):localbuild  $(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME):localbuild  $(IMAGE_NAME):$(GIT_REV)

push: tag
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(GIT_REV)

clean:
	docker rmi \
		$(IMAGE_NAME):localbuild \
		$(IMAGE_NAME):latest
