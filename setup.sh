#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$BASH_SOURCE")"; cd -P "$(dirname "$(readlink "$BASH_SOURCE" || echo .)")"; pwd)

EXTERNALS_CONFIG_DIR="$SCRIPT_DIR/externals"

I3_STATUS_DEST="$HOME/.config/i3status"
PICOM_DEST="$HOME/.config/picom.conf"
XPROFILE_DEST="$HOME/.xprofile"
QT_CONF_DEST="$HOME/.config/qt6ct"

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
