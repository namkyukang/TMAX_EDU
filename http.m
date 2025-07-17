*DOMAIN
webtob1

*NODE
kangnk5	WEBTOBDIR="C:/TmaxSoft/WebtoB5.0", 
		SHMKEY = 54000,
		DOCROOT="C:/TmaxSoft/WebtoB5.0/docs",
		PORT = "8080", 
		IPCPERM = 0777,
		HTH = 1,
		NODENAME = "$(NODENAME)",
		ERRORDOCUMENT = "503",
		#Options="IgnoreExpect100Continue",
		JSVPORT = 9900,
		LOGGING = "log1",
		ERRORLOG = "log2",
		SYSLOG = "syslog"

*HTH_THREAD
hth_worker
                  #ReadBufSize=1048576, #1M
                  #HtmlsCompression="text/html",
                  SendfileThreshold=0,
                  WorkerThreads=8
*VHOST
vhost1          
                HOSTNAME = "neis1.co.kr",
		HOSTALIAS = "neis1.co.kr, 192.168.0.102",
                DOCROOT = "C:/TmaxSoft/webtob5.0/docs",   
                PORT = "18080",    
                LOGGING = "log1",
		ERRORLOG = "log2",
                ERRORDOCUMENT = "503,"
				
vhost2          
                HOSTNAME = "neis2.co.kr",
		HOSTALIAS = "neis2.co.kr, 192.168.0.102",
                DOCROOT = "C:/TmaxSoft/webtob5.0/docs",   
                PORT = "18080",    
                LOGGING = "log1",
		ERRORLOG = "log2",
                ERRORDOCUMENT = "503"

*REVERSE_PROXY
rp_jeus1       PathPrefix = "/cluster1",
                ServerPathPrefix = "/",
                VhostName = "vhost1,vhost2",
                ServerAddress="192.168.0.102:8088"

rp_jeus2       PathPrefix = "/cluster2",
                ServerPathPrefix = "/",
                VhostName = "vhost1,vhost2",
                ServerAddress="192.168.0.196:8090"

*SVRGROUP
htmlg		SVRTYPE = HTML
serverg1        SVRTYPE = JSV, VhostName = "vhost1,vhost2"

*SERVER
server1        SVGNAME = serverg1, MinProc = 10, MaxProc = 30, ASQCount = 1
server2        SVGNAME = serverg1, MinProc = 10, MaxProc = 30, ASQCount = 1

*URI
uri2        Uri = "/", Svrtype = JSV, SvrName = server2, VhostName = vhost2
uri1        Uri = "/", Svrtype = JSV, SvrName = server1, VhostName = vhost1

*ALIAS
alias1  	URI = "/cgi-bin/", RealPath = "C:/TmaxSoft/WebtoB5.0/cgi-bin/"

*LOGGING
syslog		Format = "SYSLOG", FileName = "C:/TmaxSoft/WebtoB5.0/log/system.log_%M%%D%%Y%",
			Option = "sync"
log1		Format = "DEFAULT", FileName = "C:/TmaxSoft/WebtoB5.0/log/access.log_%M%%D%%Y%", 
			Option = "sync"
log2		Format = "ERROR", FileName = "C:/TmaxSoft/WebtoB5.0/log/error.log_%M%%D%%Y%", 
			Option = "sync"

*ERRORDOCUMENT
503			status = 503,
			url = "/503.html"

*EXT
htm     MimeType = "text/html", SvrType = HTML
jsp     MimeType = "application/jsp", SVRTYPE = JSV
do      MimeType = "application/servlet", SVRTYPE = JSV
html    MimeType = "text/html", SvrType = HTML
bin     MimeType = "application/octet-stream", SvrType = HTML
zip     MimeType = "application/octet-stream", SvrType = HTML
cab     MimeType = "application/octet-stream", SvrType = HTML
exe     MimeType = "application/octet-stream", SvrType = HTML
swf     MimeType = "application/octet-stream", SvrType = HTML
pdf     MimeType=  "application/pdf", SvrType=HTML
hwp     MimeType = "application/x-hwp", SvrType = HTML
js      MimeType = "application/x-javascript", SvrType = HTML
css     MimeType = "text/css", SvrType = HTML
jpeg    MimeType = "image/jpeg", SvrType = HTML
jpg     MimeType = "image/jpeg", SvrType = HTML
bmp     MimeType = "image/bmp", SvrType = HTML
txt     MimeType = "text/plain", SvrType = HTML
shtml   MimeType = "magnus-internal/parsed-html", SvrType = HTML
gif     MimeType = "im89qa/gif", SvrType = HTML
doc     MimeType = "application/octet-stream", SvrType = HTML
ppt     MimeType = "application/octet-stream", SvrType = HTML
xls     MimeType = "application/octet-stream", SvrType = HTML