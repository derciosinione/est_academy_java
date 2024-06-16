<?php


interface UserInterface
{
    public function login($email, $password);
    public function logOut();
    public function changePassword($email, $currentPassword, $password, $confirmPassword);
    public function getUserById($userId);
    public function getUserByEmail($email);
    public function getAllUserStaff();
    public function getAllStudents();
    public function getAllInstructors();
    public function getAllAdmin();
    public function getAllUserByProfile($profileId);
    public function createUser($name, $email, $nif, $birthDay, $phoneNumber, $password, $profileId, $avatarUrl);
    public function createStudent($name, $email, $nif, $birthDay, $phoneNumber, $password, $avatarUrl);
    public function updateUserInfo($id, $name, $email, $nif, $phoneNumber, $profileId, $birthDay);
    public function deleteUser($id);
}