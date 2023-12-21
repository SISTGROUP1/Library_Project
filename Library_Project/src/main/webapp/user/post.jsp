<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserDAO dao=UserDAO.newInstance();
	List<ZipcodeVO> list=null;
	request.setCharacterEncoding("UTF-8");
	String dong=request.getParameter("dong");
	if(dong!=null)
	{
		list=dao.postFind(dong);
		request.setAttribute("list", list);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'><link rel="stylesheet" href="../etc/user/userjoinstyle.css">
<script type="text/javascript">
function ok(zip,addr)
{
	opener.post1.value=zip
	opener.addr1.value=addr
	self.close()
}
</script>
</head>
<body>
  <div class="container">
    <h3 class="text-center">우편번호 검색</h3>
    <hr>
    <div class="row">
    <form method=post action="post.jsp">
      <table class="table">
        <tr>
          <td width="80%">
            <input type="text" name="dong" placeholder="동/읍/면을 입력하세요" id="dong">
          </td>
          <td width="20%">
            <input type="submit" value="검색" style="cursor:pointer;">
          </td>
        </tr>
      </table>
    </form>
    </div>
    <div style="height:10px"></div>
    <div class="row">
      <c:if test="${list!=null }">
        <table class="table">
          <tr>
            <th width="30%" class="text-center">우편번호</th>
            <th width="70%" class="text-center">주소</th>
          </tr>
          <hr>
          <c:forEach var="vo" items="${list }">
            <tr>
              <td width=25%>${vo.zipcode }</td>
              <td width=75%><a href="javascript:ok('${vo.zipcode }','${vo.address }')" style="text-decoration:none; color:black">${vo.address }</a></td>
            </tr>
          </c:forEach>
        </table>
      </c:if>
    </div>
  </div>
</body>
</html>