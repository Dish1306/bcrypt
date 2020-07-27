apt-get update -qq
apt-get install -qq coreutils curl python3-pip libffi-dev $1 lib$1-dev
$1 -m pip install --upgrade pip
$1 -m pip install --upgrade setuptools wheel
$1 setup.py bdist_wheel --plat-name=manylinux2014_aarch64 -d wheelhouse
ls wheelhouse
