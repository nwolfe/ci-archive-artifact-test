step 'Create files to be archived during post-suite' do
  on(master, 'mkdir -p /tmp/mytest && echo master > /tmp/mytest/master.txt')
  on(master, 'echo $(hostname) > /etc/file-on-master.log')
  on(agent, 'mkdir -p /tmp/mytest && echo agent > /tmp/mytest/agent.txt')
  on(agent, 'echo $(hostname) > /opt/file-on-agent.log')
  on(agent, 'echo foo > /foo.bar')
end
