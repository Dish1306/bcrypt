yum update -y
/opt/python/$1/bin/pip install virtualenv
/opt/python/$1/bin/python -m virtualenv .venv
.venv/bin/pip install -U pip==10.0.1
.venv/bin/pip install setuptools wheel cffi six
REGEX="cp3([0-9])*"
          if [[ "$1" =~ $REGEX ]]; then
              PY_LIMITED_API="--build-option --py-limited-api=cp3${BASH_REMATCH[1]}"
          fi
.venv/bin/pip wheel bcrypt --no-binary bcrypt --no-deps --wheel-dir=tmpwheelhouse $PY_LIMITED_API
#.venv/bin/python setup.py bdist_wheel $PY_LIMITED_API -d tmpwheelhouse
auditwheel repair tmpwheelhouse/bcrypt*.whl -w wheelhouse/
.venv/bin/pip install bcrypt --no-index -f wheelhouse/
.venv/bin/python -c "import bcrypt; password = b'super secret password';hashed = bcrypt.hashpw(password, bcrypt.gensalt());bcrypt.checkpw(password, hashed)"
#/opt/python/$1/bin/pip install setuptools wheel cffi six
#/opt/python/$1/bin/pip wheel bcrypt --no-binary bcrypt --no-deps --wheel-dir=tmpwheelhouse $PY_LIMITED_API
#auditwheel repair tmpwheelhouse/bcrypt*.whl -w wheelhouse/
#/opt/python/$1/bin/pip install bcrypt --no-index -f wheelhouse/
#/opt/python/$1/bin/pip/python -c "import bcrypt; password = b'super secret password';hashed = bcrypt.hashpw(password, bcrypt.gensalt());bcrypt.checkpw(password, hashed)
