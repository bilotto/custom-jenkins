# curl -u $JENKINS_USERNAME:$JENKINS_TOKEN $JENKINS_URL/api/json

rm jenkins-cli.jar*
wget ${JENKINS_URL}/jnlpJars/jenkins-cli.jar

# java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD groovy ./scripts/generateToken.groovy
# java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin <nome-do-plugin>

ALL_PLUGINS=$(cat plugins_out.txt)
for plugin in $ALL_PLUGINS; do
    echo "Installing $plugin"
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin $plugin
    # sleep 1
done

java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD safe-restart


# java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD groovy = < get-plugins-info.groovy
