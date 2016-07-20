require 'fileutils'

def archive_file(host, filepath)
  # Value hardcoded in ci-job-configs too
  archiveroot = 'archive/sut-files'
  filedir = File.dirname(filepath)
  targetdir = "#{archiveroot}/#{host}#{filedir}"
  FileUtils.mkdir_p(targetdir)
  scp_from(host, filepath, targetdir)
end

step 'Archive files created during tests' do
  ## Copy file(s) from master
  archive_file(master, '/tmp/mytest/master.txt')
  archive_file(master, '/etc/file-on-master.log')

  ## Copy file(s) from agent
  archive_file(agent, '/tmp/mytest/agent.txt')
  archive_file(agent, '/opt/file-on-agent.log')
end
