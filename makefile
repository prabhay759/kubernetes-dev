compose-run:
	mkdir -p ~/.localkube/ && kubectl config view --raw > ~/.localkube/config && docker-compose up
classic-run:
	./run.sh
