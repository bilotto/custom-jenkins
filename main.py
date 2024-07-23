import os
import jenkins

# Read vars from ./env.profile
jenkins_url = os.getenv('JENKINS_URL')
username = os.getenv('JENKINS_USERNAME')
api_token = os.getenv('JENKINS_TOKEN') 


# Connect to Jenkins
try:
    server = jenkins.Jenkins(jenkins_url, username=username, password=api_token)
except jenkins.BadHTTPException as e:
    print('Failed to connect:', str(e))
except Exception as e:
    print('An error occurred:', str(e))

# try:
#     # Obter e imprimir a versão do Jenkins
#     version = server.get_version()
#     print('Versão do Jenkins:', version)
# except Exception as e:
#     print('An error occurred:', str(e))


# Get all installed plugins
plugins = server.get_plugins()
plugins_dict = dict()
for k, v in plugins.items():
    plugin_name = v['shortName']
    plugin_version = v['version']
    plugins_dict[plugin_name] = plugin_version

import json
# dump to plugins.json
with open('plugins.json', 'w') as f:
    json.dump(plugins_dict, f, indent=4)

# Need to dump in the format one per line plugin:version
with open('plugins_out.txt', 'w') as f:
    for k, v in plugins_dict.items():
        f.write(f'{k}:{v}\n')