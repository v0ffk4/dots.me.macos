# me

#system
alias src='source ~/.zshrc'
export EDITOR=nvim

#vivi
alias me@vivi='ssh me@vivi'

#nvim
alias fvim='NVIM_APPNAME=fvim nvim'
alias svim='NVIM_APPNAME=svim nvim'

#git
alias sts='git status'
alias newb='git branch'
alias clc='git rm -r cached .'

#tools
alias lg='lazygit'
alias ndeploy='netlify deploy --prod'
alias ddev='deno run dev'
alias ndev='npm run dev'

#projects
alias cdnm='cd /Users/dev/apps/newmoon/'
alias cdal='cd /Users/dev/apps/alia/'
alias cdtw='cd /Users/dev/apps/techos-web-client'
alias cdfr='cd /Users/dev/apps/forcel-ref'
alias cdfn='cd /Users/dev/apps/forcel-webclient-s5'
alias cdpr='cd /Users/dev/apps/predator-ref/'
alias tmpwc='/Users/dev/apps/predator-webclient-v1/tmux@yeri.sh'
alias tmpww='/Users/dev/apps/predator-cloudflare-form-worker/tmux@yeri.sh'
alias cdpw='cd /Users/dev/apps/predator-webclient-v1'
alias cdpww='cd /Users/dev/apps/predator-coludflare-form-worker'
alias cdpd='cd /Users/dev/apps/rebel-dna'
alias cdpds='cd /Users/dev/apps/rebel-dna/svelte'
alias cdpdd='cd /Users/dev/apps/rebel-dna-dist'

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
