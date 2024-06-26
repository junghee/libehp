#!/bin/bash


#   Copyright 2017-2018 University of Virginia
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


set -x
set -e

function cleanup()
{
	echo "Test failed"
	exit 1
}


function main()
{
	scons || cleanup 
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/../lib

	./test.exe ./test.exe || cleanup 
	./test.exe /bin/ls || cleanup 
	./test.exe /bin/bash || cleanup 

 	./test.exe ./test_des.exe 2 6 || cleanup

	echo "test passed"
	exit 0
}

main "$@"
