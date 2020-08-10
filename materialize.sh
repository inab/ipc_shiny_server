#!/bin/sh

WORKDIR="$(dirname "$0")"

case "${WORKDIR}" in
	/*)
		true
		;;
	.)
		WORKDIR="$PWD"
		;;
	*)
		WORKDIR="${PWD}/${WORKDIR}"
		;;
esac

cd "${WORKDIR}/apps"

git clone -b BSC_progeny https://github.com/saezlab/ShinyFUNKI.git progeny
git clone -b BSC_FUNKI https://github.com/saezlab/ShinyFUNKI.git dorothea
