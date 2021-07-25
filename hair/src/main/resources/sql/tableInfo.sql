<!-- BOARD -->
CREATE TABLE BOARD (	
    BOD_NO 					INT AUTO_INCREMENT PRIMARY KEY, -- 글번호
    BOD_ID 					VARCHAR(20) REFERENCES MEMBER(MEM_ID),  -- 작성자
    BOD_SUBJECT 			VARCHAR(100) NOT NULL,  -- 제목
    BOD_CONTENT 		TEXT NOT NULL, -- 본문 
    BOD_READ_COUNT 	INT DEFAULT 0,  -- 조회수
    BOD_REC_COUNT 		INT DEFAULT 0,  -- 추천수
    BOD_COMT_COUNT 	INT DEFAULT 0, -- 댓글수
    BOD_FILLER1 			VARCHAR(100),
    BOD_FILLER2 			VARCHAR(100),
    BOD_FILLER3 			VARCHAR(100),
    BOD_FILLER4 			VARCHAR(100),
    BOD_FILLER5 			VARCHAR(100),
    BOD_REG_DATE 		DATE NOT NULL, -- 작성일
    BOD_UPD_DATE 		DATE NOT NULL -- 
);


<!-- MEMBER -->
-- 회원인지 아닌지만 관리
CREATE TABLE MEMBER(
    MEM_NO 								INT AUTO_INCREMENT PRIMARY KEY,
    MEM_ID          						VARCHAR(20) PRIMARY KEY,
    MEM_NAME          					VARCHAR(200) NOT NULL,
    MEM_PW        							VARCHAR(20) NOT NULL,
    MEM_MANAGER_YN					VARCHAR(1) NOT NULL,
	MEM_PHONE1 							VARCHAR(11) NOT NULL,
	MEM_PHONE2 							VARCHAR(11),
    MEM_EMAIL     						VARCHAR(40) UNIQUE,
    MEM_EMAIL_APPROVAL_STATUS VARCHAR(10) NOT NULL,
    MEM_EMAIL_APPROVAL_KEY 		VARCHAR(10),
    MEM_FILLER1 							VARCHAR(100),
    MEM_FILLER2 							VARCHAR(100),
    MEM_FILLER3 							VARCHAR(100),
    MEM_FILLER4 							VARCHAR(100),
    MEM_FILLER5 							VARCHAR(100),
    MEM_REG_DATE 						DATE NOT NULL,
    MEM_UPD_DATE 						DATE NOT NULL
);

<!--사업장정보 -->
--사업주가 매장을 N건 가지고 있을경우 고려.
--MEM-ID에 따른 사업장관리, 그룹별로 상호명으로 관리.
CREATE TABLE BUSINESS(
	BUSI_NO				INT AUTO_INCREMENT PRIMARY KEY,
	BUSI_ID 				VARCHAR(100) REFERENCES MEMBER(MEM_ID),
	BUSI_NAME 		VARCHAR(100) NOT NULL,
	BUSI_PHONE1 		VARCHAR(11) NOT NULL,
	BUSI_PHONE2 		VARCHAR(11),
	BUSI_PHONE3 		VARCHAR(11), 
    BUSI_FILLER1 		VARCHAR(100),
    BUSI_FILLER2 		VARCHAR(100),
    BUSI_FILLER3 		VARCHAR(100),
    BUSI_FILLER4 		VARCHAR(100),
    BUSI_FILLER5 		VARCHAR(100),
    BUSI_REG_DATE 	DATE NOT NULL,
    BUSI_UPD_DATE 	DATE NOT NULL
);

