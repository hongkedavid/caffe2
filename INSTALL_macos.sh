# Build dependency for MacOS X
# Ref: https://caffe2.ai/docs/getting-started.html?platform=mac&configuration=compile
brew install \
automake \
cmake \
git \
glog

conda install -y --channel https://conda.anaconda.org/conda-forge  \
future \
gflags \
glog  \
numpy \
protobuf=3.4.0 \
six

git clone --recursive https://github.com/caffe2/caffe2.git && cd caffe2
mkdir build && cd build
cmake -Wno-dev -DUSE_CUDA=OFF ..
sudo make install

# If make install fails, try 
brew install protobuf
