# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Core::Components::CA::QC::Service do
  describe 'Quebec holiday calculation methods' do
    subject { described_class.new year }

    let(:year) { 2024 }

    it 'The Patriots\' Day', :aggregate_failures do
      expect(subject).to respond_to(:journee_des_patriotes)
      expect(subject.journee_des_patriotes).to eq(Date.parse('2024-05-20'))
    end

    it 'returns Saint-Jean-Baptiste Day', :aggregate_failures do
      expect(subject).to respond_to(:saint_jean_baptiste)
      expect(subject.saint_jean_baptiste).to eq(Date.parse('2024-06-24'))
    end
  end
end
