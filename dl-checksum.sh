#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/arminc/clair-scanner/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local platform="${os}_${arch}"
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
    dl $ver darwin 386
    dl $ver darwin amd64
    dl $ver linux 386
    dl $ver linux amd64
    dl $ver windows 386 .exe
    dl $ver windows amd64 .exe
}

dlver ${1:-v12}
