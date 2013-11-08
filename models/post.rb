class Post
  attr_reader :id
  attr_reader :date
  attr_reader :title
  attr_reader :body

  attr_accessor :next
  attr_accessor :previous

  def initialize(id, date, title, body)
    @id = id
    @date = date
    @title = title
    @body = body
  end

  def self.[](file)
    post_id = id(file)
    post_body = parse(file)
    new(post_id, date(post_id), title(post_body), post_body)
  end

  protected

  def self.id(file)
    File.basename(file, File.extname(file))
  end
  
  def self.date(post_id)
    date_str = post_id.split('_').first
    Date.parse("#{date_str[0..3]}-#{date_str[4..5]}-#{date_str[6..7]}")
  end

  def self.title(post_body)
    post_body.match(/>(.*?)<\/h1>/).captures.first
  end

  def self.parse(file)
    case file
    when /\.md$/
      markdown(file)
    when /\.html$/
      read(file)
    end
  end

  def self.markdown(file)
    Maruku.new(read(file)).to_html
  end

  def self.read(file)
    File.read(file, encoding: "utf-8")
  end
end