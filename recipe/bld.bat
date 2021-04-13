set NO_DIST=1

set DAAL4PY_VERSION=%PKG_VERSION%
set MPIROOT=%PREFIX%\Library
IF DEFINED DAALROOT (set DALROOT=%DAALROOT%)
IF NOT DEFINED DALROOT (set DALROOT=%PREFIX%)
set PATH=%PATH%;%PREFIX%\Library\bin\libfabric

echo "clang-format --version"
clang-format --version
%PYTHON% -c "import shutil ; print(shutil.which('clang-format'))"

set PATH=%PREFIX%\Library\bin;%PATH%

echo "clang-format --version"
clang-format --version
%PYTHON% -c "import shutil ; print(shutil.which('clang-format'))"

%PYTHON% setup.py install --single-version-externally-managed --record record.txt
