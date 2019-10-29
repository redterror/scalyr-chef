%w[scalyr-repo scalyr-repo-bootstrap].each do |pkg|
  apt_package pkg do
    action :remove
  end
end

remote_file "/tmp/#{node['scalyr_agent']['scalyr_repo_bootstrap_deb']}" do
  source "https://www.scalyr.com/scalyr-repo/stable/latest/#{node['scalyr_agent']['scalyr_repo_bootstrap_deb']}"
end

dpkg_package node['scalyr_agent']['scalyr_repo_bootstrap_deb'] do
  source "/tmp/#{node['scalyr_agent']['scalyr_repo_bootstrap_deb']}"
  action :install
end

apt_update 'update' do
  action :update
  ignore_failure true
end

