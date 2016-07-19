step 'Create files to be archived during post-suite' do
  on(master, 'mkdir -p /tmp/mytest && echo master > /tmp/mytest/master.txt')
  on(agent, 'mkdir -p /tmp/mytest && echo agent > /tmp/mytest/agent.txt')
end
