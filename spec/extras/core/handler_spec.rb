# frozen_string_literal: true

require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe Core::Handler do
  describe '.get' do
    let(:code) { 'some_code' }
    let(:year) { Date.today.year }

    let(:process) { instance_double(Core::Process, build: []) }
    let(:rule_process) { instance_double(Core::RuleProcess) }

    context 'when locale and year are not provided' do
      it 'returns holidays data' do
        expect(Core::RuleProcess).to receive(:new).with(code).and_return(rule_process)
        expect(Core::Process).to receive(:new).with(rule_process, nil, year).and_return(process)

        described_class.get(code)
      end
    end

    context 'when locale is provided' do
      it 'returns holidays data' do
        locale = 'en'
        expect(Core::RuleProcess).to receive(:new).with(code).and_return(rule_process)
        expect(Core::Process).to receive(:new).with(rule_process, locale, year).and_return(process)

        described_class.get(code, locale)
      end
    end

    context 'when year is provided' do
      let(:year) { 2020 }

      it 'returns holidays data' do
        expect(Core::RuleProcess).to receive(:new).with(code).and_return(rule_process)
        expect(Core::Process).to receive(:new).with(rule_process, nil, year).and_return(process)

        described_class.get(code, nil, year)
      end
    end

    context 'when handling errors' do
      it 'raises HolidaysException::UnprocessableEntityException when RuleProcess raises it' do
        allow(Core::RuleProcess).to receive(:new).and_raise(HolidaysException::UnprocessableEntityException)
        expect { described_class.get(code) }.to raise_error(HolidaysException::UnprocessableEntityException)
      end
    end
  end
end
