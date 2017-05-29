require 'spec_helper'

describe Mockable do
  it 'has a version number' do
    expect(Mockable::VERSION).not_to be nil
  end

  describe '.mocked?' do
    let(:mocked) {described_class.mocked?}

    context 'when MOCKABLE is not set' do
      before(:each) do
        ENV.delete("MOCKABLE")
      end

      it 'is false' do
        expect(mocked).to eql(false)
      end
    end

    context 'when MOCKABLE is set' do
      before(:each) do
        ENV['MOCKABLE'] = '1'
      end

      after(:each) do
        ENV.delete("MOCKABLE")
      end

      it 'is true' do
        expect(mocked).to eql(true)
      end
    end
  end

  describe '.enable' do
    context 'when mocking is not enabled' do
      before(:each) do
        described_class.disable
      end

      it 'turns mocking on' do
        expect(described_class.mocked?).to eql(false)

        described_class.enable

        expect(described_class.mocked?).to eql(true)
      end
    end

    context 'when mocking is enabled' do
      let(:value) {"pants"}

      before(:each) do
        ENV['MOCKABLE'] = value
      end

      it 'has no apparent effect' do
        described_class.enable

        expect(described_class.mocked?).to eql(true)
        expect(ENV['MOCKABLE']).to eql(value)
      end
    end
  end

  describe '.disable' do
    context 'when mocking is enabled' do
      before(:each) do
        described_class.enable
      end

      it 'disables mocking' do
        expect(described_class.mocked?).to eql(true)

        described_class.disable

        expect(described_class.mocked?).to eql(false)
      end
    end

    context 'when mocking is not enabled' do
      before(:each) do
        ENV.delete("MOCKABLE")
      end

      it 'has no apparent effect' do
        expect(described_class.mocked?).to eql(false)

        described_class.disable

        expect(described_class.mocked?).to eql(false)
      end
    end
  end
end
