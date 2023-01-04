FROM archlinux:latest
RUN pacman-key --init && pacman-key --populate
RUN pacman -Sy archlinux-keyring patch plantuml inkscape python-pygments texlive-core texlive-bibtexextra texlive-latexextra texlive-langchinese texlive-langjapanese noto-fonts-cjk --noconfirm --noprogressbar --needed && pacman -Scc --noconfirm
COPY latex.patch .
RUN patch --verbose /usr/share/texmf-dist/tex/lualatex/plantuml/plantuml.lua < latex.patch
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
