yum update -y
yum install -y coreutils curl tree
alias python=/opt/_internal/cpython-$1*/bin/python
yum install -y python-pip
python -m pip install -U setuptools wheel
python setup.py bdist_wheel -d wheelhouse
ls wheelhouse
#set -e
#set -x
#$1 -m pip install virtualenv
#$1 -m virtualenv ~/.venv
#source ~/.venv/bin/activate
#$1 -m pip install tox
#$1 -m pip install wheelhouse/bcrypt-3.1.8.dev1-cp36-cp36m-manylinux2014_aarch64.whl
#tox -e py36
