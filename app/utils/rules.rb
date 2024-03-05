# frozen_string_literal: true

# Module responsible for handling rules and their codes.
module Rules
  # Retrieve and return all rule codes.
  def self.codes
    directory_path = Rails.root.join('config', 'rules')

    regions = Dir.glob("#{directory_path}/*.yml").flat_map do |file|
      code = File.basename(file, '.yml')
      content = YAML.safe_load(File.read(file))

      next if content[code].nil?

      content[code].keys.tap do |list|
        index_of_default = list.index('default')
        list[index_of_default] = code if index_of_default
      end
    end

    regions.flatten.compact.sort
  end
end
