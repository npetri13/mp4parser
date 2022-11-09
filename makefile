# Copyright © 2022 Nico Petri, 03172 Guben, Germany
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files
# (the “Software”), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to permit
# persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#
#  makefile
#  Created by Nico Petri on 07.11.2022.

GCC=gcc
C_FLAGS = -g -Og

.PHONY: all subs

all:		mp4parser

mp4parser: makefile subs
		$(GCC) $(C_FLAGS) ./obj/*.o -o dist/mp4parser.out

subs:
	cd ./bison && $(MAKE) all
	cd ./flex && $(MAKE) all
	cd ./clang && $(MAKE) all

clean:
	cd ./bison && $(MAKE) clean
	cd ./flex && $(MAKE) clean
	cd ./clang && $(MAKE) clean
	rm -f obj/*.o
	rm -f dist/*.out