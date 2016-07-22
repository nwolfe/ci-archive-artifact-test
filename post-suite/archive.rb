require 'fileutils'

def archive_file_from(host, from_path, opts = {}, archive_root = 'archive/sut-files')
  filedir = File.dirname(from_path)
  targetdir = File.join(archive_root, host.hostname, filedir)
  FileUtils.mkdir_p(targetdir)
  scp_from(host, from_path, targetdir, opts)
end

step 'Archive files created during tests' do
  ## Copy file(s) from master
  archive_file_from(master, '/var/log/puppetlabs/puppetserver/puppetserver.log')
  archive_file_from(master, '/var/log/messages')

  ## Copy file(s) from agent
  archive_file_from(other, '/opt/file-on-agent')
  archive_file_from(other, 'foo.bar')
end
