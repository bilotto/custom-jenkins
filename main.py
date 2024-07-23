import os
import jenkins

# Replace these with your Jenkins instance details
jenkins_url= 'http://172.18.159.22:30095'
username= 'user'
api_token= '11ce160cb6afaef141faa9391eeec5aeca'

# Connect to Jenkins
try:
    server = jenkins.Jenkins(jenkins_url, username=username, password=api_token)
except jenkins.BadHTTPException as e:
    print('Failed to connect:', str(e))
except Exception as e:
    print('An error occurred:', str(e))

try:
    # Obter e imprimir a versão do Jenkins
    version = server.get_version()
    print('Versão do Jenkins:', version)
except Exception as e:
    print('An error occurred:', str(e))


# Get all installed plugins
plugins = server.get_plugins()
print(plugins)

