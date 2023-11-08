# DB설계_중간고사정리

### mysqldump 명령어 사용법

MySQL Client 프로그램 실행 후 접속하지 않고 사용

**dump 명령어**

<aside>
💡 mysqldump -u root -p [DB이름] > [파일명]

</aside>

---

### 1. mariadb 기본 명령어

- DB 만들기
    
    <aside>
    💡 `create` `database` `**test_db;**`
    
    </aside>
    
- 사용자 계정 만들기
    
    <aside>
    💡 `create` `user` `**jimmy@localhost**` `**identified by** 'user1234';`
    
    </aside>
    
- 사용자에게 DB(테이블) 사용권 부여/회수하기
    
    <aside>
    💡 모든 권한
    `grant` `**all privileges` `on`** `test_db.*` `**to**` `jimmy@localhost;`
    조회 권한
    `grant` `**select**` `**on**` `test_db.*` `**to**` `jimmy@localhost;`
    회수
    `**revoke**` `all privileges` `**on**` `test_db.*` `**from**` `jimmy@localhost;`
    
    권한 종류
    - **usage** : 접속
    - **select** : 조회
    - **all privileges** : 모든 권한
    
    </aside>
    

---

### 2. SQL - 데이터 정의하기

- **CREATE** - 테이블 만들기
    
    <aside>
    💡 `**create` `table`** `테이블명;`
    `create` `**table**` `테이블명**(필드명 데이터타입, ...);**`
    
    </aside>
    
- **ALTER** - 테이블 변경하기
    1. 필드 추가하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**add` `(column)`** `필드명 데이터타입;`
        
        </aside>
        
    2. 필드 삭제하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**drop` `(column)`** `필드명;`
        
        </aside>
        
    3. 필드의 타입/null 허용여부 변경하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**modify` `(column)`** `필드명 데이터타입` `**(null/not null);**`
        
        </aside>
        
    4. 필드의 이름 변경하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**change` `(column)`** `필드명 **바꿀필드명**(데이터타입)` `**null**;`
        
        </aside>
        
    5. 기본키 삭제하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**drop` `primary key;`**
        
        </aside>
        
    6. 기본키 설정하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**add` `primary key(필드명);`**
        
        </aside>
        
    7. unique 설정 지우기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**drop` `index`** `필드명;`
        
        </aside>
        
    8. default 및 조건 변경하기
        
        <aside>
        💡 `**alter**` `**table**` `테이블명` `**modify`** `필드명 데이터타입` `**default**` `값` `**check(필드명 =>< 조건식);**`
        ** 같이 쓸 시 default가 check보다 먼저 와야 함*
        
        </aside>
        
- **DELETE** - 테이블 삭제하기
    
    <aside>
    💡 `**drop` `table`** `테이블명;`
    
    </aside>
    

---

### 3. SQL - 데이터 입력/수정/삭제하기

- 입력
    
    <aside>
    💡 **전체 입력**
    **`insert`** **`into`** `테이블명` `**values('100', '홍길동', null, 20, 'm', null);`
    일부 입력
    `insert`** **`into`** `테이블명**(필드명, 필드명, ...)**` `**values('100', '홍길동', 20, 'm');**`
    
    </aside>
    
- 수정
    
    <aside>
    💡 **`update`** `테이블명` `**set`** `필드명 = ‘변경’` **`where`** `id = ‘100’(검색조건);`
    
    </aside>
    
- 삭제
    
    <aside>
    💡 **`delete`** **`from`** `테이블명` **`where`** `id = ‘100’(검색조건);`
    
    </aside>
    
- sql_safe_updates
    1. 확인
        
        <aside>
        💡 `select` `**@@sql_safe_updates;**`
        
        </aside>
        
    2. 수정
        
        <aside>
        💡 `**set**` `**sql_safe_updates = 1;**`
        
        </aside>
        

---

### 4. SQL - 데이터 검색하기

- 데이터 조회
    
    <aside>
    💡 `**select**` `필드명(*), 필드명, ...` `**from**` `테이블명` (**`where`** `조건식`);
    `**from**` `테이블명` `**limit**` `0, 10`
    
    </aside>
    
- like

<aside>
💡 `where` `필드명` `**like**` `‘안녕**%**’`
`where` `필드명` `**like**` `‘안녕**_ _ _**’`

</aside>

- null
    
    <aside>
    💡 `where` `필드명` **`is`** `**null / not null`**
    `select` `**ifnull(필드명, 0)**` `as 임시필드명`
    
    </aside>
    
- 정렬
    
    <aside>
    💡 `order by` `필드명1` `desc`, `필드명2`;
    
    </aside>
    
- 날짜 내장함수
    
    <aside>
    💡 now() : 현재 연월일시간
    date() : 연월일
    year() : 연
    month() : 월
    day() : 일
    dayname() : 요일
    monthname() : 월 이름
    adddate(’1999-12-31’, interval 300 day) : 기준일로부터 300일 후
    subdate(’1999-12-31’, interval 300 day) : 기준일로부터 300일 전
    
    **hire_date <= adddate('1995-05-01', interval 100 day)
    and hire_date >= subdate('1995-05-01', interval 100 day)**
    
    </aside>
    
- 숫자 내장함수
    
    <aside>
    💡 round(salary/12, 2) : salary/12를 2째자리에서 반올림 (1째자리 까지)
    ceiling(숫자) : 올림
    floor(숫자) : 버림
    
    </aside>
    
- 문자 내장함수
    
    <aside>
    💡 **concat(first_name, last_name) as full_name** : 문자를 합쳐서 한 필드로
    lower() : 소문자로 변경
    upper() : 대문자로 변경
    substr(필드명, 1, (8)) : 1번째 문자부터 8개 (없으면 끝까지)
    
    **concat(substr(phone_number, 1, 8), '****')**
    
    </aside>
    
- 집계함수
    
    <aside>
    💡 count() : 레코드의 개수를 셈
    avg() : 평균값
    sum() : 숫자의 총합
    max() : 숫자 중에서 최대값
    min() :  숫자 중에서 최소값
    
    </aside>
    
    - group by
    
    <aside>
    💡 필드명대로 분류하여 묶어서 집계
    
    select **job_id**, count(*), avg(salary), sum(salary), max(salary),
    min(salary)
    
    from employees
    where hire_date ≥ ‘1999-01-01’
    **`group by`** **job_id**;
    
    </aside>
    
    - having
    
    <aside>
    💡 group by로 집계된 결과 중에서 또 다시 조건에 맞는 것만 출력
    
    select **job_id**, count(*), avg(salary), sum(salary), max(salary), min(salary)
    from employees
    **`group by`** **job_id**
    **`having`** count(*) >= 5;
    
    </aside>