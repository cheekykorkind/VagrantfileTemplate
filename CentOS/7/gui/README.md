[한국어](README.kr.md)
[日本語](README.jp.md)
# CentOS7 GUI

## consider install vagrant plugin
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-disksize

## consider changing some items
1. cp local_env_example.yaml local_env.yaml 
2. set vm name, gitconfig, ssh, centos user variables in local_env.yaml 
3. `config.vm.network` adjust for you

## execute command
- `vagrant up`