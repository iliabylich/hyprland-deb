FROM debian:unstable

RUN echo "deb http://deb.debian.org/debian unstable main" > /etc/apt/sources.list
RUN rm -f /etc/apt/sources.list.d/debian.sources

RUN apt update

RUN apt install -y curl git debhelper cmake pkg-config wget ninja-build gnupg2
RUN apt install -y libgles-dev libxkbcommon-dev librust-wayland-server-dev wayland-protocols libpango1.0-dev libdrm-dev libinput-dev hwdata libseat-dev libdisplay-info-dev libliftoff-dev libgbm-dev libhyprlang-dev xwayland libxcb-util-dev libxcb-xfixes0-dev libxcb-icccm4-dev libxcb-composite0-dev libxcb-res0-dev libxcb-ewmh-dev libxcb-errors-dev meson libtomlplusplus-dev

RUN curl -s --compressed "https://hyprland-debian.github.io/public.gpg" | gpg --dearmor | tee /etc/apt/trusted.gpg.d/hyprland-debian.gpg > /dev/null
RUN echo "deb [signed-by=/etc/apt/trusted.gpg.d/hyprland-debian.gpg] https://hyprland-debian.github.io ./" | tee /etc/apt/sources.list.d/hyprland-debian.list > /dev/null

RUN apt update

RUN apt install -y hyprwayland-scanner hyprcursor hyprutils

CMD ["/shared/build-in-docker.sh"]
