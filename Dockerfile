# Docker Pandoc - Dockerfile

FROM haskell

# Install packets...
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
      less && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pandoc (pandoc-2.3.1 or current pandoc)
RUN cabal update && \
    cabal install pandoc && \
    ln -s /root/.cabal/bin/pandoc /usr/bin/pandoc

# Set timezone CET (UTC+1)
# (see https://serverfault.com/questions/683605)
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime

# Install additional fonts for LaTeX
#ADD myfonts.tgz /usr/local/share/texmf
#RUN texhash

# Create and set working directory
WORKDIR /data

# Create mount point /data to hold an externally mounted volume
VOLUME ["/data"]

# Set the default command to run when starting the container
ENTRYPOINT ["/bin/bash"]

