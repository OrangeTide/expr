#!/bin/sh

TEST_COUNT=0

die() {
	echo Unexpected error = $? >&2
	exit 1
}

positive() {
	"$@" || die
	TEST_COUNT=$((${TEST_COUNT}+1))
}

negative() {
	"$@" && die
	TEST_COUNT=$((${TEST_COUNT}+1))
}

positive ./expr
positive ./expr '2' '2 + 2' '3 / 1' '1 / 3 - 42'
positive ./expr '-2147483647 / ( 14 - 5 * 3 )'
negative ./expr '-2147483648 / ( 14 - 5 * 3 )'
positive ./expr '4 + 8 - 5 * 3'
negative ./expr '4 3'
negative ./expr '0 / 0'
negative ./expr '-1000 / 0'
negative ./expr '2147483648'
negative ./expr 'foo'

echo "All tests passed (${TEST_COUNT} tests)"
