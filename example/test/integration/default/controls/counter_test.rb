# adding variable which value is the attribute "server_name", specified in .kitchen.yml
# server_name is actually our output from terraform
# We need to perform the test in this way, because every single time we create an AWS instance, will be with different Public DNS name.

dns = attribute("server_name", {})

# adding test called "ckeck_rails_site"
# it will ckeck whether the JSON is accessible.
control 'check_rails_site' do
  describe http("http://#{dns}:3000") do
    its('status') { should cmp 200 }
  end
end
