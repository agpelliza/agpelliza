class Post
  attr_reader :date
  attr_reader :title

  attr_accessor :next
  attr_accessor :previous

  def initialize(*args)
    @file, @date, @title = *args
  end

  def self.[](file)
    new(*parse(file))
  end

  def id
    Post.basename(@file)
  end

  def body
    @body ||= Post.parse_post(@file)
  end

  def self.parse_post(file)
    case file
    when /\.md$/
      markdown(file)
    when /\.html$/
      read(file)
    end
  end

  protected

  def self.markdown(file)
    Maruku.new(read(file)).to_html
  end

  def self.read(file)
    File.read(file, encoding: "utf-8")
  end

  def self.parse(file)
    file_name_array = basename(file).split('_')
    date_str = file_name_array.shift
    return [file, date_parse(date_str), title_parse(file_name_array)]
  end

  def self.date_parse(date_str)
    Date.parse("#{date_str[0..3]}-#{date_str[4..5]}-#{date_str[6..7]}")
  end

  def self.title_parse(title_array)
    title_array.map {|word| word.capitalize}.join(' ')
  end

  def self.basename(file)
    File.basename(file, File.extname(file))
  end
end