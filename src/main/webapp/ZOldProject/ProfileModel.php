<?php

class ProfileModel
{
    private $id;
    private $name;
    private $isActive;
    private $isStaff;
    private $isDeleted;
    private $createdAt;
    private $updatedAt;

    public function __construct($name, $isActive, $isStaff, $isDeleted, $createdAt, $updatedAt)
    {
        $this->name = $name;
        $this->isActive = $isActive;
        $this->isStaff = $isStaff;
        $this->isDeleted = $isDeleted;
        $this->createdAt = $createdAt;
        $this->updatedAt = $updatedAt;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getIsActive()
    {
        return $this->isActive;
    }

    public function setIsActive($isActive)
    {
        $this->isActive = $isActive;
    }

    public function getIsStaff()
    {
        return $this->isStaff;
    }

    public function setIsStaff($isStaff)
    {
        $this->isStaff = $isStaff;
    }

    public function getIsDeleted()
    {
        return $this->isDeleted;
    }

    public function setIsDeleted($isDeleted)
    {
        $this->isDeleted = $isDeleted;
    }

    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }

    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    }
}

