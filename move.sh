#!/bin/bash

# Move certain files for a month to a sub folder
ls -lrt *.DAT | grep " Apr " | awk '{print $9}' | xargs -I{} sudo mv {} 2021-04
