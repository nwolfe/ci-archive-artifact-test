task :acceptance do
  sh 'beaker --keyfile ${HOME}/.ssh/id_rsa-acceptance --hosts "--disable-default-role centos6-64m-redhat6-64a" --post-suite ./post-suite --tests ./test-suite'
end
