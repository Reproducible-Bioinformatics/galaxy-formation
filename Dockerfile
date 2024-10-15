FROM --platform=linux/amd64 ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /formation
RUN apt-get update -y && apt-get install -y \
	ansible \
	git \
	python3 \
	python3-pip \
	sshpass \
	sudo \
	systemd
RUN apt-get clean
COPY . /formation
RUN ansible-galaxy install -r /formation/requirements.yaml \
	-p /formation/roles/ --force
RUN ansible-playbook --connection=local -i 127.0.0.1, /formation/main.yaml
CMD ["/usr/sbin/init"]
