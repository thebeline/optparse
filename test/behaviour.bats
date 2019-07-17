#!/usr/bin/env bats

@test "default is not in list" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=var desc=d variable=var behaviour=list list="a b c" default="d"
    ;   . <(optparse.build)

    ;   echo $var
    '

    run bash -u <(echo $prog)
    [ $status -eq 1 ]
}

@test "default is in list" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=var desc=d variable=var behaviour=list list="a b c" default="c"
    ;   . <(optparse.build)

    ;   echo $var
    '

    run bash -u <(echo $prog)
    [ $status -eq 0 ]
}

@test "input is not in list" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=var desc=d variable=var behaviour=list list="a b c"
    ;   . <(optparse.build)

    ;   echo $var
    '

    run bash -u <(echo $prog) --var d
    [ $status -eq 1 ]
}

@test "list is defined without correct behaviour" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=var desc=d variable=var list="a b c"
    ;   . <(optparse.build)

    ;   echo $var
    '

    run bash -u <(echo $prog) --var d
    [ $status -eq 1 ]
}
