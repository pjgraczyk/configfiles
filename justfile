set unstable

ZED_SRC := "$HOME/.config/zed/"
ZED_DST := "zed"
GHOSTTY_SRC := "$HOME/Library/Application Support/com.mitchellh.ghostty/"
GHOSTTY_DST := "ghostty"
GIT_MESSAGE := "minor changes"

copy-from:
    cp -rf {{ZED_SRC}} {{ZED_DST}}
    cp -rf "{{GHOSTTY_SRC}}" {{GHOSTTY_DST}}

copy-to:
    cp -rf {{ZED_DST}} {{ZED_SRC}}
    cp -rf {{GHOSTTY_DST}} "{{GHOSTTY_SRC}}"

change git_message=GIT_MESSAGE:
    git add .;
    git commit -m "{{git_message || GIT_MESSAGE}}";
    git push;

run: copy-from change

