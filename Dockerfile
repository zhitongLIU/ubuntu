From ubuntu

RUN apt-get update; apt-get install -y curl vim ruby vim-nox zsh git wget

WORKDIR /root
# install oh my zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# install vim-plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN git clone https://github.com/zhitongLIU/dotfiles.git
RUN rsync -avi --exclude=".git*" ./dotfiles/ ./
