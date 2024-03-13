# frozen_string_literal: true

require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe Core::RuleProcess, type: :service do
  describe '.new' do
    subject { described_class.new(code) }

    let(:content_file) { "country:\n  default:\n    holiday_a:\n  country_region:\n    holiday_b:\n" }

    before do
      allow(File).to receive(:read).and_return(content_file)
    end

    context 'when initializing with a code containing region' do
      let(:code) { 'country_region' }

      it 'correctly initializes code and uses provided key', :aggregate_failures do
        expect(subject.country).to eq('country')
        expect(subject.region).to eq(code)
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

    context 'when initializing with a full code without region' do
      let(:code) { 'country' }

      it 'correctly initializes code and uses default region', :aggregate_failures do
        expect(subject.country).to eq('country')
        expect(subject.region).to eq('default')
      end

      it 'returns merged settings for the specified region' do
        expect(subject.settings).to include_json(
          {
            holiday_a: nil
          }
        )
      end
    end
  end
end
