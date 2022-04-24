.POSIX:

DEST = $(HOME)
STOW   = stow --verbose --no-folding --target="$(DEST)"

all: install

install:
	for dir in `find . -maxdepth 1 -type d -not -path . -not -path '*/\.*'`; do \
		printf "\nInstalling $$dir\n" ; \
		$(STOW) `basename $$dir`; \
	done

remove:
	for dir in `find . -maxdepth 1 -type d -not -path . -not -path '*/\.*'`; do \
		printf "\nRemoving $$dir\n" ; \
		$(STOW) --delete `basename $$dir`; \
	done

force-remove:
	for dir in `find . -maxdepth 1 -type d -not -path . -not -path '*/\.*'`; do \
		printf "\nForce removing $$dir\n" ; \
		find $$dir -type f | sed -E "s|$$dir|$(DEST)|g" | xargs echo ; \
	done
