# ports are very important resources so we should
# have a meeting and decide who listens which
# here is we type all PORTs in UPPER
GFWTORPORT = 9052
LASTFMPORT = 9053
PRIVOXYPORT = 8118
# and lowers are othervars

# we have profiles for tor for defferent context conditions

# all tor options can be specified by -o argument
# which makes is easier to assign
tor = /usr/sbin/tor --SocksPort $(TORPORT) --PIDFile $(pidfile) --DataDirectory $(datadir) -f $(torrc) --RunAsDaemon 0

.PHNOY: gfw
gfw:TORPORT = $(GFWTORPORT)
gfw:torrc = runtime/gfw.torrc
gfw:pidfile = runtime/gfw.pid
gfw:datadir = runtime/gfw.d
gfw:
	cp gfw.torrc.tpl $(torrc)
	sed 's/^/Bridge /' bridges >> $(torrc)
	$(tor)

# privoxy requires a configfile i should genit
.PNONY: privoxy
privoxy = /usr/sbin/privoxy --no-daemon --pidfile $(pidfile)
privoxy:pidfile = runtime/privoxy.pid
privoxy:deffile = runtime/privoxy.def
privoxy:confile = runtime/privoxy.conf
privoxy:
	printf "\
		\r#define _PORT_ $(PRIVOXYPORT)\
		\n#define _DIR_ $(realpath .) \n" > $(deffile)
	cat privoxy.tpl >> $(deffile)
	cpp $(deffile) -o $(confile)
	$(privoxy) $(confile)
