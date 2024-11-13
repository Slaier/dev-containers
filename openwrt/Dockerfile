FROM docker.io/library/debian:latest

ARG USERNAME=runner
ARG USER_UID=1000
ARG USER_GID=100

ARG REPO=hzyitc/openwrt-redmi-ax3000
ARG REF=ipq50xx-qsdk-kernel-5.4-openwrt-21.02-qsdk-11.5.05.841.1029

RUN apt-get update && apt-get install -y coccinelle \
    sudo build-essential ccache clang flex g++ gawk gcc-multilib gettext git \
    libncurses5-dev libssl-dev python3-distutils rsync wget unzip zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN git config --system user.name $USERNAME && git config --system user.email $USERNAME@example.com

WORKDIR /home/$USERNAME
USER $USERNAME

ADD --keep-git-dir=true --chown=$USER_UID:$USER_GID \
    https://github.com/$REPO.git#$REF \
    /home/$USERNAME/openwrt-redmi-ax3000

WORKDIR /home/$USERNAME/openwrt-redmi-ax3000

RUN ./scripts/feeds update -a && ./scripts/feeds install -a

COPY --chown=$USER_UID:$USER_GID .config .
RUN make defconfig

RUN mkdir -p dl && \
    wget -qO- https://github.com/$REPO/releases/download/ci-$REF-20240727-173350-UTC/dl.tar | tar xf - -C dl

RUN make -j16 download
