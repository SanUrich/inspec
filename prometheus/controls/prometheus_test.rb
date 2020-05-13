control 'prometheus_container' do
  title 'Проверка наличия пакета prometheus и открытого порта:'
  describe command('docker ps -a') do
    its('stdout') { should match 'prometheus'}
  end
  describe port(9090) do
    it { should be_listening }
    its('protocols') { should cmp('tcp') }
  end
end
