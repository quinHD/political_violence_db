# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'
require "capistrano/rbenv"
require 'capistrano/puma'
install_plugin Capistrano::Puma

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

require 'capistrano/rbenv'
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, "2.3.1"