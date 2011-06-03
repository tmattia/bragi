class PostFactory
  def self.create(filename, data={})
    file_path = "#{ENV["posts_path"]}/#{filename}"

    File.open(file_path,"w") do |f|
      f.puts(":title: #{data[:title]}")  
      f.puts(":published_at: #{data.has_key?(:published_at) ?  data[:published_at] : "05/08/2000"}")
      f.puts("\n\n")
      f.puts(data[:body])
    end

    Post.new(file_path)
  end
end