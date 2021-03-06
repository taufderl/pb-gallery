source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# bootstrap
gem 'bootstrap-sass', '~> 3.1.0'

# figaro for setting configs through application.yml and ENV variables
gem 'figaro', '~> 0.7.0'

group :production do
  # exception notification for email exceptions
  gem 'exception_notification', '~> 4.0.1'
  
  gem 'mysql2'

  # fcgi for fcgi script running
  gem 'passenger', '~> 4.0.23'
end

group :development do
  # finds missing translations
  gem 'i18n-tasks'
  # writes query count to logs
  gem 'sql_queries_count'
end

#authentication and permission
gem 'devise'
gem 'devise_invitable'
gem 'cancan'

# file uploads
gem 'paperclip'
# additionally to AWS 
gem 'aws-sdk'

# use haml
gem 'haml-rails'

gem 'jquery-ui-rails'
gem 'jquery-fileupload-rails'#, git: 'git@github.com:kamilpogo/jquery-fileupload-rails.git', branch: :master

# creates the gallery
gem 'hermitage', git: 'git@github.com:danielpuglisi/hermitage.git', branch: :master

# ransack for easy object search and filtering
gem 'ransack', '~> 1.0.0'
# pagination
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

gem "recaptcha", :require => "recaptcha/rails"

gem 'picasawebalbums', require: 'PicasaWebAlbums', git: 'git@github.com:alvinsj/PicasaWebAlbums.git', branch: :master
