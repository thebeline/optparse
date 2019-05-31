#!/usr/bin/env bats

@test "multiple options" {
    prog=$'
        source ../optparse.sh

    ;   optparse.define short=a long=atest desc=description variable=a
    ;   optparse.define         long=btest desc=description variable=b
    ;   optparse.define short=c long=ctest desc=description variable=c
    ;   . <(optparse.build)

    ;   echo $a $b $c
    '

    run bash -u <(echo $prog) -a 1 --btest 2 -c 3
    [ $status -eq 0 ]
}
