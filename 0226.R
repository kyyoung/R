#R 자료구조
#1. 스칼라
#2. 벡터(vector)
#3. 리스트(list)
#4. 행렬(matrix)
#5. 배열(array)
#6. 데이터프레임(data.frame)

#벡터
#-1차원
#-단 하나의 데이터 타입만 허용 

#1.벡터의 생성
v1 <-c(1,2,3) ; v1
v2 <-c('a',1) ; v2 #숫자가 문자로
v3 <-1:10 ; v3
#2.벡터의 확장
c(v1,4) #맨끝에
append(x=v1, values=4, after=2) # 중간위치 삽입 
#3.벡터의 산술연산
v4 <- c(10,20,30)
v5 <- c(10.20,30,40)
v1 +1 # 벡터와 스칼라 연산 가능
v1 + v4 #서로 크기가 같은 벡터 연산 가능
v1 + v5  #서로 크기가 다른 벡터는 작은 벡터가 반복연산 
#10 20 30 40 
#1  2  3  1  이런형태로 연산함
#4.벡터의 색인 (indexing, 추출) 
#1) 정수색인 [ ] 
v1[1]
v1[1,3] # 차원이 맞지 않음 
v1[c(1,3)] #1차원의 형태를 따르기 위해 c로 묶어서 차원을 맞춰야함 
v1[-1] # 첫번째 원소 제외 추출

#2) 이름색인 : 이름이 있는 경우만 가능함 
names(v1) # 벡터에 부여된 원소의 이름을 출력해주는 함수 
names(v1) <-c('a', 'b', 'c')
v1['a']  #a의 원소 위치 추출 
v1[-'a'] #문자값은 마이너스 전달 안됨 
v1[c('a','b')] 

#3)조건색인(불리언색인) 
#T,F
#TRUE, FALSE 
v1 <-c(1,2,3) ; v1

v1[c(T,F,F)]  #[ ]의 기능이 오라클에서 where의 기능과 같음 
v1[v1<2]

v1 < 2 #2보다 작은 값을 추출해줌 

#참고: 2차원 데이터에서의 색인 
getwd()
read.csv('emp.csv')
df1 <-read.csv('emp.csv')
df1[1,2]
#smith의 이름, 입사일, 연봉 추출$
df1[1,c(2,5,6)]
#smith와 allen의 이름과 연봉추출
df1[c(1,2), c('ENAME', 'SAL')]
#데이터 수정방법
df1[1,1] <- 7360 

#sal이 2000이상인 직원 이름, sal 추출 

df1$SAL >=2000  # $를 통해 조건의 true / false가 출력됨 
                # 각 행마다 조건 결과 추출 
				
df1[df1$SAL>=2000, c(2,6)] #행과 컬럼을 명확하게 구분해야함  
df1[df1$SAL>=2000, c('ENAME','SAL')]

#연습문제 
#1)emp.csv 파일을 읽고 10번 부서원의 이름, job, sal 출력 
getwd()
read.csv('emp.csv')
df1 <-read.csv('emp.csv')
df1
df1$DEPTNO == 10    #df1$DEPTNO 재사용불가 
df1[df1$DEPTNO==10, c(2,6)]

#2)20번 부서원의 sal의 총 합 출력
help(sum)1:

df1$DEPTNO ==20 #색인은 할때마다 지정해줘야함 
sum(df1[df1$DEPTNO==20, 'SAL']) 


#3)이름이 scott과 king인 사람의 이름, 사번, sal 출력  
df1[c(8,9), c('ENAME','EMPNO', 'SAL')]

#선생님
df1
df1[df1$ENAME %in% c('SCOTT', 'KING'), c('ENAME', 'EMPNO', 'SAL')]
#in은 or의 역할

#5. 벡터 수정
v1[2] <- 20; v1
v2[2:5] <-seq(20,50,10); v2 
v2[2:5]

#예제) v1벡터에 마지막에 4 삽입, 원소이름을 d 부여 
v1 <- c(1,2,3) ; v1 

c(v1,4)
v1<-append(v1,4)
names(v1)[4] <-'d' ;v1

#논리연산자 
# 1) and 연산자
# T & T
# T & F

v2 <- 1:10
v2[(v2<=3) | (v2>=8)] 

#2) or 연산자
# T | T
# T | F
#예제2) v2에서 3보다 작거나 같고 8보다 크거나 같은 값 출력
v2 <- 1:10
v2 <- (v2 <=3) | (v2>=8) 
#예제3) 
df1[(df1$ENAME == 'SCOTT') | (df1$ENAME == 'KING'), c('ENAME', 'EMPNO', 'SAL')]

#포함연산자 
(v1==1) | (v1==3)
v1 %in% c(1,2) #v1에 1 또는 2가 있나?
1 %in% v1 #1이 v1에 포함되는가?
#3) not 연산자
! (v1>1)
v1 !=1 
!(v1==1) 


#6. 벡터 크기 확인 
length(v1) #1차원인 벡터의 크기 확인
NROW(v1) #행의 개수, 1차원일 경우는 원소의 개수 출력 (1차원일 때는 length 사용) 
nrow(v1) #행의 개수, 2차원에서만 
nrow(df1)
#4)슬라이스색인(연속추출)
v2 < - 1:10 
v2[4:8]
v2[c(4,5,6,7,8)]
v1['b': 'c'] #문자의 연속추출은 안됨 

#형태 확인 함수 : 문자형태인지 숫자형태인지 묻는 함수

is.character('a')
is.vector(df1)
is.data.frame(df1) 
is.array(df1)
is.na(1)
is.null(1)

v3 <- c(1,NA,3,4)
is.na(v3)

#예제) 다음의 v3에서 NA인 원소만 찾아서 2로 수정
v3[is.na(v3)] <-2; v3
