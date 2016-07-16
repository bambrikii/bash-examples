#!/bin/bash

VAR1="var1 value"

function func1 {
	echo $1
	echo $VAR1
}

func1 "123"

BOUNDARY="`uuidgen`/`hostname`"

echo "From: asd@localhost
To: asd@localhost
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=\"$BOUNDARY\"
Subject: Sample subject, hostname.

--$BOUNDARY
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline

This is a MIME-encapsulated message
--$BOUNDARY
--$BOUNDARY
Content-Type: text/html
Content-Disposition: inline

<html>
	<body>
		<a href=\"http://www.google.com/\">google.com</a>
	</body>
</html>
--$BOUNDARY
--$BOUNDARY
Content-Type: text/html
Content-Disposition: inline

<html>
	<body>
		aaa
	</body>
</html>
<html>
<body>
<b>bold</b><br />
<i>italic</italic><br />
</body>
</html>
--$BOUNDARY
--$BOUNDARY
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"a.sh\"

`base64 sendmail-sample.sh`
--$BOUNDARY" | sendmail -t
