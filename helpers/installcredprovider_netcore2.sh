#!/usr/bin/env bash
# DESCRIPTION: A simple shell script designed to download the version 0.1.28
# of the artifacts credential provider plugin and
# install it into $HOME/.nuget/plugins. Version 0.1.28 is the last version of the 
# credential provider that supports .NET Core 2.1.
# SEE: https://github.com/Microsoft/artifacts-credprovider/blob/master/README.md

REPO="Microsoft/artifacts-credprovider"
FILE="Microsoft.NuGet.CredentialProvider.tar.gz"
VERSION="0.1.28"
# URL pattern documented at https://help.github.com/en/articles/linking-to-releases as of 2019-03-29
URI="https://github.com/$REPO/releases/$VERSION/download/$FILE"
NUGET_PLUGIN_DIR="$HOME/.nuget/plugins"

# Ensure plugin directory exists
if [ ! -d "${NUGET_PLUGIN_DIR}" ]; then
  echo "INFO: Creating the nuget plugin directory (i.e. ${NUGET_PLUGIN_DIR}). "
  if ! mkdir -p "${NUGET_PLUGIN_DIR}"; then
      echo "ERROR: Unable to create nuget plugins directory (i.e. ${NUGET_PLUGIN_DIR})."
      exit 1
  fi
fi

echo "Downloading from $URI"
# Extract netcore from the .tar.gz into the plugin directory

#Fetch the file
curl -H "Accept: application/octet-stream" \
     -s \
     -S \
     -L \
     "$URI" | tar xz -C "$HOME/.nuget/" "plugins/netcore"

echo "INFO: credential provider netcore plugin extracted to $HOME/.nuget/"
