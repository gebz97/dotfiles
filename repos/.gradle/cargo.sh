mkdir -pv /.cargo
cat << EOF >> /.cargo/config.toml
[registries]
cargo-proxy = { index = "sparse+http://nexus.gebz.local:8080/repository/crates-io/" }
cargo-group = { index = "sparse+http://nexus.gebz.local:8080/repository/cargo-group/" }

[registries.cargo-hosted]
index = "sparse+http://nexus.gebz.local:8080/repository/cargo-hosted/"

[source.crates-io]
replace-with = "cargo-proxy"
EOF
