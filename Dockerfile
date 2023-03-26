FROM archlinux:latest AS base

RUN pacman-key --init && \
pacman -S --noconfirm git ansible

ARG USERNAME

RUN useradd $USERNAME 
RUN passwd -d $USERNAME 
RUN usermod -aG wheel $USERNAME 
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV HOME /home/$USERNAME

WORKDIR /home/$USERNAME

COPY . .
RUN chown -R $USERNAME:$USERNAME  /home/$USERNAME