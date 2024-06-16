<?php

class StudentEnrollmentModel
{
    private $id;
    private $studentId;
    private $courseId;
    private $enrollmentStatusId;
    private $isDeleted;
    private $createdAt;
    private $updatedAt;

    public function __construct($studentId, $courseId, $enrollmentStatusId, $isDeleted, $createdAt, $updatedAt)
    {
        $this->studentId = $studentId;
        $this->courseId = $courseId;
        $this->enrollmentStatusId = $enrollmentStatusId;
        $this->isDeleted = $isDeleted;
        $this->createdAt = $createdAt;
        $this->updatedAt = $updatedAt;
    }
}