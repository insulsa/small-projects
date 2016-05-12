global {
	perm_cache=10000;
	cache_dir="/var/cache/pdnsd";
	run_as="pdnsd";
	server_ip=0.0.0.0;
	status_ctl=on;
	min_ttl=1d;
	max_ttl=100w;
	timeout=10s;
	neg_ttl=1s;
}
