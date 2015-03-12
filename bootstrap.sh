#!/bin/zsh
echo "source /home/vagrant/zsh-git-prompt/zshrc.sh" >> ~/.zshrc
echo "PROMPT='%B%m%~%b\$(git_super_status) \$ '" >> ~/.zshrc

cd "$(rbenv root)"/plugins/ruby-build && git pull

rbenv install 2.2.0

rbenv global 2.2.0

cd /vagrant

gem install bundler

bundle install