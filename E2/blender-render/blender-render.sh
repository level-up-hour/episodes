#!/bin/bash

display_usage() {
	echo -e "\nUsage:\n$0 BLEND_FILE (assumes to add 'blend') \n"
}

# if less than one argument supplied, display usage
if [  $# -le 0 ]
then
    display_usage
    exit 1
fi

echo "Starting `date`"
/opt/blender/blender -b $1.blend -t 0 -x 1 -o //$1_render -a
echo "Completed render at `date`"

