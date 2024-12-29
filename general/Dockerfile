FROM ghcr.io/archlinux/archlinux:latest

ARG USERNAME=runner
ARG USER_UID=1000
ARG USER_GID=100

# Change pacman mirror
RUN echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist

# Install basic tools
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
    pacman -Syyuu --noconfirm && pacman -S --noconfirm curl git sudo wget

# Create normal user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Setup git config
RUN git config --system user.name $USERNAME \
    && git config --system user.email $USERNAME@example.com

# Switch to normal user
WORKDIR /home/$USERNAME
USER $USERNAME

# Install nix
RUN sh <(curl https://mirror.nju.edu.cn/nix/latest/install) --no-channel-add --no-modify-profile

# Install home-manager
RUN git clone https://github.com/slaier/hm-config.git /home/$USERNAME/.config/home-manager
COPY --chown=$USER_UID:$USER_GID nix.conf /home/$USERNAME/.config/nix/nix.conf
RUN export USER=$USERNAME \
    && source /home/$USERNAME/.local/state/nix/profiles/profile/etc/profile.d/nix.sh \
    && nix run github:nix-community/home-manager -- switch -b backup --flake /home/$USERNAME/.config/home-manager \
    && nix-collect-garbage -d \
    && unlink /home/$USERNAME/.nix-profile
