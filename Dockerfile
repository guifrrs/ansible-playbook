FROM manjarolinux/base:latest AS base

WORKDIR /usr/local/bin
RUN pacman-key --init && \
pacman -Sy --noconfirm && \
pacman -S --noconfirm gnupg archlinux-keyring manjaro-keyring && \
pacman-key --populate archlinux manjaro && \
pacman -Sc && \
pacman -Syu --noconfirm && \
pacman -S --noconfirm git curl ansible base-devel ansible-lint

ARG username

RUN useradd $username 
RUN passwd -d $username 
RUN usermod -aG wheel $username 
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/$username

FROM base as builder

COPY . . 
RUN chown -R $username:$username  /home/$username