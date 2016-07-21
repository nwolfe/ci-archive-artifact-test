require 'fileutils'

def archive_file_from(host, from_path, opts = {}, archive_root = 'archive/sut-files')
  filedir = File.dirname(from_path)
  targetdir = File.join(archive_root, host, filedir)
  FileUtils.mkdir_p(targetdir)
  scp_from(host, from_path, targetdir, opts)
end

step 'Archive files created during tests' do
  ## Copy file(s) from master
  archive_file_from(master, '/etc/file-on-master.log')

  ## Copy file(s) from agent
  archive_file_from(agent, '/tmp/mytest/agent.txt')
  archive_file_from(agent, '/opt/file-on-agent.log')
  archive_file_from(agent, '/foo.bar')
  archive_file_from(agent, 'bar')
end
