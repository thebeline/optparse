#!/usr/bin/env bats

@test "short param" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) -m 1
    [ $status -eq 0 ]
}

@test "short name too long" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=mm long=method desc=description variable=meth
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog)
    [ $status -eq 1 ]
}
