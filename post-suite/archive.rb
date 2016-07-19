require 'fileutils'

step 'Archive files created during tests' do
  archivedir = 'archive/sut-files'

  ## Copy file(s) from master
  source = '/tmp/mytest/master.txt'
  targetdir = "#{archivedir}/#{master}/tmp/mytest"
  FileUtils.mkdir_p(targetdir)
  scp_from(master, source, targetdir)

  ## Copy file(s) from agent
  source = '/tmp/mytest/agent.txt'
  targetdir = "#{archivedir}/#{agent}/tmp/mytest"
  FileUtils.mkdir_p(targetdir)
  scp_from(agent, source, targetdir)
end
