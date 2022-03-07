#!/usr/bin/env ruby

require 'fileutils'

class Component
    def initialize(name, comp_path, install_path)
        @name = name
        @comp_path = comp_path
        @install_path = install_path
    end

    def install
        puts "Installing component: #{@name}..."
        puts "Copying contents of #{@comp_path} to #{@install_path}..."
        FileUtils.cp_r(@comp_path, @install_path)
        puts "Component installed: #{@name}"
    end
end

COMPONENTS = [
    Component.new("look-and-feel", "look-and-feel/.", "#{Dir.home}/.local/share/plasma/look-and-feel"),
    Component.new("desktoptheme", "desktoptheme/.", "#{Dir.home}/.local/share/plasma/desktoptheme"),
    Component.new("aurorae", "aurorae/.", "#{Dir.home}/.local/share/aurorae/themes"),
    Component.new("color-schemes", "color-schemes/.", "#{Dir.home}/.local/share/color-schemes"),
]

def install
    COMPONENTS.each do |comp|
        comp.install
    end
end

install
