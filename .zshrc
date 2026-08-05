#system
export EDITOR=nvim
alias src='source ~/.zshrc'
alias shed='nvim ~/.dots.me.macos/.zshrc'

#vivi
alias vivi='ssh me@vivi'

#remotes
alias sshrg='ssh rebelgroup@141.8.192.184'

#nvim
alias fvim='NVIM_APPNAME=fvim nvim'
alias svim='NVIM_APPNAME=svim nvim'
alias sved='NVIM_APPNAME=svim nvim ~/.dots.me.macos/.config/svim'

#git
alias sts='git status'
alias newb='git branch'
alias clc='git rm -r cached .'

#tools
alias lg='lazygit'
alias ddev='deno run dev'
alias ndev='npm run dev'
alias wdev='wrangler dev'

#projects
alias cda='cd /Users/dev/apps/'
#predator
alias tmpwc='/Users/dev/apps/predator-webclient-v1/tmux@yeri.sh'
alias tmpww='/Users/dev/apps/predator-cloudflare-form-worker/tmux@yeri.sh'
#newmooon
alias tmnmc='/Users/dev/apps/newmoon/tmux@yeri.sh'
alias tmnmw='/Users/dev/apps/newmoon-contact-form-worker/tmux@yeri.sh'

#media
tv() {
  ffmpeg -i in.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p out.mp4
}
wa() {
    ffmpeg -i "$1" -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p "${1%.*}.new.mp4"
}
enc-vp9() {
  ffmpeg -r 30 -i "${1}.%04d.png" -movflags faststart -vcodec libvpx-vp9 -crf 20 -g 1 -pix_fmt yuva420p "${1}-with-alpha.webm"
}
enc-h265() {
  ffmpeg -r 30 -i "${1}.%04d.png" -c:v hevc_videotoolbox -vf 'premultiply=inplace=1' -alpha_quality 1 -q:v 85 -vtag hvc1 -movflags faststart -g 1 -pix_fmt ayuv "${1}-with-alpha-apple.mp4"
}

#tmp
enc-vp9-reverse-rotate() {
  ffmpeg -r 30 -i "${1}.%04d.png" -movflags faststart -vcodec libvpx-vp9 -crf 20 -g 1 -pix_fmt yuva420p -vf 'reverse, transpose=1' "${1}-with-alpha.webm"
}
enc-h265-reverse-rotate() {
  ffmpeg -r 30 -i "${1}.%04d.png" -c:v hevc_videotoolbox -vf 'premultiply=inplace=1, reverse, transpose=1' -alpha_quality 1 -q:v 85 -vtag hvc1 -movflags faststart -g 1 -pix_fmt ayuv "${1}-with-alpha-apple.mp4"
}

#end
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

#pi
export PATH="/Users/me/.local/share/fnm/node-versions/v24.15.0/installation/bin:$PATH"
