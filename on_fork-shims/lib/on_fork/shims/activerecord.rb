require 'on_fork'

OnForkShims.add(defined?(Rails) && defined?(ActiveRecord::Base)) do
  ver = Rails.version.split(".").map { |x| x.to_i }

  if ver[0] >= 4 && ver[1] >= 1
    # Valid on Rails 4.1+ using the `config/database.yml` method of setting `pool` size
    OnFork.add do
      ActiveRecord::Base.establish_connection
    end
  else
    OnFork.add do
      # Valid on Rails up to 4.1 the initializer method of setting `pool` size
      ActiveSupport.on_load(:active_record) do
        config = ActiveRecord::Base.configurations[Rails.env] ||
                    Rails.application.config.database_configuration[Rails.env]
        config['pool'] = ENV['MAX_THREADS'] || 5
        ActiveRecord::Base.establish_connection(config)
      end
    end
  end
end
