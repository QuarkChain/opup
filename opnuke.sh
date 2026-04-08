#!/bin/bash


# Get the directory of the script
script_dir=$(dirname "$(realpath "$0")")
source "$script_dir/common.sh"
prelude

rm -rf optimism op-geth op-reth blockscout da-server es-op-batchinbox izar-contracts storage-contracts-v1

postlude