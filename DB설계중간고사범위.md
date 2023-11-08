### DB설계중간고사범위

MySQL Client 프로그램 실행 후 접속하지 않고 사용

dump 명령어
> mysqldump -u root -p [DB이름] > [파일명]

---

### 1. mariadb 기본 명령어
   - DB 만들기
    > create database
    
    이름이 test

---

### 2. SQL - 데이터 정의하기
- 테이블 만들기
    > create table
 - 테이블 변경하기
    > alter table
    1. 필드 추가하기
    2. 필드 삭제하기
    3. 필드의 타입/null 허용여부 변경하기
    4. 필드의 이름 변경하기
    5. 기본키 삭제하기
    6. 기본키 설정하기
    7. unique 설정 지우기
    8. default 변경하기
 - 테이블 삭제하기

### 3. SQL - 데이터 입력/수정/삭제하기

### 4. SQL - 데이터 검색하기