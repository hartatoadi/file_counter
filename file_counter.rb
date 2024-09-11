require 'digest'
require 'find'

class FileCounter
  def initialize(path)
    @path = path
  end

  def count_files
    content_hashes = Hash.new { |hash, key| hash[key] = [] }

    # Scan through the given path recursively
    Find.find(@path) do |file|
      next if File.directory?(file)

      # Read file content and generate a digest (hash) based on the content
      file_content = File.read(file)
      file_hash = Digest::SHA256.hexdigest(file_content)

      # Store the file path under the hash
      content_hashes[file_hash] << file
    end

    display_results(content_hashes)
  end

  private

  def display_results(content_hashes)
    max_files = 0
    largest_group_content = nil

    content_hashes.each do |content, files|
      if files.size > max_files
        max_files = files.size
        largest_group_content = content
      end

      puts "#{content[0..6]}... has #{files.size} files" if files.size > 1
    end

    if largest_group_content
      puts "\nContent with the largest number of identical files: #{largest_group_content[0..6]}... with #{max_files} files."
    else
      puts "No files with identical content found."
    end
  end
end

# To run the script with a folder path argument
if ARGV.size != 1
  puts "Usage: ruby file_counter.rb <path_to_folder>"
  exit
end

path = ARGV[0]
file_counter = FileCounter.new(path)
file_counter.count_files
