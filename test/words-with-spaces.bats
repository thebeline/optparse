#!/usr/bin/env bats

@test "default" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=m long=method desc=description variable=meth default="empty"
    ;   . <(optparse.build)

    ;   echo "$meth"
    '

    run bash -u <(echo $prog) -m "a b c"
    [ $status -eq 0 ]
    [ "${lines[0]}" = "a b c" ]
}
