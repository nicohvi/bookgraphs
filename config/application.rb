require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookgraphs
  class Application < Rails::Application

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
      g.test_framework  :rspec
      g.stylesheets     true
      g.javascripts     false
      g.helper          false
    end

    # paperclip configuration
    # config/environments/production.rb
    config.paperclip_defaults = {
      :storage => :s3,
      :s3_credentials => {
        :bucket => config.secrets.s3.bucket,
        :access_key_id => config.secrets.s3.access_key_id,
        :secret_access_key => config.secrets.s3.access_key
      }
    }

  end
end
