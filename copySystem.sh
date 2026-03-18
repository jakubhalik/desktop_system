iter () {
	xargs -I{} $@
}
whereFrom=/home/x/d/g/g
hyprland=$whereFrom/hypr
waybar=$whereFrom/waybari
swaync=$whereFrom/swaync
nvimc=$whereFrom/nvimc
nvim=$whereFrom/nvim_high_level_langs_config

fromGithub() {
  whereFrom=https://github.com/jakubhalik
}
viaSSH() {
  userAndIP="x@10.0.0.1" #example
  whereFromSSH="$userAndIP:$whereFrom"
  hyprland=$whereFromSSH/hypr
  waybar=$whereFromSSH/waybari
  swaync=$whereFromSSH/swaync
  nvim=$whereFromSSH/nvim_high_level_langs_config
  nvimc=$whereFromSSH/nvimc
  zshFuncs=$whereFromSSH/desktop_system/global_sh_funcs
}

clone() {
  git clone $hyprland ~/.config/hypr
  git clone $waybar ~/.config/waybari
  git clone $swaync ~/.config/swaync
  git clone $nvim ~/.config/nvim
  git clone $nvimc ~/.config/nvimc
}

fullViaSSHSystemCopy() {
  viaSSH
  git clone $zshFuncs ~/d/g/g/desktop_system
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
