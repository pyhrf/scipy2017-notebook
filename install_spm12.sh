#!/bin/bash

# This script is inspired by https://github.com/neurospin/pypreprocess/blob/master/continuous_integration/install_spm12.sh

# Dependencies

type wget >/dev/null 2>&1 || { echo >&2 "Please install wget.  Aborting."; exit 1; }
type unzip >/dev/null 2>&1 || { echo >&2 "Please install unzip.  Aborting."; exit 1; }

# Installation directory

SPM_ROOT_DIR="${HOME}/spm12"

echo -n "Where do you want to install SPM 12 [default: ${SPM_ROOT_DIR}] ? "
read new_spm_path

if [ $new_spm_path ]; then SPM_ROOT_DIR=$new_spm_path; fi
mkdir -p $SPM_ROOT_DIR && cd $SPM_ROOT_DIR

# Download SPM 12 installer

SPM_SRC=spm12_r????.zip
MCRINST=MCRInstaller.bin

# Install SPM 12

if [ ! -d spm12 ]; then
  echo -n "Downloading SPM installer ... "
  wget -N -r --quiet -l1 --no-parent -nd -P $SPM_ROOT_DIR -A.zip -R "index.html*" http://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/
  echo "done !"

  echo -n "Decompressing SPM ... "
  unzip -q -u $SPM_SRC
  chmod 755 spm12/run_spm12.sh
  echo "done !"
  echo
fi

if [ ! -d mcr ]; then
  echo -n "Downloading MCR Installer ... "
  wget -N -r --quiet -l1 --no-parent -nd -P $SPM_ROOT_DIR -A.bin http://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/MCR/glnxa64/
  chmod 755 $MCRINST
  echo "done !"

  echo -n "Installing Matlab's MCR ..."
  ./${MCRINST} -P bean421.installLocation="mcr" -silent
  echo "done !"
  echo
fi

# Create startup script

if [ ! -f spm12.sh ]; then
cat <<EOF > spm12.sh
#!/bin/bash
SPM12_STANDALONE_HOME=$SPM_ROOT_DIR/spm12
exec "\${SPM12_STANDALONE_HOME}/run_spm12.sh" "\${SPM12_STANDALONE_HOME}/../mcr/v713" \${1+"\$@"}
EOF

  chmod 755 spm12.sh
fi

# Create CTF

${SPM_ROOT_DIR}/spm12.sh quit
cmds="export SPM_DIR=$SPM_ROOT_DIR/spm12/; export SPM_MCR=$SPM_ROOT_DIR/spm12.sh"
${cmds}

echo "You may want to add the following commands to your ~/.bashrc file."
echo ${cmds}

echo
echo "Installation finished !"

