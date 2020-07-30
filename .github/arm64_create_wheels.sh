yum update -y
/opt/_internal/cpython-$1*/bin/python -m pip install -U pip setuptools wheel
/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel --build-option --py-limited-api=cp3${BASH_REMATCH[1]} -d wheelhouse
ls wheelhouse
