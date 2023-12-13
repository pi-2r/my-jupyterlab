#!/bin/bash
#
# Script to Install
# Linux System Tools and Basic Python Components
# as well as to
# Start Jupyter Lab Server

# GENERAL LINUX
apt-get update  # updates the package index cache
apt-get upgrade -y  # updates packages
# install system tools
apt-get install -y gcc git htop screen htop vim wget
apt-get upgrade -y bash  # upgrades bash if necessary
apt-get clean  # cleans up the package index cache

# INSTALLING MINICONDA
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -O Miniconda.sh
bash Miniconda.sh -b  # installs Miniconda
rm -rf Miniconda.sh  # removes the installer
# prepends the new path for current session
export PATH="/root/miniconda3/bin:$PATH"
# prepends the new path in the shell configuration
cat >> ~/.profile <<EOF
export PATH="/root/miniconda3/bin:$PATH"
EOF

# INSTALLING PYTHON LIBRARIES
conda install -y numpy nomkl  # installing NumPy (no MKL)
conda install -y pandas  #  data analysis package
conda install -y scikit-learn  # machine learning with Python
conda install -y matplotlib  # standard plotting library

pip install --upgrade pip  # upgrading the package manager
pip install q  # logging and debugging
pip install plotly  # interactive D3.js plots
pip install cufflinks  # combining plotly with pandas and matplotlib
pip install yfinance # Yahoo Finance market data downloader
pip install oandapyV20 #OANDA REST-V20 API wrapper
pip install oanda-candles #OANDA REST-V20 API wrapper
pip install apscheduler #Advanced Python Scheduler
pip install config
pip install pandas-ta #Technical Analysis Indicators
pip install Riskfolio-Lib #Riskfolio-Lib is a Python library for financial risk analysis.

# COPYING FILES AND CREATING DIRECTORIES
mkdir /root/.jupyter
mv /root/jupyter_notebook_config.py /root/.jupyter/
mkdir /opt/notebook
cd /opt/notebook

#INSTALL TA-LIB
apt-get -y install gcc build-essential
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
  && sudo tar -xzf ta-lib-0.4.0-src.tar.gz \
  && sudo rm ta-lib-0.4.0-src.tar.gz \
  && cd ta-lib/ \
  && sudo ./configure --build=aarch64-unknown-linux-gnu \
  && sudo make \
  && sudo make install \
  && cd .. \
  && sudo rm -rf ta-lib/ \
  && pip install ta-lib

#Install tpqao
git clone https://github.com/yhilpisch/tpqoa
cd tpqoa
python setup.py install
cd ..
rm -rf tpqao

# CREATING YOUR OWN PASSWORD
#jupyter server password

# STARTING JUPYTERLAB
jupyter lab --allow-root &
