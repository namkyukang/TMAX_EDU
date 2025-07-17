<%@ page import="java.util.*, java.io.*" %>
<%
    Object sharedLock = application.getAttribute("sharedLock");

    if (sharedLock == null) {
        synchronized (application) {
            sharedLock = application.getAttribute("sharedLock");
            if (sharedLock == null) {
                sharedLock = new Object();
                application.setAttribute("sharedLock", sharedLock);
            }
        }
    }

    synchronized (sharedLock) {
        out.println("Thread: " + Thread.currentThread().getName() + " has acquired the lock.");
        try {
            Thread.sleep(60000); // 60초 동안 sleep
        } catch (InterruptedException e) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            out.println("<pre>" + sw.toString() + "</pre>");
        }
    }
%>
