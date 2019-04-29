#!/usr/bin/env bats

@test "default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth default="empty"
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog)
    [ $status -eq 0 ]
    [ "${lines[0]}" = "empty" ]
}

@test "empty default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth default=""
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog)
    [ $status -eq 0 ]
    [ -z "${lines[0]:-}" ]
}

@test "missing default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog)
    [ $status -eq 3 ]
}

