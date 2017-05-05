<?php

require_once '../php/dbconfig.php';

class USER
{

    private $conn;

    public function __construct()
    {
        $database = new Database();
        $db = $database->dbConnection();
        $this->conn = $db;
    }

    public function runQuery($sql)
    {
        $stmt = $this->conn->prepare($sql);
        return $stmt;
    }

    public function lastInsertId()
    {
        $stmt = $this->conn->lastInsertId();
        return $stmt;
    }

    // Register the a user with the given name, email, and password
    public function register($last_name, $first_name, $username, $password, $email)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO MCB_users(last_name, first_name, username, password, email_address) 
                                                VALUES(:last_name, :first_name, :username, :password, :email)");
            $stmt->bindparam(":last_name", $last_name);
            $stmt->bindparam(":first_name", $first_name);
            $stmt->bindparam(":username", $username);
            $stmt->bindparam(":password", sha1($password));
            $stmt->bindparam(":email", $email);
            $stmt->execute();
            return $stmt;
        } catch (PDOException $ex) {
            echo $ex->getMessage();
        }
    }

    public function login($email, $password)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM MCB_users WHERE email_address=:email");
            $stmt->execute(array(":email" => $email));
            $userRow = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($stmt->rowCount() == 1) {
                if(sha1($password) == $userRow['password']) {
                    $_SESSION['userSession'] = $userRow['user_id'];
                    $_SESSION['isAdmin'] = true; // Every user is an admin for this assignment
                    return true;
                } else {
                    header("Location: ../page/index.php?error");
                    exit;
                }
            } else {
                header("Location: ../page/index.php?error");
                exit;
            }
        } catch (PDOException $ex) {
            echo $ex->getMessage();
        }
    }


    public function is_logged_in()
    {
        if (isset($_SESSION['userSession'])) {
            return true;
        }
        return false;
    }

    public function is_admin()
    {
        if ($_SESSION['isAdmin'] != 0) {
            return true;
        }
    }

    public function redirect($url)
    {
        header("Location: $url");
    }

    public function logout()
    {
        session_destroy();
        $_SESSION['userSession'] = false;
        $_SESSION['isAdmin'] = false;

    }

    public function getInfo(){
        try {
            $stmt = $this->runQuery("SELECT * FROM MCB_users WHERE user_id = :uid");
            $stmt->execute([
                ":uid" => $_SESSION['userSession']
            ]);
            $user_info = $stmt->fetch(PDO::FETCH_ASSOC);
            return $user_info;
        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }
}