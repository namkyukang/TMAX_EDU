<%@ page import="java.util.*" %>
<%
    List<byte[]> memoryHog = new ArrayList<>();
    int counter = 0;

    try {
        while (true) {
            memoryHog.add(new byte[1024 * 1024]); // 1MB씩 증가
            counter++;
            out.println("Allocated " + counter + " MB<br>");
        }
    } catch (OutOfMemoryError e) {
        out.println("<br><b>OOM 발생!</b><br>");
        out.println(e.getMessage());
    }
%>
