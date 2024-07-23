
TOKEN="11ce160cb6afaef141faa9391eeec5aeca"

JENKINS_URL=http://172.18.159.22:30095
USERNAME=user
PASSWORD=121416

curl -u $USERNAME:$TOKEN $JENKINS_URL/api/json

wget ${JENKINS_URL}/jnlpJars/jenkins-cli.jar

java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$PASSWORD groovy ./scripts/generateToken.groovy



java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$PASSWORD install-plugin <nome-do-plugin>

while read plugin; do
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$PASSWORD install-plugin $plugin
done < plugins.txt

java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$PASSWORD safe-restart


java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$PASSWORD groovy = < get-plugins-info.groovy
