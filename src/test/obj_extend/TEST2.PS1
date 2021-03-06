# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2018-2019, Intel Corporation

#
# src/test/obj_extend/TEST2 -- unit test for extending the pool
# negative scenario - reservation size smaller than pool header size
# (pmem/issues#818)
#

. ..\unittest\unittest.ps1

require_test_type medium
require_fs_type any

setup

$Env:RESVSIZE=20

# prepare pool sets
create_poolset $DIR\testset1 `
	($Env:RESVSIZE + ":" + $DIR + "\testdir11:d") `
	O SINGLEHDR

expect_normal_exit $Env:EXE_DIR\obj_extend$Env:EXESUFFIX $DIR\testset1

check

pass
