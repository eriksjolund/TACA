#!/bin/sh

display_usage() {
    echo "Usage:\n$0 installdir"
}

if [ $# -ne 1 ]; then
    echo error: Wrong number of parameters
    display_usage
    exit 1
fi

if [ ! -d "$1" ]; then
    echo error: Install directory does not exist
    display_usage
    exit 1
fi

echo "
export PYTHONUSERBASE=\"\$1\"
export PATH=\"\$PYTHONUSERBASE/bin:\$PATH\"
export LD_LIBRARY_PATH=\"\$PYTHONUSERBASE/lib\"
" > "$1/source_me.sh"

.  "$1/source_me.sh"

wget --no-clobber  https://bootstrap.pypa.io/get-pip.py

python get-pip.py --user

pip install --user illuminate
pip install --user git+git://github.com/vezzi/flowcell_parser.git
pip install --user git+git://github.com/SciLifeLab/statusdb.git
pip install --user git+git://github.com/eriksjolund/TACA.git
