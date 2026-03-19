# have vars like 
# whereFrom=/home/username/dir
#hostname="ur_hostname"
#userAndIP="x@10.0.0.1"
#in .env

iter () {
	xargs -I{} $@
}
pathToTheseUtils=~/d/g/g/desktop_system
source $pathToThisScript/.env

hyprland=$whereFrom/hypr
waybar=$whereFrom/waybari
swaync=$whereFrom/swaync
nvimc=$whereFrom/nvimc
nvim=$whereFrom/nvim_high_level_langs_config
zshFuncs=$where/desktop_system/global_sh_funcs

fromGithub() {
  whereFrom=https://github.com/jakubhalik
}
viaSSH() {
  mountpoint=~/safepath/temp/ssh
  find $mountpoint -maxdepth 0 || mkdir --parents $mountpoint
  cd $mountpoint
  find $hostname -maxdepth 0 || mkdir $hostname
  sshfs "$userAndIP:/" $hostname
}

clone() {
  find $whereFrom -maxdepth 0 || mkdir --parents $whereFrom
  find $whereFrom/../gh -maxdepth 0 || mkdir $whereFrom/../gh
  find $whereFrom/../gl -maxdepth 0 || mkdir $whereFrom/../gl
  find $whereFrom/../gl -maxdepth 0 || mkdir $whereFrom/../gl
  ls $mountpoint/$whereFrom | iter git clone $mountpoint/$whereFrom/{} $whereFrom/{}
  ls $mountpoint/$whereFrom | iter git clone $mountpoint/$whereFrom/../gh/{} $whereFrom/..gh/{}
  ls $mountpoint/$whereFrom | iter git clone $mountpoint/$whereFrom/../gl/{} $whereFrom/..gl/{}
  git clone $hyprland ~/.config/hypr
  git clone $waybar ~/.config/waybari
  git clone $swaync ~/.config/swaync
  git clone $nvim ~/.config/nvim
  git clone $nvimc ~/.config/nvimc
}

fullViaSSHSystemCopy() {
  viaSSH
  git clone $zshFuncs $whereFrom/desktop_system
  cp ~/d/g/g/desktop_system/.zshrc ~/.zshrc
  ssh $userAndIP "pacman -Qn"|iter sudo pacman -S --needed {}
  git clone https://aur.archlinux.org/yay ~/
  cd ~/yay
  makepkg -Csi
  ssh $userAndIP "pacman -Qm"|iter yay -S {}
  homedir="/home/x"
  scp $userAndIP:$homedir/.zsh_history ~/
  scp -r $userAndIP:$homedir/.config ~/
  scp -r $userAndIP:$homedir/.local ~/
  scp -r $userAndIP:$homedir/.mozilla ~/
  scp -r $userAndIP:$homedir/.icons ~/
  scp -r $userAndIP:$homedir/.themes ~/
  #scp -r $userAndIP:$homedir/.ssh ~/
  #scp -r $userAndIP:$homedir/.gnupg ~/
  clone
}
