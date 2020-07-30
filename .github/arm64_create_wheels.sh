yum update -y
yum install -y coreutils curl
/opt/_internal/cpython-$1*/bin/python -m pip install -U setuptools wheel
/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel -d wheelhouse
ls wheelhouse
