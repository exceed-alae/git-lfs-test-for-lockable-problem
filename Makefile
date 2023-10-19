GIT_LFS		:= ../git-lfs/bin/git-lfs

.PHONY: test
test: sub1/test1.txt sub1/sub2/test2.txt
	@echo \*\*\* Check having lockable attribute
	@git check-attr -a $^ | grep lockable
	@echo \*\*\* Remove read-only flag
	chmod 777 $^
	@echo \*\*\* Exec \"git-lfs post-checkout\" for setting read-only flag
	$(GIT_LFS) post-checkout HEAD HEAD 0
	@echo \*\*\* Check read-only flag ...
	@stat --format="%n %a" $^
	@for fn in $^ ; do (stat --format="%a" $${fn} | grep -v 7 >/dev/null) || (echo "[CHECK FAILED] '$${fn}' is not read-only" && exit 1) ; done
