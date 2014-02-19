echo "Compile and Deploy Projects"
echo "S-RAMP username/password is in the custom settings.xml (can also be placed on the command line)"
echo "Deploy DTGov Default Workflow"
(cd installed/fsw/jboss-eap-6.1/dtgov-data; mvn -s /home/kpeeples/demos/fsw-simple-demo/support/settings.xml clean deploy)
echo "Copy the Orders Demo POM for Switchyard/DTGov/S-RAMP integration to the quickstart"
echo "Make backup copy of original POM"
cp -vf installed/fsw/jboss-eap-6.1/quickstarts/switchyard/demos/orders/pom.xml installed/fsw/jboss-eap-6.1/quickstarts/switchyard/demos/orders/backup-pom.xml
echo "Copy new POM which contains deploy to S-RAMP"
cp -vf support/orderdemo/pom.xml installed/fsw/jboss-eap-6.1/quickstarts/switchyard/demos/orders/pom.xml
echo "Install the Orders Demo"
(cd installed/fsw/jboss-eap-6.1/quickstarts/switchyard/demos/orders; mvn -s /home/kpeeples/demos/fsw-simple-demo/support/settings.xml -Pdemo -DskipTests=true clean deploy)
echo "Make the directory and link for the deployment folder"
mkdir -p /tmp/prod/jbossas7/standalone/deployments
# CHANGE the directory below to the correct deployment folder of your server
ln -sv /tmp/prod/jbossas7/standalone/deployments /home/kpeeples/demos/fsw-simple-demo/installed/fsw/jboss-eap-6.1/standalone/deployments
echo "Run Projects or run next step in guide"