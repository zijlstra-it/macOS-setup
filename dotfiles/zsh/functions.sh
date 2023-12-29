vv() {
	select config in dev cpow kickstart nvchad; do
		NVIM_APPNAME=nvim-$config nvim "$@"
		break
	done
}
