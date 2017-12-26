# Build dependency for Ubuntu 14.04 
# Ref: https://caffe2.ai/docs/getting-started.html?platform=ubuntu&configuration=compile
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

# If scipy fails to get installed because fortran is not installed, try
# Ref: https://stackoverflow.com/questions/26575587/cant-install-scipy-through-pip
sudo apt-get install libatlas-base-dev gfortran

# If cython version is below 0.23
#sudo pip install --upgrade cython 

# If Jupyter fails to get installed, try
# Ref: http://jupyter.org/install.html
python3 -m pip install --upgrade pip
python3 -m pip install jupyter

# If scikit-image fails to get installed by pip, try
sudo apt-get install python-skimage 

# Build and install Caffe2
git clone --recursive https://github.com/caffe2/caffe2.git
cd caffe2 && make
cd build && sudo make install
python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"

# If Caffe2 still fails to run after all dependencies are resolved, try open a Python shell and type "from caffe2.python import core"
# One common error might be "ImportError: No module named past.builtins", try the following if that's the case 
# Ref: https://github.com/caffe2/caffe2/issues/712
sudo pip install future

# To enable Caffe2 outside build/, make sure the following command is run or added to .bashrc or .bash_profile
export PYTHONPATH=/usr/local

# Install ONNX
sudo apt-get install libprotobuf-java protobuf-compiler
apt-cache policy protobuf-compiler

sudo pip install onnx
sudo pip install onnx-caffe2
