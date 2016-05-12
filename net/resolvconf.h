server {
	label="resolvconf";
	caching=off;
	policy=included;
	timeout=1s;
	uptest=query;
	interval=2m;
	preset=on;
}
