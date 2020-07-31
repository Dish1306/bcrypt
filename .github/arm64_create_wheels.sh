yum update -y
/opt/python/$1/bin/python -m virtualenv .venv
venv/bin/pip install setuptools wheel cffi six
PY_LIMITED_API="--build-option --py-limited-api=cp3${BASH_REMATCH[1]}"
#/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel --py-limited-api=cp36 -d wheelhouse
.venv/bin/pip wheel bcrypt --no-binary bcrypt --no-deps --wheel-dir=tmpwheelhouse $PY_LIMITED_API
auditwheel repair tmpwheelhouse/bcrypt*.whl -w wheelhouse/
.venv/bin/pip install bcrypt --no-index -f wheelhouse/
.venv/bin/python -c "import bcrypt; password = b'super secret password';hashed = bcrypt.hashpw(password, bcrypt.gensalt());bcrypt.checkpw(password, hashed)"
