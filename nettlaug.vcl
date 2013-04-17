 backend local {
     .host = "localhost";
     .port = "80";
 }

sub vcl_recv {
	if (req.url == "/") {
		set req.http.Filename = "/index";
	} else {
		set req.http.Filename = req.url;
	}

	set req.url = "/nettlaug" + req.url;
}

sub vcl_fetch {
	set beresp.do_esi = true;
}
