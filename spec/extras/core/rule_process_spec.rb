# frozen_string_literal: true

require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe Core::RuleProcess, type: :service do
  describe '.new' do
    subject { described_class.new(fullcode) }

    let(:content_file) { "code:\n  default:\n    holiday_a:\n  code_key:\n    holiday_b:\n" }

    before do
      allow(File).to receive(:read).and_return(content_file)
    end

    context 'when initializing with a full code containing key' do
      let(:fullcode) { 'code_key' }

      it 'correctly initializes code and uses provided key', :aggregate_failures do
        expect(subject.code).to eq('code')
        expect(subject.key).to eq(fullcode)
      end

      it 'returns merged settings for the specified key' do
        expect(subject.settings).to include_json(
          {
            holiday_a: nil,
            holiday_b: nil
          }
        )
      end
    end

    context 'when initializing with a full code without key' do
      let(:fullcode) { 'code' }

      it 'correctly initializes code and uses default key', :aggregate_failures do
        expect(subject.code).to eq('code')
        expect(subject.key).to eq('default')
      end

      it 'returns merged settings for the specified key' do
        expect(subject.settings).to include_json(
          {
            holiday_a: nil
          }
        )
      end
    end
  end
end
