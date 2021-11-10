#!/usr/bin/env bash

set -ex


run_prog ()
{
	LD_LIBRARY_PATH=. ./main
}


make -B dynamic_libs="one two"
run_prog

make -B dynamic_libs="two one"
run_prog
