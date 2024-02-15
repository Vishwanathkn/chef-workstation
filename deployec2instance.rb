#
# Cookbook:: ec2deploy
# Recipe:: deployec2instance
#
# Copyright:: 2024, The Authors, All Rights Reserved.

chef_gem 'aws-sdk' do
compile_time true if respond_to?(:complie_time)
end 

include recipe 'aws'
aws_creds=data_bag_item('aws', 'credentials')
aws_access_key_id= aws_creds['AKIA6GBMC33FOEKVIH5W']
aws_secret_key_id= aws_creds['/fe+eTKya+GOJL72PuBWOhr0RAu2KUg9xPgH+rMe']
aws_region= 'ap-south-1a'

aws_instance 'vishwanath-first-ec2instance-chef' do
aws_access_key_id aws_access_key_id
aws_secret_key_id aws_secret_key_id
region aws_region
image id 'ami-0c20d88b0021158c6'
instance_type 't2.micro'
key_name 'vishwanath-key'
subney_id 'subnet-0898a5bd9aa7ddc3e'
securitygroup_id 'sg-04619a4334117b7bf'

action :create
end
