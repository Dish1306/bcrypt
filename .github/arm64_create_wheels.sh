yum update -y
/opt/_internal/cpython-$1*/bin/python -m pip install -U pip setuptools wheel
#PY_LIMITED_API="--build-option --py-limited-api"
#/opt/_internal/cpython-$1*/bin/pip wheel bcrypt --no-binary bcrypt --no-deps --wheel-dir=wheelhouse $PY_LIMITED_API
#/opt/_internal/cpython-$1*/bin/python -m pip install -U pip setuptools wheel
/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel --py-limited-api=cp36 -d wheelhouse
ls wheelhouse
