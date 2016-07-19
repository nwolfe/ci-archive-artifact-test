require 'fileutils'

step 'Archive files created during tests' do
  archivedir = 'archive/sut-files'

  source = "/tmp/mytest/master.txt"
  targetdir = "#{archivedir}/#{master}"
  FileUtils.mkdir_p(targetdir)
  scp_from(master, source, targetdir)

  source = '/tmp/mytest/agent.txt'
  targetdir = "#{archivedir}/#{agent}"
  FileUtils.mkdir_p(targetdir)
  scp_from(agent, source, targetdir)
end
