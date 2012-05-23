# Running Ceylon on OpenShift

Follow this instructions to run [Ceylon](http://ceylon-lang.org/) applications on OpenShift PaaS.

1. [Register](https://openshift.redhat.com/app/account/new) for OpenShift
1. Follow the [instructions](https://openshift.redhat.com/app/getting_started) to install client tools (step one)
1. Create a domain (step two on the link above)

1. Create JBoss AS applications:

        rhc app create -t jbossas-7 -a myceylonapp

1. Optionaly you can remove OpenShift sample applications

        cd myceylonapp
        rm -r src/main/webapp/*
    
1. Use files from this github repo to add Ceylon runtime and required modules to JBoss AS.
Avoiding conflicts specify git options to prefer this repo content. 

        cd myceylonapp (if you are not here yet)
        git remote add ceylon-openshift https://github.com/matejonnet/ceylon-openshift
        git pull -s recursive -X theirs ceylon-openshift master

1. Push everithing to OpenShift:

        git push origin master

1. See a demo application in a web browser at \<your app name\>-\<your domain name\>.rhcloud.com.

1. Try to modify demo application *src/main/ceylon/org/jboss/ceylon/demo/servlet/Run.ceylon.*

After code changes do a git commit and push to OpenShift:

        git commit -a -m"My changes to sample."
        git push origin master
   
Run.ceylon is an entry point for all request to your application, it must implement service method: 

        shared void service(HttpServletRequest req, HttpServletResponse resp) 

If you rename entry class or move it to different package, 
you need to update configuration to point to your class.

Entry point configuration *ceylon-main-module* and *ceylon-main-runnable* is located in *standalone.xml* under *.openshift/config*   

*Note! Servlet implmentation is experimental and can be changed or even removed in the future.*
