#!/bin/sh

autoreconf -vif -Wall,no-obsolete

if [ -z "$NOCONFIGURE" ]; then
    ./configure "$@"
fi
