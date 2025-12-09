Q1
CREATE TABLE departments (
     department_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     name VARCHAR(20) NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY (department_id)
     );

Q2
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED NULL AFTER email;

Q3
INSERT INTO departments (name)
     VALUES
       ('営業'),
       ('開発'),
       ('経理'),
       ('人事'),
      ('情報システム');

INSERT INTO people  
            (name, department_id)
     VALUES("レオ",1)
     ;
INSERT INTO people  
            (name, department_id)
     VALUES("アミ",1)
     ;
INSERT INTO people  
            (name, department_id)
     VALUES("ケイ",1)
     ;
INSERT INTO people  
            (name, department_id)
     VALUES("リオ",2)
     ;
 INSERT INTO people  
            (name, department_id)
     VALUES("トム",2)
     ;
 INSERT INTO people  
            (name, department_id)
     VALUES("ユウ",2)
     ;
 INSERT INTO people  
            (name, department_id)
     VALUES("ケン",2)
     ;    
INSERT INTO people  
            (name, department_id)
     VALUES("ハル",3)
     ;
INSERT INTO people  
            (name, department_id)
     VALUES("エマ",4)
     ;    
INSERT INTO people  
            (name, department_id)
     VALUES("カイ",5)
     ;


INSERT INTO reports (person_id, content, created_at, updated_at)
    VALUES
      (1, 'バックエンド学習を進めました', NOW(), NOW()),
      (2, 'フロント実装の練習をしました', NOW(), NOW()),
      (3, 'データベース設計を復習しました', NOW(), NOW()),
      (4, 'Gitの操作とブランチ管理を学習', NOW(), NOW()),
      (5, 'HTMLの細かいタグについて学習', NOW(), NOW()),
      (6, 'CSSレイアウトの調整を行いました', NOW(), NOW()),
      (7, 'JavaScript基礎文法を重点的に学習', NOW(), NOW()),
      (8, 'PC基礎操作の演習を行いました', NOW(), NOW()),
      (9, 'DBレッスンでSQLを練習しました', NOW(), NOW()),
      (10, 'IT基礎の重要ポイントを整理した', NOW(), NOW())
    ;

Q4
UPDATE people
     SET department_id = 1
     WHERE department_id IS NULL;

Q5
SELECT name,age FROM people WHERE gender="1" ORDER BY age DESC;

Q6
-- peopleテーブルの中からdepartment_idが1のレコードだけ対象にして、name,email,ageのカラムの値を取り出してcreated_adカラムの順番で並べて表示する

Q7
SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)   -- 20代の女性
   OR (age BETWEEN 40 AND 49 AND gender = 1)   -- 40代の男性
ORDER BY gender, age;

Q8
SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;

Q9
SELECT AVG(age) AS avg_age
FROM people
WHERE department_id = 2
  AND gender = 2;

Q10
SELECT 
    people.name,
    departments.name AS department_name,
    reports.content
FROM people
INNER JOIN departments
    ON people.department_id = departments.department_id
INNER JOIN reports
    ON people.person_id = reports.person_id;

Q11
SELECT 
    people.name
FROM people
LEFT JOIN reports
    ON people.person_id = reports.person_id
WHERE reports.person_id IS NULL;
