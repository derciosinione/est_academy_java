<?php

use basedados\DbContext;

require_once __DIR__ . '/CourseInterface.php';
require_once __DIR__ . '/UserInterface.php';
require_once __DIR__ . '/CategoryModel.php';
require_once __DIR__ . '/UserModel.php';
require_once __DIR__ . '/RegistrationModel.php';
require_once __DIR__ . '/CourseModel.php';
require_once __DIR__ . '/GenericResponse.php';
require_once __DIR__ . '/../basedados/basedados.h';
require_once __DIR__ . '/Constants.php';

include_once 'Utils.php';


class CourseService implements CourseInterface
{
    private $db;

    public function __construct()
    {
        $this->db = new DbContext();
    }

    public function getDefaultSqlQuery(): string
    {
        return /** @lang text */ "
            SELECT 
                   c.Id,
                   c.Name,
                   ct.Name Category,
                   c.Price,
                   c.Description,
                   c.MaxStudent,
                   c.CreatorId,
                   c.CategoryId,
                   u.Name CreatorName,
                   c.ImageUrl,
                   c.IsActive,
                   c.CreatedAt
            FROM Courses c
            JOIN Categories ct ON c.CategoryId = ct.Id
            JOIN Users u on c.CreatorId = u.Id
            WHERE 1=1
            AND !c.IsDeleted ";
    }

    /**
     * @return CourseModel[]
     */
    public function getAll()
    {
        $query = $this->getDefaultSqlQuery() . $this->db->getOrderBy("c") . $this->db->getQueryLimit(8);

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) return null;

        $courses = [];

        while ($row = $result->fetch_assoc()) {
            $courses [] = $this->courseInstance($row);
        }

