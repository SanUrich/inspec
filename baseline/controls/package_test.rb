control 'docker' do
  title 'Проверка наличия пакета docker-ce необходимой версии и открытого порта registry:'
  desc 'docker-ce'
  describe package('docker-ce') do
    it { should be_installed }
    its('version') { should match '19.03.8'}
  end
  describe port(5000) do
    it { should be_listening }
    its('protocols') { should cmp('tcp') }
  end
end

control 'docker-compose' do
  title 'Проверка наличия необходимого пакета docker-compose:'
  describe package('docker-compose') do
    it { should be_installed }
  end
end

control 'container_grafana' do
  title 'Проверяем наличие контейнера с grafana:'
  describe command('docker ps -a') do
    its('stdout') { should match 'grafana' }
  end
end
