# Get the directory of the script
script_dir=$(dirname "$(realpath "$0")")
source "$script_dir/common.sh"
prelude


pushd optimism && make op-node op-batcher op-proposer op-challenger cannon op-program && popd
if [ "$EL_CLIENT" = "geth" ]; then
    pushd op-geth && make geth && popd
else
    pushd optimism/rust && cargo build --release --bin op-reth && popd
    cp optimism/rust/target/release/op-reth op-reth/op-reth
fi

postlude