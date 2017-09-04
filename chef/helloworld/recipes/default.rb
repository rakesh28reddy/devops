#
# Cookbook:: helloworld
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'tomcat'
  service 'httpd' do
    action [:enable, :start]
  end
package 'epel-release'

cookbook_file '/var/lib/tomcat/webapps/helloworld.war' do
  source 'helloworld.war'
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

service 'tomcat' do
    action [:enable, :start]
end
