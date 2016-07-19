step 'Archive files created during tests' do
  source = '/tmp/mytest-master.txt'
  target = "archive/sut-files/#{master}/#{source}"
  scp_from(master, source, target)

  source = '/tmp/mytest-agent.txt'
  target = "archive/sut-files/#{agent}/#{source}"
  scp_from(agent, source, target)
end
