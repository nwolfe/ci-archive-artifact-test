step 'Create files to be archived during post-suite' do
  on(master, 'echo master > /tmp/mytest-master.txt')
  on(agent, 'echo agent > /tmp/mytest-agent.txt')
end
