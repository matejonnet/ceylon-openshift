Module module {
    name='org.jboss.ceylon.demo.servlet';
    version='1.0.0-SNAPSHOT';
    dependencies = {
       Import {
           name = 'javax.servlet.api';
           version = 'main';
           optional = false;
           export = false;
       }
    };
}