require 'fileutils'

# Copies the file into the dedicated archive directory so it will be available
# in the Jenkins job build artifacts. The file will be copied into a directory
# named after the host it was copied from.
#
# Filepath is expected to be an absolute path on the provided host.
#
# Example
#
#   Archive the PuppetServer log file from the master host (named 'abc123'),
#   and archive the Puppet agent log file from the agent host (named 'xyz098'):
#
#     archive_file(master, '/var/log/puppetlabs/puppetserver/puppetserver.log')
#     archive_file(agent, '/var/log/puppetlabs/agent/agent.log')
#
#   Results in the following files on the test runner (e.g. Jenkins slave):
#
#     archive/sut-files/abc123/var/log/puppetlabs/puppetserver/puppetserver.log
#     archive/sut-files/xyz098/var/log/puppetlabs/agent/agent.log
#
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
  archive_file(agent, '/foo.bar')
end
