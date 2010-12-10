require 'yaml'
def read_config
  begin
    config_file = YAML.load_file("#{Dir.pwd}/config/config.yml")
    @browser = config_file['config']['browser']
    @translation_tag = config_file['config']['translation_tag']
    @check_translation = config_file['config']['check_translation']
    @fixtures = config_file['config']['fixtures'].split(" ")
  rescue Exception => e
    puts "#{e}".red
  end
end
