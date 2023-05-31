<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>카카오로그인</title>
  </head>
  <body>
  <%
    String clientId = "a62d91d33f9d815c1fdabf8b81bfbad2";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "914860";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8090/KREBLE_KMK/callback2.jsp", "UTF-8");
    String apiURL = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code"
        + "&client_id=" + clientId
        + "&client_secret=" + clientSecret
        + "&redirect_uri=" + redirectURI
        + "&code=" + code
        + "&state=" + state;
    String accessToken = "";
    String refresh_token = "";
    try {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) { // 정상 호출
          br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
          br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuilder res = new StringBuilder();
        while ((inputLine = br.readLine()) != null) {
          res.append(inputLine);
        }
        br.close();
        if (responseCode == 200) {
          out.println(res.toString());
        }
      } catch (Exception e) {
        // Exception 로깅
      }
    session.setAttribute("stateok", state);
  %>
  <script>
  window.location.href = "http://localhost:8090/KREBLE_KMK/index.jsp"
  </script>
  </body>
</html>