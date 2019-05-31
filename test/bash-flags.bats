#!/usr/bin/env bats

@test "set -u" {
    prog=$'
        set -u
    ;   source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method XXX
    [ $status -eq 0 ]
    [ "${lines[0]}" = "XXX" ]
}

@test "set -e" {
    prog=$'
        set -e
    ;   source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method XXX
    [ $status -eq 0 ]
    [ "${lines[0]}" = "XXX" ]
}

@test "set -o pipefail" {
    prog=$'
        set -o pipefail
    ;   source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method XXX
    [ $status -eq 0 ]
    [ "${lines[0]}" = "XXX" ]
}
