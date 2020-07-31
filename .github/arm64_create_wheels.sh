yum update -y
/opt/_internal/cpython-$1*/bin/python -m virtualenv .venv
venv/bin/pip install setuptools wheel cffi six
#/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel --py-limited-api=cp36 -d wheelhouse
.venv/bin/python setup.py bdist_wheel -d tmpwheelhouse --py-limited-api=cp36
auditwheel repair tmpwheelhouse/bcrypt*.whl -w wheelhouse/
.venv/bin/pip install bcrypt --no-index -f wheelhouse/
.venv/bin/python -c "import bcrypt; password = b'super secret password';hashed = bcrypt.hashpw(password, bcrypt.gensalt());bcrypt.checkpw(password, hashed)"
