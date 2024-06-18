<%@page import="java.util.regex.Matcher" %>
<%@page import="java.util.regex.Pattern" %>
<%@page import="java.security.MessageDigest" %>
<%@page import="java.security.NoSuchAlgorithmException" %>
<%@page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<%!
    public String toHexString(byte[] hash) {
        BigInteger number = new BigInteger(1, hash);
        StringBuilder hexString = new StringBuilder(number.toString(16));
        while (hexString.length() < 32) {
            hexString.insert(0, '0');
        }
        return hexString.toString();
    }

    // Function to hash a string using MD5
    public String getMD5(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] hash = md.digest(input.getBytes());
        return toHexString(hash);
    }

    public static boolean isValidDateFormat(String dateString) {
        // Define the regex pattern for YYYY-MM-DD or YYYY/MM/DD
        String regex = "^\\d{4}[-/]\\d{2}[-/]\\d{2}$";

        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(dateString);
        return matcher.matches();
    }


    public static String getOrderBy(String alias) {
        return String.format(" ORDER BY %s.CreatedAt DESC ", alias, alias);
    }

    public static String getQueryLimit(int limit) {
        return " LIMIT " + limit;
    }

%>