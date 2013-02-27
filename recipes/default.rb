#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
remote_file "/tmp/redis-2.6.10.tar.gz" do
	source "http://redis.googlecode.com/files/redis-2.6.10.tar.gz"
	notifies :run, "bash[install_program]", :immediately
end

bash "install_program" do
	user "root"
	cwd "/tmp"
	code <<-EOH
		tar -zxf /tmp/redis-2.6.10.tar.gz
		(cd redis-2.6.10/ && make && make install)
	EOH
	action :nothing
end
