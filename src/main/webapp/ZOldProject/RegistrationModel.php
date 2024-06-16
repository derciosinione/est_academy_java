<?php

class RegistrationModel
{
    public $id;
    public $studentName;
    public $email;
    public $description;
    public $avatarUrl;
    public $course;
    public $status;
    public $enrollmentsStatusId;
    private $createdAt;

//    /**
//     * @param $id
//     * @param $name
//     * @param $email
//     * @param $description
//     * @param $avatarUrl
//     * @param $course
//     * @param $status
//     * @param $createdAt
//     */
//    public function __construct($id, $name, $email, $description, $avatarUrl, $course, $status, $createdAt)
//    {
//        $this->id = $id;
//        $this->name = $name;
//        $this->email = $email;
//        $this->description = $description;
//        $this->avatarUrl = $avatarUrl;
//        $this->course = $course;
//        $this->status = $status;
//        $this->createdAt = $createdAt;
//    }

    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }


}