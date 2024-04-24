#!/bin/bash

# Description:

# Usage: export_xed_config.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)
# Date: 2024-04-23

dconf dump /org/x/editor/preferences/ > ./xed_configuration_backup
