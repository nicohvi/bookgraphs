class ViewGenerator < Rails::Generators::Base
  argument :path, type: :string

  def generate_view
    directory, view = path.split(':')
    create_file "app/views/#{directory.pluralize}/#{view}.html.haml"
  end

end
