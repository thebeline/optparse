#!/usr/bin/env bats

@test "long param" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method 1
    [ $status -eq 0 ]
}

@test "missing long param" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m desc=description variable=meth
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) -m 1
    [ $status -eq 3 ]
}

@test "long options only" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define long=method desc=description variable=meth
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method 1
    [ $status -eq 0 ]
}

