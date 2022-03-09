#!/usr/bin/env ruby

require_relative 'components.rb' rescue LoadError
require 'fileutils'

COMPONENTS.each do |comp|
    puts "Packaging component: #{comp.name}..."
    puts "Packaging contents of #{comp.path} to ./build/..."
    Dir.entries(comp.path).select { |e| !e.include?(".") } .each do |entry|
        system("tar", "-czvf", "#{comp.name} #{entry}.tar.gz", "-C", "#{comp.path}/#{entry}/", ".")
        FileUtils.mv("#{comp.name} #{entry}.tar.gz", "build")
    end
    puts "Component packaged: #{comp.name}"
end
