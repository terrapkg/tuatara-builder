FROM registry.opensuse.org/opensuse/tumbleweed:latest
ENV ZYPP_PCK_PRELOAD=1
ENV ZYPP_CURL2=1

COPY zypper.conf /etc/zypp/zypper.conf

RUN zypper addrepo https://raw.githubusercontent.com/terrapkg/tuatara/refs/heads/tumbleweed/tuatara/repos/tuatara.repo && \
    rpm --import https://raw.githubusercontent.com/terrapkg/tuatara/refs/heads/tumbleweed/tuatara/build-key/gpg-pubkey-tuatara-tumbleweed.asc && \
    zypper install -y tuatara-build-key && \
    zypper refresh && \
    zypper update -y && \
    zypper install -y \
    anda \
    anda-srpm-macros \
    cargo \
    cargo-packaging \
    cmake-full \
    gh \
    git-core \
    jq \
    less \
    meson \
    mold \
    osc \
    openssh \
    python-rpm-macros \
    rust \
    satm \
    sudo \
    terra-appstream-helper \
    wget
