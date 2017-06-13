#!/bin/bash


# Installation directory

spm_path="${HOME}/opt/spm12"

echo "Where do you want to install SPM 12 [default: ${spm_path}] ? "
read new_spm_path

if [ $new_spm_path  ]; then
  spm_path=$new_spm_path
fi

mkdir -p $spm_path && cd $spm_path

SPM_SRC=spm12_r????.zip
MCRINST=MCRInstaller.bin
