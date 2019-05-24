# Docker Pandoc - Dockerfile

# Mario Ban, 2018-12, based on https://kofler.info/ebooks/markdown_pandoc/

FROM haskell

LABEL version="1.1.1"
LABEL maintainer="Mario Ban <mario.ban@bluewin.ch>"

# Install additional packages
RUN apt-get update -y && \
    apt-get install -y -o Acquire::Retries=10 \
        --no-install-recommends \
      texlive-latex-recommended \
      texlive-latex-extra \
      texlive-fonts-recommended \
      texlive-lang-german \
      texlive-pstricks \
      texlive-font-utils \
      lmodern \
      imagemagick \
      unzip \
      python3 \
      ghostscript \
      subversion \
      joe \
      vim \
      less \
      procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Aliases
RUN sed -i -e 's/# export LS_OPTIONS/export LS_OPTIONS/' -e 's/# alias/alias/' /root/.bashrc

# Set timezone CET (UTC+1)
# (see https://serverfault.com/questions/683605)
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime

# Install additional fonts for LaTeX
#ADD myfonts.tgz /usr/local/share/texmf
#RUN texhash

# Add user and group
RUN groupadd --gid 1000 docker && useradd --uid 1000 --create-home --no-log-init -g docker docker

# Set user to use
USER docker:docker

# Aliases
RUN sed -i -e 's/#force_color_prompt=yes/force_color_prompt=yes/' -e 's/#alias l/alias l/' /home/docker/.bashrc

# Install pandoc (current pandoc 2.7.2)
RUN cabal update && \
    cabal install pandoc

ENV PATH="/home/docker/.cabal/bin:${PATH}"

# Create and set working directory
WORKDIR /data

# Create mount point /data to hold an externally mounted volume
VOLUME ["/data"]

# Set the default command to run when starting the container
ENTRYPOINT ["/bin/bash"]

#ENTRYPOINT ["pandoc"]
#CMD ["--help"]
