 Component = Struct.new(:name, :path, :install_path)

 THEME_NAME = "Leaf"

 COMPONENTS = [
    Component.new("look-and-feel", "./look-and-feel", "#{Dir.home}/.local/share/plasma/look-and-feel"),
    Component.new("desktoptheme", "./desktoptheme", "#{Dir.home}/.local/share/plasma/desktoptheme"),
    Component.new("aurorae", "./aurorae", "#{Dir.home}/.local/share/aurorae/themes"),
    Component.new("color-schemes", "./color-schemes", "#{Dir.home}/.local/share/color-schemes"),
    Component.new("wallpapers", "./wallpapers", "#{Dir.home}/.local/share/wallpapers"),
    Component.new("konsole-colors", "./konsole", "#{Dir.home}/.local/share/konsole"),
]
