# Container for developing and testing EGPG

## Installation

  - First install `ds`: https://github.com/docker-scripts/ds#installation

  - Then get the scripts from github:
    ```
    git clone --branch buster \
        https://github.com/easygnupg/egpg-ds \
        /opt/docker-scripts/egpg-buster
    ```

  - Create a directory for the container: `ds init egpg-buster @egpg-buster`

  - Fix the settings: `cd /var/ds/egpg-buster/ ; vim settings.sh`

  - Get the proper branch of *egpg*: `git clone --branch gnupg-2.2 https://github.com/easygnupg/egpg`

  - Create the container: `ds make`


## Other commands

   ```
   ds stop
   ds start
   ds shell
   ds help

   ds jekyll
   ds inject run-tests.sh
   ```
