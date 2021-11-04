git submodule update --init --recursive
git submodule update --remote dotdrop
pip install --user -r dotdrop/requirements.txt
./dotdrop/bootstrap.sh
sed -i 's/DOTDROP_AUTOUPDATE-yes/DOTDROP_AUTOUPDATE-no/' dotdrop.sh
