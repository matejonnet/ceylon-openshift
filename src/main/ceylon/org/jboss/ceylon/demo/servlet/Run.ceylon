import javax.servlet.http { HttpServletRequest, HttpServletResponse }
import java.io { PrintWriter }

shared class Run() {
    shared void service(HttpServletRequest req, HttpServletResponse resp) {
        print("req = " + req.string);
        print("resp = " + resp.string);
        
        PrintWriter output = resp.writer;
        output.println("Hello World from ceylon.");
    }
}

