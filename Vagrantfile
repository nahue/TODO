# encoding: utf-8
# This file originally created at http://rove.io/006336ce8614139b21c7d71f3daa3640

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'vim'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'git'
    chef.add_recipe 'tmux'
    chef.json = {
      :vim        => {
        :extra_packages => [
          "vim-rails"
        ]
      },
      :postgresql => {
        :config   => {
          :listen_addresses => "*",
          :port             => "5432"
        },
        :pg_hba   => [
          {
            :type   => "local",
            :db     => "postgres",
            :user   => "postgres",
            :addr   => nil,
            :method => "trust"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "0.0.0.0/0",
            :method => "md5"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "::1/0",
            :method => "md5"
          }
        ],
        :password => {
          :postgres => "vagrant"
        }
      },
      :rbenv      => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => [
              "2.0.0-p353"
            ],
            :global => "2.0.0-p353",
            :gems => {
              '2.0.0-p353' => [
                { :name => 'bundler', :version => '~> 1.3.5'},
                { :name => 'rails', :version => '~> 4.0.2'}
              ]
            }
          }
        ]
      },
      :git        => {
        :prefix => "/usr/local"
      }
    }
  end
end
