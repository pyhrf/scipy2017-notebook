FROM andrewosh/binder-base

MAINTAINER Jaime Arias <jaime.arias@inria.fr>

USER root

# Update the image
RUN apt-get update

USER main

# Install PyHRF dependencies
RUN conda update conda -y --quiet && \
    pip2 install pip -U && \
    pip2 install "scipy>=0.9" && \
    pip2 install "sympy>=0.7" && \
    pip2 install "nipy>=0.3.0" && \
    pip2 install "matplotlib>=1.1" && \
    pip2 install colorama click joblib bs4 lxml fetchopenfmri scikit-learn nilearn pandas Sphinx sphinx_bootstrap_theme && \
    pip2 install -e git://github.com/nipy/nipype.git#egg=nipype && \
    pip2 install "nibabel>=1.1, <2.1.0" && \
    pip2 install "numpy>=1.6, <1.12" && \
    pip2 install git+https://github.com/pyhrf/pyhrf.git

