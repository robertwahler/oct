require 'yaml'

module Oct

  class Settings

    def initialize(working_dir, options={})
      @working_dir = working_dir
      @options = options
      configure
    end

    def options
      @options
    end

  private

    # read options from YAML config
    def configure

      # config file default options
      configuration = {
                        :options => {
                          :verbose => false,
                          :color => 'AUTO'
                        }
                      }

      # set default config if not given on command line
      config = @options[:config]
      unless config
        config = [
                   File.join(@working_dir, "oct.conf"),
                   File.join(@working_dir, ".oct.conf"),
                   File.join(@working_dir, "config", "oct.conf"),
                   File.expand_path(File.join("~", ".oct.conf"))
                 ].detect { |filename| File.exists?(filename) }
      end

      if config && File.exists?(config)
        # rewrite options full path for config for later use
        @options[:config] = config

        # load options from the config file, overwriting hard-coded defaults
        config_contents = YAML::load(File.open(config))
        configuration.merge!(config_contents.symbolize_keys!) if config_contents && config_contents.is_a?(Hash)
      else
        # user specified a config file?, no error if user did not specify config file
        raise "config file not found" if @options[:config]
      end

      # the command line options override options read from the config file
      @options = configuration[:options].symbolize_keys!.merge!(@options)

    end

  end

end
