# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Core::Components::CA::Service do
  describe 'Canadian holiday calculation methods' do
    subject { described_class.new year }

    let(:year) { 2024 }

    it 'returns Canada Day', :aggregate_failures do
      expect(subject).to respond_to(:canada_day)
      expect(subject.canada_day).to eq(Date.parse('2024-07-01'))
    end

    it 'returns Labor Day', :aggregate_failures do
      expect(subject).to respond_to(:labor_day)
      expect(subject.labor_day).to eq(Date.parse('2024-09-02'))
    end

    it 'returns Thanksgiving', :aggregate_failures do
      expect(subject).to respond_to(:thanksgiving)
      expect(subject.thanksgiving).to eq(Date.parse('2024-10-14'))
    end

    it 'returns Remembrance Day', :aggregate_failures do
      expect(subject).to respond_to(:remembrance_day)
      expect(subject.remembrance_day).to eq(Date.parse('2024-11-11'))
    end
  end
end
