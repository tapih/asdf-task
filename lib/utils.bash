#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for task.
GH_REPO="https://github.com/go-task/task"
TOOL_NAME="task"
TOOL_TEST="task version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if task is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
  # TODO: Adapt this. By default we simply list the tag names from GitHub releases.
  # Change this function if task has other means of determining installable versions.
  list_github_tags
}

download_release() {
  local version filename url platform arch

  version="$1"
  filename="$2"

  case $(uname -m) in
  x86_64) arch="amd64" ;;
  arm64) arch="arm64" ;;
  aarch64) arch="arm64" ;;
  *) arch="$(uname -m)" ;;
  esac

  platform="$(uname | tr '[:upper:]' '[:lower:]')"
  if [[ ! (${platform} == linux || ${platform} == darwin) ]]; then
    fail "Unsupported platform '${platform}' found. Only Linux and Darwin are supported."
  fi

  # TODO: Adapt the release URL convention for task
  # https://github.com/go-task/task/releases/download/v3.12.0/task_linux_amd64.deb
  url="$GH_REPO/releases/download/v${version}/${TOOL_NAME}_${platform}_${arch}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    echo "install path"
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    # TODO: Asert task executable exists.
    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
