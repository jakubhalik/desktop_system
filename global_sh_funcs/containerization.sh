dk() { docker-compose up --build -d $@ }
gr() { docker exec -it gitlab-server gitlab-rails console }

docker_fix_pacman_ers() {
  pacman-key --init
  pacman-key --populate archlinux
  pacman -Syu
}

getdockercontainersip() {
  docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $@
}
getdockerip() {getdockercontainersip $@}
dockerip() {getdockercontainersip $@}
dockercontainersip() {getdockercontainersip $@}
containerip() {getdockercontainersip $@}
get_docker_ip() {getdockercontainersip $@}
get_docker_container_ip() {getdockercontainersip $@}
get_docker_containers_ip() {getdockercontainersip $@}
get_containers_ip() {getdockercontainersip $@}
docker_ip() {getdockercontainersip $@}
docker_container_ip() {getdockercontainersip $@}
docker_containers_ip() {getdockercontainersip $@}
containers_ip() {getdockercontainersip $@}

gamecontainer() {
  id=$$-$(date +%s%N)
  mkdir -p /tmp/sandbox-$id/{home,local,config,cache}
  chmod 700 /tmp/sandbox-$id/home
  bwrap \
    --unshare-pid \
    --unshare-uts \
    --unshare-ipc \
    --unshare-cgroup \
    --ro-bind /usr /usr \
    --ro-bind /etc /etc \
    --ro-bind /sys /sys \
    --ro-bind /opt /opt \
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --symlink usr/bin /bin \
    --symlink usr/sbin /sbin \
    --proc /proc \
    --dev-bind /dev /dev \
    --tmpfs /tmp \
    --bind /tmp/sandbox-$id/home /home/sandbox \
    --bind /tmp/sandbox-$id/local /home/sandbox/.local \
    --bind /tmp/sandbox-$id/config /home/sandbox/.config \
    --bind /tmp/sandbox-$id/cache /home/sandbox/.cache \
    --ro-bind /tmp/.X11-unix /tmp/.X11-unix \
    --bind /run/user/$UID /run/user/$UID \
    --setenv DISPLAY "$DISPLAY" \
    --setenv WAYLAND_DISPLAY "$WAYLAND_DISPLAY" \
    --setenv XDG_RUNTIME_DIR /run/user/$UID \
    --setenv HOME /home/sandbox \
    --setenv DBUS_SESSION_BUS_ADDRESS "unix:path=/run/user/$UID/bus" \
    --setenv LIBGL_ALWAYS_SOFTWARE 1 \
    --chdir /home/sandbox \
    --die-with-parent \
    --new-session \
    "$@"
  rm -rf /tmp/sandbox-$id
}
