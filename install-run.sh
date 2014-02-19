echo "Running FSW Install Script"
java -jar distros/jboss-fsw-installer-6.0.0.GA-redhat-4.jar support/InstallationScript.xml
echo "Start Server"
installed/fsw/jboss-eap-6.1/bin/standalone.sh -c standalone.xml
