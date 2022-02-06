#!/usr/bin/env bash
set -e
DIR=~/Downloads
MIRROR=https://github.com/cert-manager/cert-manager/releases/download

# https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cmctl-linux-amd64.tar.gz

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tar.gz}
    local platform="${os}-${arch}"
    local file="cmctl-${platform}.${archive_type}"
    local url="${MIRROR}/v${ver}/${file}"
    local lfile="${DIR}/cmctl-${platform}-${ver}.${archive_type}"
    if [ ! -e $lfile ];
    then
        curl -sSL -f -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver

    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux ppc64le
    dl $ver windows amd64
}

dl_ver ${1:-1.7.1}
