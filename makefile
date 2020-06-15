compose-build:
	mkdir -p ~/.localkube/ && kubectl config view --raw > ~/.localkube/config && docker-compose up
classic-build:
	./run.sh