        return $courses;
    }

    /**
     * @param $categoryId
     * @return CategoryModel[]
     */
    public function getAllByCategory($categoryId)
    {
        $query = $this->getDefaultSqlQuery() . " AND c.CategoryId=$categoryId " . $this->db->getOrderBy("c");

        $data = $this->db->executeSqlQuery($query);

        if ($data == null) return null;

        $courses = [];

        while ($row = $data->fetch_assoc()) {
            $courses[] = $this->courseInstance($row);;
        }

        return $courses;
    }

    /**
     * @param $id
     * @return CourseModel
     */
    public function getById($id)
    {
        $query = $this->getDefaultSqlQuery() . " AND c.Id=$id ";

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) return null;

        $row = $result->fetch_assoc();

        if ($row==null) return null;

        return $this->courseInstance($row);
    }

    /**
     * @param $creatorId
     * @param $name
     * @param $categoryId
     * @param $price
     * @param $description
     * @param $maxStudent
     * @param $imageUrl
     * @return GenericResponse
     */
    public function create($creatorId, $name, $categoryId, $price, $description, $maxStudent, $imageUrl): GenericResponse
    {
        $query = sprintf("INSERT INTO Courses (
                     Name,
                     CategoryId, 
                     Price,
                     Description, 
                     CreatorId, 
                     ImageUrl,
                     IsActive 
                     ) VALUES
            ('%s', '%s', '%s', '%s', '%s', '%s', '%s')",
            $name, $categoryId, $price, $description, $creatorId,
            $imageUrl, true);

        $courseId = $this->db->executeInsertQuery($query);

        if ($courseId == null || $courseId == 0) {
            return new GenericResponse(0, false, "Não foi possivel criar o curso, tente novamente!");
        }

        return new GenericResponse($courseId, true);
    }

    /**
     * @param $id
     * @param $creatorId
     * @param $name
     * @param $categoryId
     * @param $price
     * @param $description
     * @param $maxStudent
     * @param $imageUrl
     * @return GenericResponse
     */
    public function update($id, $creatorId, $name, $categoryId, $price, $description, $maxStudent, $imageUrl): GenericResponse
    {
        $query = sprintf("UPDATE Courses SET
                     CreatorId = %d,
                     Name = '%s',
                     CategoryId = %d,
                     Price = %f,
                     Description = '%s',
                     MaxStudent = %d,
                     ImageUrl = '%s'
                  WHERE Id = %d",
            $creatorId, $name, $categoryId, $price, $description, $maxStudent, $imageUrl, $id);

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) {
            return new GenericResponse(0, false, "Não foi possivel atualizar o curso, tente novamente!");
        }

        return new GenericResponse($id, true);
    }

    /**
     * @param array $row
     * @return CourseModel
     */
    private function courseInstance(array $row): CourseModel
    {
        $course = new CourseModel();
        $course->setId($row["Id"]);
        $course->setIsActive($row["IsActive"]);
        $course->setCreatedAt($row["CreatedAt"]);
        $course->name = $row["Name"];
        $course->price = $row["Price"];
        $course->description = $row["Description"];
        $course->maxStudent = $row["MaxStudent"];
        $course->categoryId = $row["CategoryId"];
        $course->creatorId = $row["CreatorId"];
        $course->imageUrl = $row["ImageUrl"];

        $creator = new UserModel($row["Id"], $row["CreatorName"]);
        $course->setCreator($creator);

        $category = new CategoryModel($row["Id"], $row["Category"]);
        $course->setCategory($category);
        return $course;
    }

    /**
     * @param $id
     * @param UserModel $loggedUser
     * @return mixed
     */
    public function delete($id, $loggedUser)
    {
        $course = $this->getById($id);
        if ($course == null) {
            return new GenericResponse(0, false, "Curso não foi encontrado!");
        }

        if ($loggedUser->profileName != Constants::$adminId && $loggedUser->id != $course->creatorId) {
            return new GenericResponse(0, false, "Não tens permisao para eliminar o curso!");
        }

        $totalStudents = $this->getTotalStudent($id);

        if ($totalStudents > 0){
            return new GenericResponse(0, false, "Este curso não pode ser eliminado porque tem $totalStudents alunos inscritos!");
        }

        $query = sprintf("DELETE FROM Courses WHERE Id = %d", $id);

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) {
            return new GenericResponse(0, false, "Não foi possivel eliminar o curso pretendido, tente novamente!");
        }

        return new GenericResponse($id, true);

    }

    /**
     * @param $courseId
     * @return mixed
     */
    public function getTotalStudent($courseId)
    {
        $query = /** @lang text */ "
            SELECT 
                  COUNT(Id) TotalStudent
              FROM StudentEnrollments
            WHERE CourseId = $courseId";

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) return null;

        $row = $result->fetch_assoc();

        if ($row==null) return null;

        return $row["TotalStudent"];
    }

    /**
     * @return array|null
     */
    public function getAllStudentRegistrations()
    {
        $loggedUser = getLoggedUser();

        if ($loggedUser == null) return null;

        $defaultQuery = /** @lang text */ "
            SELECT SE.Id,
               U.Name StudentName,
               U.Email,
               U.AvatarUrl,
               C.Name Course,
               ES.Name Status,
               SE.EnrollmentsStatusId,
               SE.CreatedAt
            FROM StudentEnrollments SE
                JOIN Users U ON SE.StudentId = U.Id
                JOIN Courses C ON SE.CourseId = C.Id
                JOIN EnrollmentsStatus ES ON SE.EnrollmentsStatusId = ES.Id
            WHERE 1=1
                AND !SE.IsDeleted ";

        $endQuery = $this->db->getOrderBy("SE") . $this->db->getQueryLimit(10);

        switch ($loggedUser->profileId){
            case Constants::$student:
                $query = $defaultQuery . " AND SE.StudentId=$loggedUser->id " . $endQuery;
                break;
            case Constants::$instructor:
                $query = $defaultQuery . " AND C.CreatorId=$loggedUser->id " . $endQuery;
                break;
            default:
                $query = $defaultQuery . $endQuery;
        }

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) return null;

        $registrations = [];

        while ($row = $result->fetch_assoc()) {
            $registrations [] = $this->registrationsInstance($row);
        }

        return $registrations;
    }


    /**
     * @param array $row
     * @return RegistrationModel
     */
    private function registrationsInstance(array $row): RegistrationModel
    {
        $data = new RegistrationModel();
        $data->id = $row["Id"];
        $data->studentName = $row["StudentName"];
        $data->email = $row["Email"];
        $data->avatarUrl = $row["AvatarUrl"];
        $data->course = $row["Course"];
        $data->status = $row["Status"];
        $data->enrollmentsStatusId = $row["EnrollmentsStatusId"];
        $data->setCreatedAt($row["CreatedAt"]);

        return $data;
    }

    /**
     * @param $id
     * @return GenericResponse
     */
    public function approveRegistration($id): GenericResponse
    {
        return $this->updateRegistrationStatus($id, EnrollmentsStatus::$approved);
    }

    /**
     * @param $id
     * @return GenericResponse
     */
    public function refuseRegistration($id): GenericResponse
    {
        return $this->updateRegistrationStatus($id, EnrollmentsStatus::$Refused);
    }

    /**
     * @param $id
     * @param $enrollmentsStatusId
     * @return GenericResponse
     */
    private function updateRegistrationStatus($id, $enrollmentsStatusId): GenericResponse
    {
        $loggedUser = getLoggedUser();

        if ($loggedUser == null)
            return new GenericResponse(0, false, "Inicia sessão para continuar com a operação!");

        $query = sprintf("UPDATE StudentEnrollments SET 
                              EnrollmentsStatusId = %d 
                          WHERE Id = %d", $enrollmentsStatusId, $id);

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) {
            return new GenericResponse(0, false, "Não foi possivel aprovar a inscrição, tente novamente!");
        }

        return new GenericResponse($id, true);
    }

    /**
     * @param $id
     * @return GenericResponse
     */
    public function deleteRegistration($id): GenericResponse
    {
        $loggedUser = getLoggedUser();

        if ($loggedUser == null)
            return new GenericResponse(0, false, "Inicia sessão para continuar com a operação!");

        $query = sprintf("UPDATE StudentEnrollments SET IsDeleted = %d 
                          WHERE Id = %d", 1, $id);

        $result = $this->db->executeSqlQuery($query);

        if ($result == null) {
            return new GenericResponse(0, false, "Não foi possivel aprovar a inscrição, tente novamente!");
        }

        return new GenericResponse($id, true);
    }
}