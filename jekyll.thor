require "stringex"

class Jekyll < Thor
  desc "new", "create a new post"
  method_option :editor, :default => "subl"
  method_option :draft, :type => :boolean, :aliases => "-d"
  def new(*title)
    title = title.join(" ")
    date = filename_date
    prefix = options.draft? ? "_drafts/" : "_posts/#{date}-"
    filename = "#{prefix}#{title.to_url}.markdown"

    if File.exist?(filename)
      abort("#{filename} already exists!")
    end

    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "date: #{title_date}"
      post.puts "tags: "
      post.puts "---"
    end

    system(options[:editor], filename)
  end

  desc "publish", "publish a draft"
  def publish(draft_filename)
    if not File.exist?(draft_filename)
      abort("#{draft_filename} doesn't exists!")
    end

    content = File.read(draft_filename)
    content = content.gsub(/date: (.*)/, "draft_date: \\1\ndate: #{title_date}")

    post_filename = "_posts/#{filename_date}-#{draft_filename.split('/').last}"

    File.open(post_filename, "w+") do |post|
      post.puts content
    end

    File.delete(draft_filename)
  end

  private

  def filename_date
    Time.now.strftime('%Y-%m-%d')
  end

  def title_date
    Time.now.strftime('%Y-%m-%d %H:%M:%S %z')
  end
end
