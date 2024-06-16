<?php

class EnrollmentStatusModel
{
    private $id;
    private $name;
    private $isActive;
    private $isDeleted;
    private $createdAt;
    private $updatedAt;
    private $creatorId;

    public function __construct($name, $isActive, $isDeleted, $createdAt, $updatedAt, $creatorId)
    {
        $this->name = $name;
        $this->isActive = $isActive;
        $this->isDeleted = $isDeleted;
        $this->createdAt = $createdAt;
        $this->updatedAt = $updatedAt;
        $this->creatorId = $creatorId;
    }

}