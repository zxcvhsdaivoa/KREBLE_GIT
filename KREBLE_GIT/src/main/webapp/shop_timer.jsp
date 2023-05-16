<%@ page import="java.time.LocalDateTime, java.time.Duration, java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/plain; charset=UTF-8" %>

<%
request.setCharacterEncoding("UTF-8");

LocalDateTime now = LocalDateTime.now();
LocalDateTime targetTime = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), 18, 0);
// 특정 시간 (15:00) 설정

if (now.isAfter(targetTime)) {
    targetTime = targetTime.plusDays(1); // 다음날 13:00으로 설정
}

Duration remainingDuration = Duration.between(now, targetTime);

long remainingSeconds = remainingDuration.getSeconds();
long hours = remainingSeconds / 3600;
long minutes = (remainingSeconds % 3600) / 60;
long seconds = remainingSeconds % 60;

DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
String formattedTime = String.format("%02d:%02d:%02d", hours, minutes, seconds);

out.print(formattedTime);
%>
