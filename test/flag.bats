#!/usr/bin/env bats

@test "flag is true" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth flag
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) -m
    [ "${lines[0]}" = "true" ]
}

@test "flag default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth flag
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog)
    [ $status -eq 0 ]
}

@test "flag param" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth flag
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) -m
    [ $status -eq 0 ]
}

