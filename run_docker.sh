docker stop prolog
docker rm prolog
docker build . -t prolog --network host
docker run --name prolog -d -i -t prolog /bin/bash
docker exec -it prolog swipl -s lista1/zad2.pl
