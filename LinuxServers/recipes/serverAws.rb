#
# Cookbook Name:: LinuxServers
# Recipe:: serverAws
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'aws::default'
include_recipe 'aws-codedeploy-agent::default'
