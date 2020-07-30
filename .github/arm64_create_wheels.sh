yum update -y
/opt/_internal/cpython-$1*/bin/python -m pip install -U pip setuptools wheel
#PY_LIMITED_API="--py-limited-api=cp3${BASH_REMATCH[1]}"
#/opt/_internal/cpython-$1*/bin/pip wheel bcrypt --no-binary bcrypt --no-deps --wheel-dir=wheelhouse $PY_LIMITED_API
#/opt/_internal/cpython-$1*/bin/python -m pip install -U pip setuptools wheel
/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel --py-limited-api=cp36 -d wheelhouse
/opt/_internal/cpython-3.6.11/bin/python3.6 -m pip install wheelhouse/bcrypt-3.1.8.dev1-cp36-abi3-linux_aarch64.whl
/opt/_internal/cpython-3.7.8/bin/python3.7 -m pip install wheelhouse/bcrypt-3.1.8.dev1-cp36-abi3-linux_aarch64.whl
/opt/_internal/cpython-3.8.4/bin/python3.8 -m pip install wheelhouse/bcrypt-3.1.8.dev1-cp36-abi3-linux_aarch64.whl
ls wheelhouse
