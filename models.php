<?php
require_once 'config.php';

class BookSystem extends Database {
    // --- AUTHENTICATION ---
    public function login($user, $pass) {
        $u = $this->conn->real_escape_string($user);
        $p = $this->conn->real_escape_string($pass);
        $sql = "SELECT * FROM users WHERE username = '$u' AND password = '$p'";
        $res = $this->conn->query($sql);
        return ($res) ? $res->fetch_assoc() : null;
    }

    // --- BOOK MANAGEMENT (CRUD) ---
    public function getBooks($search = '', $cat = '') {
        $s = $this->conn->real_escape_string($search);
        $sql = "SELECT * FROM books WHERE title LIKE '%$s%' OR author LIKE '%$s%'";
        if ($cat != '' && $cat != 'All') {
            $sql .= " AND category = '$cat'";
        }
        return $this->conn->query($sql);
    }

    public function addBook($t, $a, $c, $img = 'default.jpg') {
        $title = $this->conn->real_escape_string($t);
        $auth = $this->conn->real_escape_string($a);
        $sql = "INSERT INTO books (title, author, category, image) VALUES ('$title', '$auth', '$c', '$img')";
        return $this->conn->query($sql);
    }

    public function updateBook($id, $t, $a, $c, $img) {
        $id = (int)$id;
        $title = $this->conn->real_escape_string($t);
        $auth = $this->conn->real_escape_string($a);
        $sql = "UPDATE books SET title='$title', author='$auth', category='$c', image='$img' WHERE id=$id";
        return $this->conn->query($sql);
    }

    public function deleteBook($id) {
        $id = (int)$id;
        return $this->conn->query("DELETE FROM books WHERE id = $id");
    }

    // --- LOAN SYSTEM (BORROW & RETURN) ---
    public function borrowBook($userId, $bookId) {
        $uid = (int)$userId;
        $bid = (int)$bookId;
        $loan_date = date('Y-m-d');
        $due_date = date('Y-m-d', strtotime('+7 days'));
        $sql = "INSERT INTO loans (user_id, book_id, loan_date, due_date, status) 
                VALUES ($uid, $bid, '$loan_date', '$due_date', 'Borrowed')";
        return $this->conn->query($sql);
    }

    public function returnBook($loanId) {
        $lid = (int)$loanId;
        $sql = "UPDATE loans SET status = 'Returned' WHERE id = $lid";
        return $this->conn->query($sql);
    }

    public function getHistory($userId) {
        $uid = (int)$userId;
        $sql = "SELECT l.id as loan_id, b.title, l.loan_date, l.due_date, l.status 
                FROM loans l 
                JOIN books b ON l.book_id = b.id 
                WHERE l.user_id = $uid 
                ORDER BY l.id DESC";
        return $this->conn->query($sql);
    }
}