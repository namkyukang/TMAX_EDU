<%@ page import="java.util.Date" %>
<%
    int sleepTime = 30000; // 30초

    Date start = new Date();
    out.println("Start time: " + start + "<br>");
    out.println("Sleeping for " + (sleepTime / 1000) + " seconds...<br>");
    out.flush();

    try {
        Thread.sleep(sleepTime);
    } catch (InterruptedException e) {
        out.println("Sleep interrupted: " + e.getMessage());
    }

    Date end = new Date();
    out.println("End time: " + end + "<br>");
%>
