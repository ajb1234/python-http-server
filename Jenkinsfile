node {
	//download it
	git 'https://github.com/ajb1234/python-http-server'
	//install it
	sh "sudo cp -r app.py public /home/python"
	//update permissions
	sh "sudo chown -R python:python /home/python"
	sh "sudo systemctl restart python-systemd-http-server.service"
}

