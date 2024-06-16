<?php

interface CourseInterface
{
    public function getAll();
    public function getAllStudentRegistrations();
    public function getById($id);

    public function getAllByCategory($categoryId);
    public function getTotalStudent($courseId);
    public function create($creatorId, $name, $categoryId, $price, $description, $maxStudent, $imageUrl);

    public function update($id, $creatorId, $name, $categoryId, $price, $description, $maxStudent, $imageUrl);
    public function delete($id, $loggedUser);
    public function approveRegistration($id);
    public function refuseRegistration($id);
    public function deleteRegistration($id);
}