===========================================================================================================================
PyHRF: A Python Library for the Analysis of fMRI Data Based on Local Estimation of Hemodynamic Response Function (Notebook)
===========================================================================================================================

Repository containing the jupyter notebook that reproduces the results of the
manuscript presented at the *15th Python in Science Conference (Scipy 2017)*.


Dependencies
------------

This notebook **only works** with ``python 2.x.x`` because of the package ``pyhrf``.

Please check the ``requirements.txt`` file to know the necessary dependencies.
You can install them using the tool ``pip``.

.. code-block:: bash

   pip install -r requirements.txt

Finally, you need to install SPM for image preprocessing. You can install it
using the ``install_spm12.sh`` script.

.. code-block:: bash

  ./install_spm12.sh


Run
---

Please launch jupyter and then select the notebook ``index.ipynb``.

.. code-block:: bash

   jupyter-notebook
