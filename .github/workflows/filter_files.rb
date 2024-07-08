require 'yaml'

# Load excluded paths from RuboCop configuration
rubocop_config = YAML.load_file('.rubocop.yml')
excluded_paths = rubocop_config['AllCops']['Exclude']
puts "Excluded paths: #{excluded_paths}"

# Get changed files
changed_files = ENV['CHANGED_FILES'] || ''
changed_files = changed_files.split("\n")
puts "Changed files: #{changed_files}"

# Filter out excluded paths
filtered_files = changed_files.reject do |file|
  excluded_paths.any? { |pattern| File.fnmatch(pattern, file, File::FNM_PATHNAME) }
end

puts "Filtered files: #{filtered_files.join(' ')}"
filtered_files_string = filtered_files.join(' ')
puts "::set-output name=files::#{filtered_files_string}"
