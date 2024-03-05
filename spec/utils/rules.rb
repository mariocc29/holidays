# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rules, type: :service do
  describe '.codes' do
    subject { described_class.codes }

    it 'returns a list of codes' do
      expect(subject).to eq(%w[ca ca_qc co])
    end

    it 'has the correct YAML structure', :aggregate_failures do
      directory_path = Rails.root.join('config', 'rules')

      Dir.glob("#{directory_path}/*.yml").each do |file|
        code = File.basename(file, '.yml')
        content = YAML.safe_load(File.read(file))

        expect(content).to be_a(Hash)
        expect(content).to have_key(code)
        expect(content[code]).to have_key('default')
      end
    end
  end
end
