#
# Cookbook Name:: LinuxServers
# Recipe:: default
#
# Copyright (c) 2016 Bill Stokes, All Rights Reserved.

# Insure current sources and patches are in place before starting
include_recipe 'apt::default'
include_recipe 'auto-patch::default'
