# latest Ubuntu version
FROM jupyter/base-notebook:latest

# information about maintainer
MAINTAINER pi-2r

USER root

# add the jupyter notebook config
ADD jupyter_notebook_config.py /root

# add the bash script
ADD install.sh /

# change rights for the script
RUN chmod u+x /install.sh

# run the bash script
RUN /install.sh

# prepend the new path
ENV PATH /root/miniconda3/bin:$PATH

WORKDIR /opt/notebook

#Let's define this parameter to install jupyter lab instead of the default juyter notebook command so we don't have to use it when running the container with the option -e
ENV JUPYTER_ENABLE_LAB=yes

#EXPOSE 8888
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

