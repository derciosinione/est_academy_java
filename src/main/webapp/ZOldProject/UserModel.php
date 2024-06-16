<?php

class UserModel
{
    public $id;
    public $name;
    public $username;
    public $email;
    private $nif;
    public $phoneNumber;
    public $avatarUrl;
    public $birthDay;
    public $profileId;
    public $profileName;
    public $isStaff;
    public $isActive;
    private $approvedStatus;
    private $isApproved;
    public $isDeleted;
    public $createdAt;
    public $updatedAt;
    private $passwordHash;

    /**
     * @param $id
     * @param $name
     * @param $email
     * @param $phoneNumber
     * @param $birthDay
     * @param $profileId
     */
    public function __construct($id = null, $name = null, $username = null,$email = null, $phoneNumber = null, $birthDay = null, $profileId = null)
    {
        $this->id = $id;
        $this->name = $name;
        $this->email = $email;
        $this->phoneNumber = $phoneNumber;
        $this->birthDay = $birthDay;
        $this->profileId = $profileId;
        $this->username = $username;
    }

    public function getNif()
    {
        return $this->nif;
    }

    public function setNif($nif)
    {
        $this->nif = empty($nif) ? "Não Informado" : $nif;
    }


    /**
     * @return mixed
     */
    public function getPasswordHash()
    {
        return $this->passwordHash;
    }

    /**
     * @param mixed $passwordHash
     */
    public function setPasswordHash($passwordHash)
    {
        $this->passwordHash = md5($passwordHash);
    }

    public function setId($id)
    {
        $this->id = $id;
    }


    public function setAvatarUrl($avatarUrl)
    {
        $this->avatarUrl = $avatarUrl;
    }


    public function setProfileName($profileName)
    {
        $this->profileName = $profileName;
    }

    public function setIsStaff($isStaff)
    {
        $this->isStaff = $isStaff;
    }

    public function setIsActive($isActive)
    {
        $this->isActive = $isActive;
    }

    public function getApprovedStatus()
    {
        return $this->approvedStatus;
    }

    public function getIsApproved()
    {
        return $this->isApproved;
    }

    public function setApprovedStatus($isApproved)
    {
        $this->isApproved = $isApproved;
        $this->approvedStatus = $isApproved ? 'Aprovado' : 'Aguardando aprovação';
    }



}