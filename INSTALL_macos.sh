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

# Build Caffe2
git clone --recursive https://github.com/caffe2/caffe2.git && cd caffe2
mkdir build && cd build
cmake -Wno-dev -DUSE_CUDA=OFF ..
sudo make install

# If make install fails, try 
brew install protobuf

# Run Caffe2
python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"

# To enable Caffe2 outside build/, make sure the following command is run or added to .bashrc or .bash_profile
export PYTHONPATH=/usr/local

# Install ONNX
conda install -c conda-forge onnx

# Install ONNX Caffe2 bindings
pip install onnx-caffe2

# Error with development build: python -c "import setuptools, tokenize;__file__='/Users/kehong/onnx-caffe2/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" develop --no-deps" failed with error code 1
# git clone  https://github.com/onnx/onnx-caffe2.git
# pip install -e onnx-caffe2/

# Run onnx-caffe2 
# Ref: https://github.com/onnx/tutorials/blob/master/tutorials/Caffe2OnnxExport.ipynb
convert-caffe2-to-onnx predict_net.pb --caffe2-init-net init_net.pb --value-info '{"data": [1, [1, 3, 224, 224]]}' -o squeezenet.onnx

# Ref: https://github.com/onnx/tutorials/blob/master/tutorials/OnnxCaffe2Import.ipynb
convert-onnx-to-caffe2 squeezenet.onnx --output predict_net_new.pb --init-net-output init_net_new.pb
