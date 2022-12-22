#!/usr/bin/env ruby

require_relative 'components.rb' rescue LoadError
require 'fileutils'

COMPONENTS.each do |comp|
    puts "Packaging component: #{comp.name}..."
    puts "Packaging contents of #{comp.path} to ./build/..."
    # loop over all entries in the component path
    Dir.entries(comp.path).each do |entry|
        if File.directory?("#{comp.path}/#{entry}")
            # zip and move the zipped file to build/ if the entry is a directory
            if !entry.include?(".")
                # quick fix for aurorae themes, they need the parent folder inside the archive
                if comp.name == "aurorae"
                    system("tar", "-czvf", "#{comp.name} #{entry}.tar.gz", "-C", "#{comp.path}", "./#{entry}")
                else
                    system("tar", "-czvf", "#{comp.name} #{entry}.tar.gz", "-C", "#{comp.path}/#{entry}/", ".")
                end
                FileUtils.mv("#{comp.name} #{entry}.tar.gz", "build")
            end
        else
            # copy the file to build/ otherwise
            FileUtils.cp("#{comp.path}/#{entry}", "build")
            puts entry
        end
    end
    puts "Component packaged: #{comp.name}"
end
