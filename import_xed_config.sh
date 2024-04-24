#!/bin/bash

# Description:

# Usage: import_xed_config.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

dconf load /org/x/editor/preferences/ < ./xed_configuration_backup
