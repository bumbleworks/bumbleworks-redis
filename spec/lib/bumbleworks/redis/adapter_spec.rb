require 'bumbleworks'

describe Bumbleworks::Redis::Adapter do
  describe 'when added to configuration' do
    it 'adds storage adapter to Bumbleworks' do
      allow(described_class).to receive(:auto_register?).and_return(false)
      expect(Bumbleworks.configuration.storage_adapters).not_to include(described_class)
      Bumbleworks.configuration.add_storage_adapter(described_class)
      expect(Bumbleworks.configuration.storage_adapters).to include(described_class)
    end
  end

  describe 'when auto_register is true' do
    it 'is already automatically added to configuration' do
      allow(described_class).to receive(:auto_register?).and_return(true)
      expect(Bumbleworks.configuration.storage_adapters).to include(described_class)
    end
  end

  describe '.auto_register?' do
    it 'returns true if auto_register is true' do
      described_class.auto_register = true
      expect(described_class.auto_register?).to be_truthy
    end

    it 'returns false if auto_register is not true' do
      described_class.auto_register = :ghosts
      expect(described_class.auto_register?).to be_falsey
    end

    it 'is true by default' do
      described_class.auto_register = nil
      expect(described_class.auto_register?).to be_truthy
    end
  end

  describe '.use?' do
    it 'returns true if given storage class matches Redis' do
      expect(described_class.use?(Redis.new)).to be_truthy
    end

    it 'returns false if given storage class does not match Redis' do
      expect(described_class.use?({})).to be_falsey
      expect(described_class.use?(nil)).to be_falsey
      expect(described_class.use?('Redis')).to be_falsey
    end
  end

  describe '.allow_history_storage?' do
    it 'returns true' do
      expect(described_class.allow_history_storage?).to be_truthy
    end
  end
end
