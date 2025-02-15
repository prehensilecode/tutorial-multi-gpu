#!/usr/bin/make -f
# For JSC Courses
# Generates a tar from all top-level directory in this current folder, without hidden files
# -Andreas Herten, 2021 April 27
.PHONY: all
all: tut138-multi-gpu.tar.gz

SOURCES=$(shell gfind . -maxdepth 1 -mindepth 1 -not -path "./.*" -not -name "tut138-multi-gpu.tar.gz" -not -name "*-H_*" -printf '%P\n' | sort -h)

tut138-multi-gpu.tar.gz: $(shell find . -not -name "tut138-multi-gpu.tar.gz")
# 	if ! grep -q "Please check Github"; then \
		sed -i '1 i***Please check GitHub repo for latest version of slides: https://github.com/FZJ-JSC/tutorial-multi-gpu/ ***\n' README.md; \
	fi;
	sed -i '1 i***Please check GitHub repo for latest version of slides: https://github.com/FZJ-JSC/tutorial-multi-gpu/ ***\n' README.md
	tar czf $@ --transform 's,^,SC21-tut138-Multi-GPU/,' --exclude=".*" $(SOURCES)
# 	if grep -q "Please check Github"; then \
		sed -i '2d' README.md; \
	fi
	sed -i '1,2d' README.md