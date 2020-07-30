yum update -y
yum install -y coreutils curl
alias python = /opt/_internal/cpython-$1*/bin/python
python -m pip install -U pip setuptools wheel
python setup.py bdist_wheel -d wheelhouse
#$1 -m pip install --upgrade pip
#$1 -m pip install --upgrade setuptools wheel
#$1 setup.py bdist_wheel --plat-name=manylinux2014_aarch64 -d wheelhouse
ls wheelhouse
#set -e
#set -x
#$1 -m pip install virtualenv
#$1 -m virtualenv ~/.venv
#source ~/.venv/bin/activate
#$1 -m pip install tox
#$1 -m pip install wheelhouse/bcrypt-3.1.8.dev1-cp36-cp36m-manylinux2014_aarch64.whl
#tox -e py36
