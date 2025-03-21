#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/arminc/clair-scanner/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local platform="${os}-${arch}"
    # https://github.com/arminc/clair-scanner/releases/download/14.0.0/clair-scanner_linux-amd64
    local url=$MIRROR/$ver/clair-scanner_${platform}${suffix}
    local lfile=$DIR/clair-scanner_${platform}-$ver${suffix}

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

dlver () {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver windows amd64 .exe
    dl $ver windows arm64 .exe
}

dlver ${1:-14.0.0}
