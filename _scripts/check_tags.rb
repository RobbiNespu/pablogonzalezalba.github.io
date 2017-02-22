#!/usr/bin/env ruby
COLLECTION_NAME = 'my_tags'

ENV["JEKYLL_LOG_LEVEL"] = 'warn' # Ignore info output
require 'jekyll'

# Load site
site = Jekyll::Site.new(Jekyll.configuration)
site.read

# Read entries and remove the extensions
collection_tags = site.collections[COLLECTION_NAME].entries.map do |entry|
  entry.split('.')[0]
end

diff = site.tags.keys - collection_tags

if (diff.size > 0)
  puts "The following tags must be added to the `_#{COLLECTION_NAME}` directory:"
  puts diff.join(',')
  puts "I've created the files, just add them to the commit"

  diff.each do |tag|
    File.open("_#{COLLECTION_NAME}/#{tag}.md", 'w') do |file|
      file.puts "---"
      file.puts "slug: #{tag}"
      file.puts "name: " + tag.split('-').map(&:capitalize).join(' ')
      file.puts "---"
    end
  end
  exit 1
end
