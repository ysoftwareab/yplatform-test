ifeq (,$(wildcard yplatform/Makefile))
INSTALL_YP := $(shell git submodule update --init --recursive yplatform)
ifneq (,$(filter undefine,$(.FEATURES)))
undefine INSTALL_YP
endif
endif

include yplatform/build.mk/generic.common.mk
include yplatform/build.mk/js.deps.npm.mk

# ------------------------------------------------------------------------------

YP_VENDOR_FILES_IGNORE += \
	-e "^\.github/workflows/main\.yml$$" \

YP_CHECK_TPL_FILES += \
	.github/workflows/main.yml \

# ------------------------------------------------------------------------------

.github/workflows/main.yml: yplatform/package.json
.github/workflows/main.yml: yplatform/bin/github-checkout
.github/workflows/main.yml: $(wildcard .github/workflows.src/main*)
.github/workflows/main.yml: .github/workflows/main.yml.tpl
	$(call yp-generate-from-template)
