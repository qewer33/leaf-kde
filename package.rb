#!/usr/bin/env ruby

require_relative 'components.rb' rescue LoadError
require 'fileutils'

COMPONENTS.each do |comp|
    puts "Packaging component: #{comp.name}..."
    puts "Packaging contents of #{comp.path} to ./build/..."
    # loop over all entriesin the component path
    Dir.entries(comp.path).each do |entry|
        if File.directory?("#{comp.path}/#{entry}") && !entry.include?(".")
            # zip and move the zipped file to build/ if the entry is a directory
            system("tar", "-czvf", "#{comp.name} #{entry}.tar.gz", "-C", "#{comp.path}/#{entry}/", ".")
            FileUtils.mv("#{comp.name} #{entry}.tar.gz", "build")
        else
            # copy the file to build/ otherwise
            FileUtils.cp("#{comp.path}/#{entry}", "build")
            puts entry
        end
    end
    puts "Component packaged: #{comp.name}"
end
