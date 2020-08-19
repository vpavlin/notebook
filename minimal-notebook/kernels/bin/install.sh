#!/usr/bin/bash
. ${kernel_path}/metadata
[ -e ${kernel_path}/env ] && . ${kernel_path}env

virtualenv -p ${kernel_python_version} .virtual/${kernel_name}
source .virtual/${kernel_name}/bin/activate
pip install ipykernel
python -m ipykernel install --name ${kernel_name} --display-name "${kernel_display_name}" --prefix=/opt/app-root
pip install -r ${kernel_path}/requirements.txt
