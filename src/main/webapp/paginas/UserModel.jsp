<%@page import="java.util.Date" %>
<%@page import="java.io.Serializable" %>

<%
    class UserModel implements Serializable {

        public int id;
        public String name;
        public String username;
        public String email;
        private String nif;
        public String phoneNumber;
        public String avatarUrl;
        public String birthDay;
        public int profileId;
        public String profileName;
        public boolean isStaff;
        public boolean isActive;
        private String approvedStatus;
        private boolean isApproved;
        public boolean isDeleted;
        public String createdAt;
        public String updatedAt;
        private String passwordHash;

        // Constructors
        public UserModel() {
        }

        public String getNif() {
            return nif == null ? "" : nif;
        }

    }
%>