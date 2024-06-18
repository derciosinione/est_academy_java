<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
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

    public String convertToMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
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

    public List<String> userValidator(String name, String email, String phoneNumber, String nif) {
        List<String> errors = new ArrayList<>();

        if (name == null || name.isEmpty()) {
            errors.add("O nome é um campo obrigatorio");
        }

        if (email == null || email.isEmpty()) {
            errors.add("O email é um campo obrigatorio");
        }

        if (phoneNumber == null || phoneNumber.isEmpty()) {
            errors.add("O telefone é um campo obrigatorio");
        }

        if (nif == null || nif.isEmpty()) {
            errors.add("O NIF é um campo obrigatorio");
        }

        return errors;
    }

%>