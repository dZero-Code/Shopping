# 필요한거 정리
## 개념 및 구조
### 1. package 구성
  - 기능/역할별 사용 고려
  - resource (css, js) 등 폴더 구성 필요
  
### 2. dto와 vo 개념
  - dto : data transfer object
  - vo : value object

### 3. 관리자 페이지와 사용자 페이지 나누기
  - 보안상 나누고 aop를 이용해 접근 제한

### 4. 관리자 기능
  - 리스트나 테이블 형식 고려 (검색기능 추가)

### 5. 데이터 속성
  - ex) data-setbg

### 6. jquery DOM
  - next(), prev() < find(), sibling(), closest() < ?
  - jquery < Vue (가상 DOM 생성을 통한 값 연동 고려) < ?

## plug-in & library
### 1. lombok 
  - setter & getter & constractor
  
### 2. 타임리프
  - JSP -> Thymeleaf
  
### 3. 유효성검사(front-end -> back-end)
  - @Validate, @Valid

### 4. 메시지 국제화
  - messages.properties

## DB
### 1. db.properties에 존재하는 DB 정보 암호화

### 2. conection fool -> hikari

### 3. MyBatis와 JPA 함께 사용하는법 알아보기
  - 간단한 crud : JPA
  - 복잡한 r : MyBatis ?)  

### 4. Database 구성
 - 등록일 속성 추가
 - 탈퇴 및 삭제시 delete가 아닌 속성 변경으로 대처
 - color, size, category, photo 등은 옵션 테이블 따로 생성 후 관계 형성

  
