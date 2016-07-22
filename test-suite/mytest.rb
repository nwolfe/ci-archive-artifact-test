step 'Create files to be archived during post-suite' do
  on(master, 'mkdir -p /var/log/puppetlabs/puppetserver && echo messages > /var/log/puppetlabs/puppetserver/puppetserver.log')
  on(other, 'echo stuff > /opt/file-on-agent')
  on(other, 'echo qux > foo.bar')
end
