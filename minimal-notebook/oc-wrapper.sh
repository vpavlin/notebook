#!/bin/bash

case $OC_VERSION in
    3.*)
        OC_VERSION=3.11
        ;;
    4.*)
        OC_VERSION=4
        ;;
    *)
        OC_VERSION=4
        ;;
esac

exec /opt/app-root/bin/oc-$OC_VERSION "$@"
