docker build . -t exakat/githubaction:latest 


docker run -it --rm -v `pwd`/test/:/github/workspace --entrypoint=/bin/bash exakat/githubaction:latest

docker run -it --rm -v `pwd`/test/:/github/workspace \
            -e INPUT_IGNORE_RULES='Structures/CouldUseShortAssignation' \
            -e INPUT_EXIT_ON_ISSUES='true' \
            --entrypoint=/bin/bash exakat/githubaction:latest

docker run -it --rm -v `pwd`/test/:/github/workspace \
            -e INPUT_EXIT_ON_ISSUES='1' \
            --entrypoint=/bin/bash exakat/githubaction:latest

docker run -it --rm -v `pwd`/test/:/github/workspace \
            -e INPUT_EXIT_ON_ISSUES='0' \
            --entrypoint=/bin/bash exakat/githubaction:latest
