yum update -y
/opt/_internal/cpython-$1*/bin/python -m pip install -U pip setuptools wheel
#/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel --py-limited-api=cp36 -d wheelhouse
/opt/_internal/cpython-$1*/bin/python setup.py bdist_wheel -d tmpwheelhouse --py-limited-api=cp36
auditwheel repair tmpwheelhouse/bcrypt*.whl -w wheelhouse/
/opt/_internal/cpython-$1*/bin/python -m pip install bcrypt --no-index -f wheelhouse/
/opt/_internal/cpython-$1*/bin/python -c "import bcrypt; password = b'super secret password';hashed = bcrypt.hashpw(password, bcrypt.gensalt());bcrypt.checkpw(password, hashed)"
mkdir bcrypt-wheelhouse
mv wheelhouse/bcrypt*.whl bcrypt-wheelhouse/
echo "########################### python 3.6 ###########################################"
/opt/_internal/cpython-3.6*/bin/python -m pip install wheelhouse/bcrypt-3.1.8.dev1-cp36-abi3-linux_aarch64.whl
ls wheelhouse
