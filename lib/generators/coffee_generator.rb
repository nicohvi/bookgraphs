class CoffeeGenerator < Rails::Generators::Base
  argument :path, type: :string

  def generate_file
    name, directory = path.split(':')
    create_file "app/assets/javascripts/#{ directory ? "/#{directory}/" : "" }#{name}.coffee"
  end

end
