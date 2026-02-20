#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$BASH_SOURCE")"; cd -P "$(dirname "$(readlink "$BASH_SOURCE" || echo .)")"; pwd)

EXTERNALS_CONFIG_DIR="$SCRIPT_DIR/externals"

I3_STATUS_DEST="$HOME/.config/i3status"
PICOM_DEST="$HOME/.config/picom.conf"
XPROFILE_DEST="$HOME/.xprofile"
QT_CONF_DEST="$HOME/.config/qt6ct"
GTK_3_DEST="$HOME/.config/gtk-3.0"
GTK_4_DEST="$HOME/.config/gtk-4.0"
I3_GTK_THEME_DEST="$HOME/.themes/i3-gtk-theme"
FLAMESHOT_DEST="$HOME/.config/flameshot"

# Symlink i3status to ~/.config/i3status
if [[ -d "$I3_STATUS_DEST" ]]; then
	rm -rf "$I3_STATUS_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/i3status" "$I3_STATUS_DEST"

# Symlink picom.conf to ~/.config/picom.conf
if [[ -f "$PICOM_DEST" ]]; then
	rm "$PICOM_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/picom/picom.conf" "$PICOM_DEST"

# Symlink xprofile to ~/.xprofile
if [[ -f "$XPROFILE_DEST" ]]; then
	rm "$XPROFILE_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/xprofile/xprofile" "$XPROFILE_DEST"

# Symlink qt6ct config to ~/.config/qt6ct
if [[ -d "$QT_CONF_DEST" ]]; then
	rm -rf "$QT_CONF_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/qt6ct" "$QT_CONF_DEST"

# Symlink gtk 3.0 config to ~/.config/gtk-3.0
if [[ -d "$GTK_3_DEST" ]]; then
	rm -rf "$GTK_3_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/gtk-3.0" "$GTK_3_DEST"

# Symlink gtk 4.0 config to ~/.config/gtk-4.0
if [[ -d "$GTK_4_DEST" ]]; then
	rm -rf "$GTK_4_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/gtk-4.0" "$GTK_4_DEST"

# Symlink i3-gtk-theme to ~/.themes/i3-gtk-theme
if [[ -d "$I3_GTK_THEME_DEST" ]]; then
	rm -rf "$I3_GTK_THEME_DEST"
fi

mkdir -p "$(dirname $I3_GTK_THEME_DEST)"
ln -s "$EXTERNALS_CONFIG_DIR/i3-gtk-theme" "$I3_GTK_THEME_DEST"

# Symlink flameshot to ~/.config/flameshot
if [[ -d "$FLAMESHOT_DEST" ]]; then
	rm -rf "$FLAMESHOT_DEST"
fi

ln -s "$EXTERNALS_CONFIG_DIR/flameshot" "$FLAMESHOT_DEST"
