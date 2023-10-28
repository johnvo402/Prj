<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html> 
    <head> 
        <title>  Tag Example</title> 
    </head> 
    <body> 
        <c:out value = "${'<tag> , &'}"/> 
    </body> 
</html>