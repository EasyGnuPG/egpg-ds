# Container for developing and testing EGPG

## Installation

  - First install `ds`: https://github.com/docker-scripts/ds#installation

  - Then get the scripts from github:
    ```
    git clone --branch gnupg-2.2-bionic https://github.com/easygnupg/egpg-ds /var/ds/egpg-gnupg-2.2-bionic
    ```

  - Create a directory for the container: `ds init egpg-gnupg-2.2-bionic @egpg-gnupg-2.2-bionic`

  - Fix the settings: `cd /var/ds/egpg-gnupg-2.2-bionic/ ; vim settings.sh`

  - Get the proper branch of *egpg*: `git clone --branch gnupg-2.2 https://github.com/easygnupg/egpg`

  - Create the container: `ds make`


## Other commands

   ```
   ds stop
   ds start
   ds shell
   ds help
   ds inject run-tests.sh
   ```
