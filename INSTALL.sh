# Build dependency for Ubuntu 14.04 
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      git \
      libgoogle-glog-dev \
      libprotobuf-dev \
      protobuf-compiler \
      python-dev \
      python-pip                          
sudo pip install numpy protobuf

# If fortran is not installed
sudo apt-get install libatlas-base-dev gfortran

# If cython version is below 0.23
#sudo pip install --upgrade cython 

# Optional dependency for Ubuntu 14.04
sudo apt-get install -y --no-install-recommends libgflags2
sudo apt-get install -y --no-install-recommends \
      libgtest-dev \
      libiomp-dev \
      libleveldb-dev \
      liblmdb-dev \
      libopencv-dev \
      libopenmpi-dev \
      libsnappy-dev \
      openmpi-bin \
      openmpi-doc \
      python-pydot
sudo pip install \
      flask \
      future \
      graphviz \
      hypothesis \
      jupyter \
      matplotlib \
      pydot python-nvd3 \
      pyyaml \
      requests \
      scikit-image \
      scipy \
      setuptools \
      six \
      tornado

# If Jupyter fails to get installed, try
python3 -m pip install --upgrade pip
python3 -m pip install jupyter

# If scikit-image fails to get installed, try
sudo apt-get install python-skimage 

# Build and install Caffe2
git clone --recursive https://github.com/caffe2/caffe2.git
cd caffe2 && make
cd build && sudo make install
python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"

# If Caffe2 still fails to run after all dependencies are resolved, try open a Python shell and type "from caffe2.python import core"
# One common error might be "ImportError: No module named past.builtins", try the following if that's the case 
sudo pip install future
