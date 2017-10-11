# Docsrv: configure the languages whose api-doc can be auto generated
LANGUAGES = "go scala python"
# Docsrv: configure the directory containing the python sources
PYTHON_MAIN_DIR ?= ./python
# Docs: do not edit this
DOCS_REPOSITORY := https://github.com/src-d/docs
SHARED_PATH ?= $(shell pwd)/.shared
DOCS_PATH ?= $(SHARED_PATH)/.docs
$(DOCS_PATH)/Makefile.inc:
	git clone --quiet --depth 1 $(DOCS_REPOSITORY) $(DOCS_PATH);
-include $(DOCS_PATH)/Makefile.inc
