# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Core::Components::Base do
  describe 'Global holiday calculation methods' do
    subject { described_class.new year }

    let(:year) { 2024 }

    it 'returns New Year\'s Day', :aggregate_failures do
      expect(subject).to respond_to(:new_year)
      expect(subject.new_year).to eq(Date.parse('2024-01-01'))
    end

    it 'returns the day after New Year\'s Day', :aggregate_failures do
      expect(subject).to respond_to(:new_year_next_day)
      expect(subject.new_year_next_day).to eq(Date.parse('2024-01-02'))
    end

    it 'returns Good Friday', :aggregate_failures do
      expect(subject).to respond_to(:good_friday)
      expect(subject.good_friday).to eq(Date.parse('2024-03-29'))
    end

    it 'returns Easter Sunday', :aggregate_failures do
      expect(subject).to respond_to(:easter_sunday)
      expect(subject.easter_sunday).to eq(Date.parse('2024-03-31'))
    end

    it 'returns Easter Monday', :aggregate_failures do
      expect(subject).to respond_to(:easter_monday)
      expect(subject.easter_monday).to eq(Date.parse('2024-04-01'))
    end

    it 'returns Christmas Eve', :aggregate_failures do
      expect(subject).to respond_to(:christmas_eve)
      expect(subject.christmas_eve).to eq(Date.parse('2024-12-24'))
    end

    it 'returns Christmas Day', :aggregate_failures do
      expect(subject).to respond_to(:christmas)
      expect(subject.christmas).to eq(Date.parse('2024-12-25'))
    end

    it 'returns the day after Christmas Day', :aggregate_failures do
      expect(subject).to respond_to(:christmas_next_day)
      expect(subject.christmas_next_day).to eq(Date.parse('2024-12-26'))
    end

    it 'returns New Year\'s Eve', :aggregate_failures do
      expect(subject).to respond_to(:new_years_eve)
      expect(subject.new_years_eve).to eq(Date.parse('2024-12-31'))
    end
  end
end
