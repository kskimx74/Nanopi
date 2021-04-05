#!/bin/sh

. /lib/functions.sh

cpulimit_get(){
	echo cpulimit_get
	config_get enabled $1 enabled
	[ $enabled -gt 0 ] || return 1
	config_get limit $1 limit
	config_get exename $1 exename
	eval exepid=$(pgrep $exename)
	cpulimit -l $limit -p $exepid &
	echo cpulimit -l $limit -p $exepid
}
