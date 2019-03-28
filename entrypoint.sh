#!/bin/sh

## Execute all the Python scripts (.py) in the given directory.

execute_scripts() {
    echo "`date`: Executing all scripts in $1"
    for script in $1/*.py; do
        # Execute the script using Python.
        if [ -e $script ]; then
            python $script
            rc=$?
            if [ $rc -ne 0 ]; then
                echo "`date`: WARNING $script had a non-zero exit code ($rc)"
            fi
        fi
    done
    echo "`date`: Successfully executed all scripts in $1"
    return 0
}

if [ $# -eq 0 ]; then
    echo "Usage: ./entrypoint.sh /path/to/dir/"
else
    if [ ! -z $ENABLE ]; then
        execute_scripts "$@" || exit 1
    else
        echo "`date`: skipping... ENABLE not set"
    fi
fi
