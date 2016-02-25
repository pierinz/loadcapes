# Environment 
prefix:=/usr/local

all:
	echo "Nothing to make, just install"
.PHONY: all

clean:
.PHONY: clean

install:
	mkdir -p $(prefix)/sbin
	install -m 0755 -t $(prefix)/sbin $(PROGRAMS) loadcapes.sh

	touch /etc/capes.list
	install -m 0640 capes.service /etc/systemd/system/
	systemctl daemon-reload
	systemctl enable capes.service
	systemctl restart capes.service
.PHONY: install

uninstall:
	systemctl stop capes.service
	systemctl disable capes.service
	rm -f /etc/systemd/system/capes.service
	systemctl daemon-reload
	cd $(prefix)/sbin
	rm -f loadcapes.sh
.PHONY: uninstall
