[jeus8@lms1:/webeng/jeus8/serverhome/kbilms/lms]$ cat session.jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=2.0; minimum-scale=1.0; user-scalable=yes;" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>?援듭?곗???</title>
</head>
<body style="margin: 10px 10px 50px 10px;">

<h3>?援듭?곗??? 李⑥?몃? ?듦由ъ??ㅽ??</h3>

<hr/>

<h4>Application Summary</h4>
<table border="1" cellpadding="3" cellspacing="1" width="1200" style="table-layout: fixed; word-break: break-all;">
        <colgroup>
                <col width="200"/>
                <col width="1000"/>
        </colgroup>
        <thead>
                <tr>
                        <th>Name</th>
                        <th>Value</th>
                </tr>
        </thead>
        <tbody>
                <tr>
                        <td>server info</td>
                        <td><%=  application.getServerInfo() %></td>
                </tr>
                <tr>
                        <td>servlet version</td>
                        <td><%=  application.getMajorVersion() %>.<%=  application.getMinorVersion() %></td>
                </tr>
                <tr>
                        <td>jsp version</td>
                        <td><%=  JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %></td>
                </tr>
                <tr>
                        <td>context path</td>
                        <td><%=  application.getContextPath() %></td>
                </tr>
        </tbody>
</table>

<hr/>

<h4>Application Attributes</h4>
<% Enumeration<?> anames = application.getAttributeNames(); %>
<table border="1" cellpadding="3" cellspacing="1" width="1200" style="table-layout: fixed; word-break: break-all;">
        <colgroup>
                <col width="200"/>
                <col width="500"/>
                <col width="500"/>
        </colgroup>
        <thead>
                <tr>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Class</th>
                </tr>
        </thead>
        <tbody>
                <% while(anames.hasMoreElements()) { %>
                <% String name = (String) anames.nextElement(); %>
                <% Object value = application.getAttribute(name); %>
                <% Class<?> clazz = application.getAttribute(name).getClass(); %>
                <tr>
                        <td><%=  name %></td>
                        <td><%=  value %></td>
                        <td><%=  clazz.getName() %></td>
                </tr>
                <% } %>
        </tbody>
</table>

<hr/>

<h4>Session Summary</h4>
<table border="1" cellpadding="3" cellspacing="1" width="1200" style="table-layout: fixed; word-break: break-all;">
        <colgroup>
                <col width="200"/>
                <col width="1000"/>
        </colgroup>
        <thead>
                <tr>
                        <th>Name</th>
                        <th>Value</th>
                </tr>
        </thead>
        <tbody>
                <tr>
                        <td>is new</td>
                        <td><%=  session.isNew() %></td>
                </tr>
                <tr>
                        <td>created time</td>
                        <td><%=  new SimpleDateFormat("yyyy.MM.dd HH:mm:ss.SSS (E)").format(new java.util.Date(session.getCreationTime())) %></td>
                </tr>
                <tr>
                        <td>identifier</td>
                        <td><%=  session.getId() %></td>
                </tr>
                <tr>
                        <td>last time</td>
                        <td><%=  new SimpleDateFormat("yyyy.MM.dd HH:mm:ss.SSS (E)").format(new java.util.Date(session.getLastAccessedTime())) %></td>
                </tr>
                <tr>
                        <td>max time interval</td>
                        <td><%=  session.getMaxInactiveInterval() %></td>
                </tr>
        </tbody>
</table>

<hr/>
<hr/>
<hr/>
<br/>
<br/>

<h4>Session Attributes</h4>
<% Enumeration<?> snames = session.getAttributeNames(); %>
<table border="1" cellpadding="3" cellspacing="1" width="1200" style="table-layout: fixed; word-break: break-all;">
        <colgroup>
                <col width="200"/>
                <col width="500"/>
                <col width="500"/>
        </colgroup>
        <thead>
                <tr>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Class</th>
                </tr>
        </thead>
        <tbody>
                <% while(snames.hasMoreElements()) { %>
                <% String name = (String) snames.nextElement(); %>
                <% Object value = session.getAttribute(name); %>
                <% Class<?> clazz = session.getAttribute(name).getClass(); %>
                <tr>
                        <td><%=  name %></td>
                        <td><%=  value %></td>
                        <td><%=  clazz.getName() %></td>
                </tr>
                <% } %>
        </tbody>
</table>

<hr/>

</body>
</html>