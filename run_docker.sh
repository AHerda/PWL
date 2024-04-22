docker stop prolog
docker rm prolog
docker build . -t prolog --network host
docker run --name prolog -d -i -t prolog /bin/bash
docker exec -it prolog swipl -s lista4/zad4.pl # alternativelly: docker exec -it prolog bash
