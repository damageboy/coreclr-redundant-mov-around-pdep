#!/bin/bash
if [[ ! -x "$HOME/.dotnet/tools/jitdasm" ]]; then
  echo installing jitdasm
  dotnet tool install --global JitDasm.0xd4d --version 1.0.0
fi
me=coreclr-redundant-mov-around-pdep
sudo $HOME/.dotnet/tools/jitdasm -p $(pgrep -f $me) -m $me
