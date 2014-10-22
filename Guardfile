guard 'slim', slim: { :pretty => true },
              input_root: 'src/slim',
              output_root: 'app/' do
  watch(%r'^.+\.slim$')
end

guard :compass, project_path: 'app/css',
                configuration_file: 'config/compass.rb'

guard :coffeescript, :input => 'src/coffeescript',
                     :output => './'
