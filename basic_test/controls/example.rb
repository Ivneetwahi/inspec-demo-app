java_version = command('bash -lc "java -version" 2>&1')
describe 'Java version command'  do
  it "should have Java installed" do
    expect(java_version.exit_status).to(eq 0)
  end
  it "should have required version" do
    expect(java_version.stdout).to(match attribute('java_version'))
  end
end

mysql_version = command('bash -lc "mysql --version" 2>&1')
describe 'MySQL version command'  do
  it "should have MySQL installed" do
    expect(mysql_version.exit_status).to(eq 0)
  end
  it "should have required version" do
    expect(mysql_version.stdout).to(match attribute('mysql_version'))
  end
end

describe service('mysql') do
  it { should be_running }
end

describe port(attribute('app_port')) do
  it { should be_listening }
  its('processes') { should include 'java' }
  its('protocols') { should include /tcp/ }
end

describe http("http://localhost:#{attribute('app_port')}/#{attribute('app_path')}/") do
  its('status') { should cmp 200 }
end