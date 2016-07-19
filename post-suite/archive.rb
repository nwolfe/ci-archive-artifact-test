require 'fileutils'

step 'Archive files created during tests' do
  archivedir = 'archive/sut-files'

  ## Copy file(s) from master
  sourcedir = '/tmp/mytest'
  source = "#{sourcedir}/master.txt"
  targetdir = "#{archivedir}/#{master}#{sourcedir}"

  FileUtils.mkdir_p(targetdir)
  scp_from(master, source, targetdir)

  ## Copy file(s) from agent
  sourcedir = '/tmp/mytest'
  source = "#{sourcedir}/agent.txt"
  targetdir = "#{archivedir}/#{agent}#{sourcedir}"

  FileUtils.mkdir_p(targetdir)
  scp_from(agent, source, targetdir)
end
