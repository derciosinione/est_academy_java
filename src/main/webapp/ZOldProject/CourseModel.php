<?php

class CourseModel
{
    public $id;
    public $name;
    public $price;
    public $description;
    public $maxStudent;
    public $categoryId;
    public $creatorId;
    private $isActive;
    private $isDeleted;
    private $createdAt;
    private $updatedAt;
    private $creator;
    private $category;
    public $imageUrl;

    public function __construct(
        $id = null,
        $name = '',
        $price = 0,
        $description = '',
        $maxStudent = 0,
        $categoryId = null,
        $creatorId = null,
        $isActive = false,
        $isDeleted = false,
        $createdAt = null,
        $updatedAt = null,
        $creator = null,
        $category = null
    )
    {
        $this->id = $id;
        $this->name = $name;
        $this->price = $price;
        $this->description = $description;
        $this->maxStudent = $maxStudent;
        $this->categoryId = $categoryId;
        $this->creatorId = $creatorId;
        $this->isActive = $isActive;
        $this->isDeleted = $isDeleted;
        $this->createdAt = $createdAt;
        $this->updatedAt = $updatedAt;
        $this->creator = $creator;
        $this->category = $category;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }

    public function getIsActive()
    {
        return $this->isActive;
    }

    public function setIsActive($isActive)
    {
        $this->isActive = $isActive;
    }


    public function getIsDeleted()
    {
        return $this->isDeleted;
    }

    public function setIsDeleted($isDeleted)
    {
        $this->isDeleted = $isDeleted;
    }

    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    }


    /**
     * @param UserModel $creator
     */
    public function setCreator($creator)
    {
        $this->creator = $creator;
    }

    /**
     * @param CategoryModel $category
     */
    public function setCategory($category)
    {
        $this->category = $category;
    }

    /**
     * @return UserModel
     */
    public function getCreator()
    {
        return $this->creator;
    }

    /**
     * @return CategoryModel
     */
    public function getCategory()
    {
        return $this->category;
    }

}