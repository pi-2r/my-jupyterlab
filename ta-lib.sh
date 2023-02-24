#!/bin/bash

sudo apt-get -y install gcc build-essential
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