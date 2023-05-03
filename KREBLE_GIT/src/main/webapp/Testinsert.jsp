<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
  String date = request.getParameter("date");
	out.print(date);
  try {
    // MySQL 데이터베이스 접속 정보 설정
    String url = "jdbc:mysql://localhost:3306/kreble";
    String user = "root";
    String password = "tmd514107";
    // JDBC 드라이버 로드
    Class.forName("com.mysql.jdbc.Driver");
    // 데이터베이스 연결
    Connection conn = DriverManager.getConnection(url, user, password);
    // SQL 쿼리 실행
    String query = "INSERT INTO test (rent_date) VALUES (?)";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, date);
    pstmt.executeUpdate();
    // 연결 종료
    pstmt.close();
    conn.close();
    out.print("Data inserted successfully!");
  } catch (Exception e) {
    out.print("Error: " + e.getMessage());
  }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
</body>
</html>