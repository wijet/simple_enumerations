class EnumerationsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'enumerations.yml', "config/enumerations.yml"
    end
  end
end