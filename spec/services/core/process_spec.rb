# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Core::Process do
  describe '.build' do
    subject { described_class.new(rule, locale, year) }
    original_services_by_country = Core::Process::SERVICES_BY_COUNTRY.dup

    let(:year) { Date.today.year }
    let(:rule) { instance_double(Core::RuleProcess) }
    let(:locale) { 'en' }

    let(:mock_service) { instance_double('Core::Components::SOMECODE::Service') }
    let(:holiday_a) { { date: Date.parse('2024-02-01'), label: 'Holiday A' } }
    let(:holiday_b) { { date: Date.parse('2024-01-01'), label: 'Holiday B' } }

    before do
      allow(rule).to receive(:country).and_return('some_code')
      allow(rule).to receive(:region).and_return('default')
      allow(rule).to receive(:settings).and_return({ holiday_a: nil, holiday_b: nil })

      Core::Process.const_set(:SERVICES_BY_COUNTRY, { some_code: { default: mock_service } }.freeze)
      allow(mock_service).to receive(:new).and_return(mock_service)
      allow(mock_service).to receive(:holiday_a).and_return(holiday_a[:date])
      allow(mock_service).to receive(:holiday_b).and_return(holiday_b[:date])
      allow(I18n).to receive(:t).with('core.holidays.holiday_a').and_return(holiday_a[:label])
      allow(I18n).to receive(:t).with('core.holidays.holiday_b').and_return(holiday_b[:label])
    end

    after do
      Core::Process.send(:remove_const, :SERVICES_BY_COUNTRY)
      Core::Process.const_set(:SERVICES_BY_COUNTRY, original_services_by_country)
    end

    it 'returns a sorted list of holidays' do
      response = subject.build
      expect(response).to contain_exactly(
        { date: holiday_b[:date], label: holiday_b[:label] },
        { date: holiday_a[:date], label: holiday_a[:label] }
      )
    end

    it 'returns an empty list if no holidays are available' do
      allow(rule).to receive(:settings).and_return({})
      response = subject.build
      expect(response).to be_empty
    end

    it 'returns a list with one holiday if only one holiday is available' do
      allow(rule).to receive(:settings).and_return({ holiday_a: nil })
      response = subject.build
      expect(response.size).to eq(1)
      expect(response.first[:date]).to eq(holiday_a[:date])
      expect(response.first[:label]).to eq(holiday_a[:label])
    end

    it 'handles case when service for country and region is not found' do
      allow(rule).to receive(:country).and_return('non_existent_country_code')
      allow(rule).to receive(:region).and_return('non_existent_region')
      expect { subject.build }.to raise_error(KeyError)
    end

    it 'translates holiday labels' do
      subject.build
      expect(I18n).to have_received(:t).with('core.holidays.holiday_a').once
      expect(I18n).to have_received(:t).with('core.holidays.holiday_b').once
    end

    it 'returns an empty list if the holiday does not exist' do
      allow(rule).to receive(:settings).and_return({ unknown_holiday: nil })
      response = subject.build
      expect(response.size).to eq(0)
    end
  end
end
