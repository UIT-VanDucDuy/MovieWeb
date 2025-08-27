<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="col-lg-2 pt-5">
    <div class="list-group" id="menu">
        <a href="${cpath}/admin/users"
           class="list-group-item list-group-item-action
                  ${fn:contains(uri,'/admin/users') ? 'active' : ''}">
            User Account
        </a>

        <a href="${cpath}/admin/movies"
           class="list-group-item list-group-item-action
                  ${fn:contains(uri,'/admin/movies') ? 'active' : ''}">
            Movies
        </a>

        <a href="${cpath}/admin/movieTypes"
           class="list-group-item list-group-item-action
                  ${fn:contains(uri,'/admin/movieTypes') ? 'active' : ''}">
            Movie Types
        </a>
    </div>
</div>