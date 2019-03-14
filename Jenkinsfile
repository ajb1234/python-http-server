node {
	git 'https://github.com/ajb1234/python-http-server'
	sh "sudo cp -r app.py public /home/python"
	sh "sudo chown -R python:python /home/python"
	sh "sudo systemctl restart pyhton-systemd-http-server.service"
}

