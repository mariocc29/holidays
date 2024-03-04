# frozen_string_literal: true

# Module responsible for handling rules and their codes.
module Rules
  # Retrieve and return all rule codes.
  def self.codes
    directory_path = Rails.root.join('config', 'rules')

    regions_data = Dir.glob("#{directory_path}/*.yml").flat_map do |file|
      code = File.basename(file, '.yml')
      content = YAML.safe_load(File.read(file))

      content[code].keys.tap do |list|
        index_of_default = list.index('default')
        list[index_of_default] = code if index_of_default
      end
    end

    regions_data.flatten.sort
  end
end
