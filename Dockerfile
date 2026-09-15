FROM registry.opensuse.org/opensuse/tumbleweed:latest
ENV ZYPP_PCK_PRELOAD=1
ENV ZYPP_CURL2=1

COPY zypper.conf /etc/zypp/zypper.conf

RUN zypper addrepo https://raw.githubusercontent.com/terrapkg/tuatara/refs/heads/tumbleweed/tuatara/repos/tuatara.repo && \
    rpm --import https://raw.githubusercontent.com/terrapkg/tuatara/refs/heads/tumbleweed/tuatara/build-key/gpg-pubkey-tuatara-tumbleweed.asc && \
    zypper up -y && \
    zypper install -y \
subatomic-cli anda{,-srpm-macros} tuatara-build-key terra-appstream-helper gh git-core wget less mold osc openssh sudo jq \
cargo-packaging '*-rpm-macros'
