set DAAL4PY_VERSION=%PKG_VERSION%
set MPIROOT=%PREFIX%\Library
set DAALROOT=%PREFIX%
set PATH=%PATH%;%PREFIX%\Library\bin\libfabric

%PYTHON% setup.py install
