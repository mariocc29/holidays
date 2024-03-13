# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Core::Components::CO::Service do
  describe 'Colombian holiday calculation methods' do
    subject { described_class.new year }

    let(:year) { 2024 }

    it 'returns All Saints\' Day', :aggregate_failures do
      expect(subject).to respond_to(:all_saints_day)
      expect(subject.all_saints_day).to eq(Date.parse('2024-11-04'))
    end

    it 'returns Ascension Day', :aggregate_failures do
      expect(subject).to respond_to(:ascension_day)
      expect(subject.ascension_day).to eq(Date.parse('2024-05-13'))
    end

    it 'returns Assumption of Mary', :aggregate_failures do
      expect(subject).to respond_to(:assumption_of_mary)
      expect(subject.assumption_of_mary).to eq(Date.parse('2024-08-19'))
    end

    it 'returns Battle of Boyacá', :aggregate_failures do
      expect(subject).to respond_to(:battle_of_boyaca)
      expect(subject.battle_of_boyaca).to eq(Date.parse('2024-08-07'))
    end

    it 'returns Columbus Day', :aggregate_failures do
      expect(subject).to respond_to(:columbus_day)
      expect(subject.columbus_day).to eq(Date.parse('2024-10-14'))
    end

    it 'returns Corpus Christi', :aggregate_failures do
      expect(subject).to respond_to(:corpus_christi)
      expect(subject.corpus_christi).to eq(Date.parse('2024-06-03'))
    end

    it 'returns Epiphany', :aggregate_failures do
      expect(subject).to respond_to(:epiphany)
      expect(subject.epiphany).to eq(Date.parse('2024-01-08'))
    end

    it 'returns Immaculate Conception Day', :aggregate_failures do
      expect(subject).to respond_to(:immaculate_conception_day)
      expect(subject.immaculate_conception_day).to eq(Date.parse('2024-12-08'))
    end

    it 'returns Independence Day', :aggregate_failures do
      expect(subject).to respond_to(:independence_day)
      expect(subject.independence_day).to eq(Date.parse('2024-07-20'))
    end

    it 'returns Independence of Cartagena', :aggregate_failures do
      expect(subject).to respond_to(:independence_of_cartagena)
      expect(subject.independence_of_cartagena).to eq(Date.parse('2024-11-11'))
    end

    it 'returns Labor Day', :aggregate_failures do
      expect(subject).to respond_to(:labor_day)
      expect(subject.labor_day).to eq(Date.parse('2024-05-01'))
    end

    it 'returns Maundy Thursday', :aggregate_failures do
      expect(subject).to respond_to(:maundy_thursday)
      expect(subject.maundy_thursday).to eq(Date.parse('2024-03-28'))
    end

    it 'returns Sacred Heart', :aggregate_failures do
      expect(subject).to respond_to(:sacred_heart)
      expect(subject.sacred_heart).to eq(Date.parse('2024-06-10'))
    end

    it 'returns Saint Joseph\'s Day', :aggregate_failures do
      expect(subject).to respond_to(:saint_josephs_day)
      expect(subject.saint_josephs_day).to eq(Date.parse('2024-03-25'))
    end

    it 'returns Saint Peter and Saint Paul', :aggregate_failures do
      expect(subject).to respond_to(:saint_peter_and_saint_paul)
      expect(subject.saint_peter_and_saint_paul).to eq(Date.parse('2024-07-01'))
    end
  end
end
