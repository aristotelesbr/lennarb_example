# frozen_string_literal: true

require 'yaml'

# Load excluded paths from RuboCop configuration
rubocop_config = YAML.load_file('.rubocop.yml')
excluded_paths = rubocop_config['AllCops']['Exclude']
puts "Excluded paths: #{excluded_paths}"

# Get changed files
changed_files = ENV['CHANGED_FILES']&.split("\n")&.compact || []
puts "Changed files: #{changed_files}"

if changed_files.empty?
  puts 'No files changed. Exiting...'
  exit
end

# Filter out excluded paths
filtered_files =
  changed_files.reject do |file|
    excluded_paths.any? { |pattern| File.fnmatch(pattern, file, File::FNM_PATHNAME) }
  end

puts "Filtered files: #{filtered_files.join(' ')}"
filtered_files_string = filtered_files.join(' ')
puts "::set-output name=files::#{filtered_files_string}"
