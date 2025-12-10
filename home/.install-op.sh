#!/bin/sh

type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Linux)
    if [ ! -f ~/.local/bin/op ];
    then
      dir=$(mktemp -d)

      url=$(curl -s https://app-updates.agilebits.com/product_history/CLI2 \
        | grep -oP "https://.*\.agilebits\.com/.*/op_linux_amd64_.*\.zip" \
	| head -1)
      
      curl --location --output $dir/op-cli.zip "$url"
      unzip -d $dir/op $dir/op-cli.zip

      if [ ! -d ~/.local/bin ];
      then
        mkdir -p ~/.local/bin
      fi
      mv $dir/op/op ~/.local/bin/
      chmod +x ~/.local/bin/op
      rm -rf $dir
    fi
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
