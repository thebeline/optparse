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

@test "long param" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method 1
    [ $status -eq 0 ]
}

@test "missing long param" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m desc=description variable=meth
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) -m 1
    [ $status -eq 3 ]
}

@test "long options only" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define long=method desc=description variable=meth flag
    ;   . $(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method
    [ $status -eq 0 ]
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

@test "multiple options" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=a long=atest desc=description variable=a
    ;   optparse.define         long=btest desc=description variable=b
    ;   optparse.define short=c long=ctest desc=description variable=c
    ;   . $(optparse.build)

    ;   echo $a $b $c
    '

    run bash -u <(echo $prog) -a 1 --btest 2 -c 3
    [ $status -eq 0 ]
}
