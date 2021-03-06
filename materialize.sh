#!/bin/sh

set -e

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

if [ -d progeny ] ; then
	( cd progeny && git pull )
else
	git clone --single-branch -b BSC_progeny https://github.com/saezlab/ShinyFUNKI.git progeny
fi
mkdir -p progeny/renv/library progeny/renv/staging
chmod -R o+w progeny

if [ -d dorothea ] ; then
	( cd dorothea && git pull )
else
	git clone --single-branch -b BSC_dorothea https://github.com/saezlab/ShinyFUNKI.git dorothea
fi
mkdir -p dorothea/renv/library dorothea/renv/staging
chmod -R o+w dorothea