<!-- COSTOMER -->
--사업장에 등록된 손님 관리.
CREATE TABLE CUSTOMER(
	CUST_NO			INT AUTO_INCREMENT PRIMARY KEY,
	CUST_ID 			VARCHAR(100) REFERENCES MEMBER(MEM_ID),
	CUST_NAME 		VARCHAR(100) NOT NULL,
	CUST_SEX			VARCHAR(2) NOT NULL,
	CUST_PHONE1 	VARCHAR(11) NOT NULL,
	CUST_PHONE2 	VARCHAR(11),
	CUST_PHONE3 	VARCHAR(11), 
    CUST_FILLER1 	VARCHAR(100),
    CUST_FILLER2 	VARCHAR(100),
    CUST_FILLER3 	VARCHAR(100),
    CUST_FILLER4 	VARCHAR(100),
    CUST_FILLER5 	VARCHAR(100),
    CUST_REG_DATE 	DATE NOT NULL,
    CUST_UPD_DATE 	DATE NOT NULL
);


<!-- 상품정보 -->
CREATE TABLE PRODUCT(
	PROD_NO 				INT AUTO_INCREMENT PRIMARY KEY,
	PROD_ID 				VARCHAR(100) REFERENCES MEMBER(MEM_ID),
	PROD_CODE 			VARCHAR(5) NOT NULL,
	PROD_NAME 			VARCHAR(100) NOT NULL,
	PROD_PRICE 			INT DEFAULT '0',
	PROD_USE_YN 		VARCHAR(1) NOT NULL,
    PROD_FILLER1 			VARCHAR(100),
    PROD_FILLER2 			VARCHAR(100),
    PROD_FILLER3 			VARCHAR(100),
    PROD_FILLER4 			VARCHAR(100),
    PROD_FILLER5 			VARCHAR(100),
	PROD_REG_DATE 		DATE NOT NULL,
	PROD_UPD_DATE 		DATE NOT NULL
);
 
<!-- 매출 -->
CREATE TABLE SALES(
	SALES_NO 						INT AUTO_INCREMENT PRIMARY KEY,
	SALES_ID 						VARCHAR(100) REFERENCES MEMBER(MEM_ID),
	SALES_CUST_NO				VARCHAR(100),
    SALES_STAFF_NO    			VARCHAR(100),
	SALES_PROD_NAME			VARCHAR(5) NOT NULL,
	SALES_PROD_PRICE			VARCHAR(100),
	SALES_PROD_PRICE_TOT	VARCHAR(100),
	SALES_POINT_PLUS			VARCHAR(100),
	SALES_POINT_MINUS		VARCHAR(100),
	SALES_POINT_TOT			VARCHAR(100),
	SALES_FILLER1 				VARCHAR(100),
	SALES_FILLER2 				VARCHAR(100),
	SALES_FILLER3 				VARCHAR(100),
	SALES_FILLER4 				VARCHAR(100),
	SALES_FILLER5 				VARCHAR(100),
	SALES_REG_DATE 			DATE NOT NULL,
	SALES_UPD_DATE 			DATE NOT NULL
);


<!--staff정보 
 연락처같은경우 11자리로 만들지 말고, 넉넉히 만들것.-->
CREATE TABLE STAFF(
	STAFF_NO				INT AUTO_INCREMENT PRIMARY KEY,
	STAFF_ID 				VARCHAR(100) REFERENCES MEMBER(MEM_ID),
    STAFF_BUSI          VARCHAR(100) REFERENCES BUSINESS(BUSI_NO),
	STAFF_NAME 			VARCHAR(100) NOT NULL,
	STAFF_PHONE1 		VARCHAR(100) NOT NULL,
	STAFF_MEMO 			VARCHAR(1000), 
	STAFF_USEYN			VARCHAR(10),
    STAFF_FILLER1 		VARCHAR(100),
    STAFF_FILLER2 		VARCHAR(100),
    STAFF_FILLER3 		VARCHAR(100),
    STAFF_FILLER4 		VARCHAR(100),
    STAFF_FILLER5 		VARCHAR(100),
    STAFF_REG_DATE 	DATE NOT NULL,
    STAFF_UPD_DATE 	DATE NOT NULL
);