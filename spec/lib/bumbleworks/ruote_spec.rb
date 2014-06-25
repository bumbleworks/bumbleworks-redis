require 'bumbleworks'

describe Bumbleworks::Ruote do
  before :each do
    Bumbleworks::Redis::Adapter.auto_register = false
  end

  it 'does not support Redis storage before adapter is added' do
    storage = Redis.new
    Bumbleworks.storage = storage
    expect {
      described_class.send(:storage)
    }.to raise_error(Bumbleworks::UndefinedSetting)
  end

  it 'supports Redis storage after adapter is added' do
    Bumbleworks.configuration.add_storage_adapter(Bumbleworks::Redis::Adapter)
    storage = Redis.new
    Bumbleworks.storage = storage
    Ruote::Redis::Storage.should_receive(:new).with(storage)
    described_class.send(:storage)
  end

  it 'adds itself to error message for unsupported storages' do
    Bumbleworks.configuration.add_storage_adapter(Bumbleworks::Redis::Adapter)
    Bumbleworks.storage = :a_frog
    expect {
      described_class.send(:storage)
    }.to raise_error(Bumbleworks::UndefinedSetting, /Redis/)
  end
end
