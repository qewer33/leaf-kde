#!/usr/bin/env ruby

require_relative 'components.rb' rescue LoadError
require 'fileutils'

COMPONENTS.each do |comp|
    puts "Installing component: #{comp.name}..."
    puts "Copying contents of #{comp.path} to #{comp.install_path}..."
    # copy the the component folder to the component install directory
    FileUtils.mkdir_p(comp.install_path)
    FileUtils.cp_r(comp.path+"/.", comp.install_path)
    puts "Component installed: #{comp.name}"
end
