#!/usr/bin/env bash

YP_CI_BREW_INSTALL=${GITHUB_MATRIX_YP_CI_BREW_INSTALL:-}
# when not in CI, use dev install
[[ "${CI:-}" = "true" ]] || YP_CI_BREW_INSTALL=${YP_CI_BREW_INSTALL:-dev}

source ${YP_DIR}/bootstrap/brew-install-${YP_CI_BREW_INSTALL}.inc.sh
