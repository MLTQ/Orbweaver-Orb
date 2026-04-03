#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
PYTHON_BIN="${PLUGIN_DIR}/.venv/bin/python"

if [[ ! -x "${PYTHON_BIN}" ]]; then
    echo "graphchan-orb: virtual environment not found at ${PLUGIN_DIR}/.venv" >&2
    echo "graphchan-orb: run: cd ${PLUGIN_DIR} && python -m venv .venv && .venv/bin/pip install -e ." >&2
    exit 1
fi

export PYTHONUNBUFFERED=1
export PYTHONNOUSERSITE=1
exec "${PYTHON_BIN}" -m graphchan_orb.server
