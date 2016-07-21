step 'Create files to be archived during post-suite' do
  on(master, 'mkdir -p /tmp/mytest && echo master > /tmp/mytest/master.txt')
  on(master, 'echo master2 > /tmp/mytest/master2.txt')
  on(master, 'echo master3 > /tmp/mytest/master3.txt')
  on(master, 'echo master4 > /tmp/mytest/master4.txt')
  on(master, 'echo $(hostname) > /etc/file-on-master.log')
  on(agent, 'mkdir -p /tmp/mytest && echo agent > /tmp/mytest/agent.txt')
  on(agent, 'echo $(hostname) > /opt/file-on-agent.log')
  on(agent, 'echo foo > /foo.bar')
  on(agent, 'echo bar > bar')
end
