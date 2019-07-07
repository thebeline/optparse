#!/usr/bin/env bats

@test "multiple words in option" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth default="empty"
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog) -m "a b c"
    [ $status -eq 0 ]
    [[ ${lines[0]} == "a b c" ]]
}

@test "multiple words in default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth default="a b c"
    ;   . <(optparse.build)

    ;   echo $meth
    '

    run bash -u <(echo $prog)
    [ $status -eq 0 ]
    [[ ${lines[0]} == "a b c" ]]
}
