# Running Ceylon on OpenShift

Follow this instructions to run [Ceylon](http://ceylon-lang.org/) applications on OpenShift PaaS.

* [Register](https://openshift.redhat.com/app/account/new) for OpenShift
* Follow the [instructions](https://openshift.redhat.com/app/getting_started) to install client tools (step one)
* Create a domain (step two on the link above)

Create JBoss AS applications:

    rhc app create -t jbossas-7 -a myceylonapp
    
Use files from this github repo to add Ceylon runtime and required modules to JBoss AS.
Avoiding conflicts specify git options to prefer this repo content. 

    cd myceylonapp
    git remote add ceylon-openshift https://github.com/matejonnet/ceylon-openshift
    git pull -s recursive -X theirs ceylon-openshift master
    //TODO clean jboss as sample app

Push everithing to OpenShift:

    git push origin master
    
See the demo application in web browser \<your app name\>-\<your domain name\>.rhcloud.com

Try to modify demo application *src/main/ceylon/org/jboss/ceylon/demo/servlet/Run.ceylon.*

After code changes do a git commit and push to OpenShift:

    git commit -a -m"My changes to sample."
    git push origin master
   
Run.ceylon is the entry point for all request to your application. It must implement service method: 

    shared void service(HttpServletRequest req, HttpServletResponse resp) 

If you rename entry class it or move it to different package, 
you need to update configuration to point to your class. 
Entry point configuration *ceylon-main-module* and *ceylon-main-runnable* is located in *standalone.xml* under *.openshift/config*   

*Note! Servlet implmentatin is experimental and can be changed or even removed in the future.*
