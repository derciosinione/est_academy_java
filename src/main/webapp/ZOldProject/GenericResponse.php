<?php

class GenericResponse
{
    public $result;
    public $success;
    public $errorMessage;

    /**
     * @param $result
     * @param $success
     * @param $errorMessage
     */
    public function __construct($result, $success, $errorMessage=null)
    {
        $this->result = $result;
        $this->success = $success;
        $this->errorMessage = $errorMessage;
    }

}