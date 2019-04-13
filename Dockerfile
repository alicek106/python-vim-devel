FROM ubuntu:16.04
RUN apt update && \
  apt install python3 python3-pip python3-dev vim wget locales -y && \
  apt clean autoclean && apt autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}

RUN locale-gen ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR:en
ENV LC_ALL ko_KR.UTF-8

RUN mkdir /root/.vim/syntax -p
RUN wget -O /root/.vim/syntax/python.vim https://www.vim.org/scripts/download_script.php?src_id=21056
ADD .vimrc /root/
CMD /bin/bash
