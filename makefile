include $(PQ_FACTORY)/factory.mk

pq_part_name := bzip2-1.0.6
pq_part_file := $(pq_part_name).tar.gz

build-stamp: stage-stamp
	$(MAKE) -C $(pq_part_name) -f Makefile-libbz2_so mkinstalldirs=$(part_dir) PREFIX=$(part_dir)
	$(MAKE) -C $(pq_part_name) -f Makefile-libbz2_so mkinstalldirs=$(part_dir) DESTDIR=$(stage_dir) PREFIX=$(part_dir) install
	touch $@

stage-stamp: configure-stamp

configure-stamp: patch-stamp
	touch $@

patch-stamp: unpack-stamp
	touch $@

unpack-stamp: $(pq_part_file)
	tar xf $(source_dir)/$(pq_part_file)
	touch $@
