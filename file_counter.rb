require 'digest'
require 'find'

class FileCounter
  def initialize(path)
    @path = path
  end

  def count_files
    content_hashes = Hash.new { |hash, key| hash[key] = [] }

    Find.find(@path) do |file|
      next if File.directory?(file)

      file_content = File.read(file)
      file_hash = Digest::SHA256.hexdigest(file_content)

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

      puts "Identical content detected! It has #{files.size} files" if files.size > 1
    end

    if largest_group_content && max_files > 1
      puts "\nContent with the largest number of identical files: #{largest_group_content[0..6]}... with #{max_files} files."
    else
      puts "File with identical content not found"
    end
  end
end

if __FILE__ == $0
  if ARGV.size != 1
    puts "Usage: ruby file_counter.rb <path_to_folder>"
    exit
  end

  path = ARGV[0]
  file_counter = FileCounter.new(path)
  file_counter.count_files
end
