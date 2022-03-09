#!/usr/bin/env ruby

require 'fileutils'

Component = Struct.new(:name, :path, :install_path)

COMPONENTS = [
    Component.new("look-and-feel", "look-and-feel/.", "#{Dir.home}/.local/share/plasma/look-and-feel"),
    Component.new("desktoptheme", "desktoptheme/.", "#{Dir.home}/.local/share/plasma/desktoptheme"),
    Component.new("aurorae", "aurorae/.", "#{Dir.home}/.local/share/aurorae/themes"),
    Component.new("color-schemes", "color-schemes/.", "#{Dir.home}/.local/share/color-schemes"),
    Component.new("wallpapers", "wallpapers/.", "#{Dir.home}/.local/share/wallpapers"),
]

COMPONENTS.each do |comp|
    puts "Installing component: #{comp.name}..."
    puts "Copying contents of #{comp.path} to #{comp.install_path}..."
    FileUtils.cp_r(comp.path, comp.install_path)
    puts "Component installed: #{comp.name}"
end
