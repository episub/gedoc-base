FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive &&  apt-get update -y \
	&& apt-get install -y --no-install-recommends \
		curl \
		pandoc \
		texlive-binaries \
		texlive-latex-base \
		texlive-latex-extra \
		texlive-fonts-recommended \
		texlive-fonts-extra \
		texlive-lang-all \
		latexmk \
		lmodern \
		texlive-xetex \
		fonts-arphic-bkai00mp \
		fonts-arphic-gbsn00lp \
		fonts-arphic-bsmi00lp \
		fonts-arphic-gkai00mp \
		fonts-arphic-uming \
		fonts-arphic-ukai \
		fontconfig \
		optipng \
		poppler-utils \
		qpdf \
		imagemagick && fc-cache -fv && apt-get clean

ADD install.sh /install.sh
RUN /install.sh
# https://github.com/google/fonts/issues/2314
# Issue with this file building PDF's, so remove it:
RUN rm /usr/local/share/fonts/Quicksand[wght].ttf
RUN fc-cache -f
