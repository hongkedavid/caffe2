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
brew install protobuf
sudo make install
