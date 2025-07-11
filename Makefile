.PHONY: backup build logs start stop status shell tail

help:
	@echo "rsync in a container!"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo " build      - build docker images locally"
	@echo " help       - print this help"
	@echo " logs       - print container logs"
	@echo " status     - show running container ps info"
	@echo " shell      - launch shell"
	@echo " start      - launch the container(s)"
	@echo " stop       - stop container(s)"

build:
	@bin/build

logs:
	docker compose logs

start:
	@bin/start

stop:
	@bin/stop

status:
	docker compose ps

shell:
	@bin/shell

tail:
	docker compose logs -f
