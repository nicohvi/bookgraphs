module SvgHelper

  def embed_graph(path)
    File.open("app/assets/graphs/#{path}", "rb") do |file|
      raw file.read
    end
  end

end
