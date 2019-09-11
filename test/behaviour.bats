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

@test "behaviour doesn't exists" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=var desc=d variable=var behaviour=null list="a b c"
    ;   . <(optparse.build)

    ;   echo $var
    '

    run bash -u <(echo $prog)
    [ $status -eq 1 ]
}

@test "list behaviour without default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth behaviour=list list="a b c"
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) --method a
    [ $status -eq 0 ]
}
