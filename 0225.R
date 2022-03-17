# R 환경설정 
# 작업디렉토리 확인 및 변경
getwd() #디렉토리 확인 

setwd('C:/Users/KITCOOP/Documents') #디렉토리 변경 

#작업디렉토리 변경 고정
#Tools > Global Options > General > Default working directory  수정 
# Defalut working directory 수정

#참고 : 여러라인 주석처리 
Ctrl + shift + c 

#변수선언 
v1 <- 1
a1 <- 1
b1 <- 2
c1 <- 3 # c 는 변수설정 하면 안됨, combine 명령어 
v_sum <- a1 + b1 + c1

c2 <- 'a'
c3 <- "a b" ; c3 # ;는 명령어의 연속적 실행, c3이 a b로 설정되고 c3을 보여줌 

#변수의 데이터 타입 확인 - class 
d1 <- Sys.Date()
class(v1)
class(c2)

#산술연산
c1 <- '10' 
a1 + v1 # 숫자변수끼리 연산가능 
c1 + a1 # 문자변수와 숫자변수 연산 불가 (묵시적 형변환 발생 하지 않음) 
d1+100 #날짜와 숫자상수 연산가능 

# 형변환 변수
as.numeric() # 숫자 형태로 변환
as.character() # 문자 형태로 변환
as.Date() #날짜형식으로 변환 

as.numeric(c1) +a1

#변수에 연속적 값 할당 
seql <- 1 : 10
'a' : 'f' # 문자 연속적 출력 불가 

# 함수의 사용방법
substr('abcde',2,3)
substr(x='abcde',start=2,stop=3)

help(seq)
seq(from =1, 
      to =1,
      by = ((to - from)/(length.out -1))) #오류 
seq(from =1, to =10, by=1)   

d5 <- seq(from= as.Date('2020/01/01'), to=as.Date('2020/12/31'), by= 'month')
d5
#날짜의 형변환 및 파싱
as.Date('2020/02/05') + 100

d2 <- as.Date('2020/02/05') +100 #변수선언 
as.character(d2, '%A') #요일
as.character(d2, '%Y/%m/%d') #년 월 일 
as.character(d2, '%H:%M:%S') #시 분 초 

#날짜 포맷 확인
help ("strftime")
strftime() #날짜 포맷 변경, as.character()
strftime(Sys.Date(), '%A')
strftime() #문자를 날짜로 파싱, as.Date() 
strtime('2020/02/01', '%Y/%m/%d')

#[연습문제]

#1. 2020년 1월 1일부터 1월 31일까지 날짜를 동시출력
seq(as.Date("2020/01/01"), as.Date("2020/01/31"), by="day" )

#선생님 
d3 <- seq(from=as.Date('2020/01/01'), to=as.Date('2020/01/31'), by =1 )
as.character(d3, '%A')
#2. 2020년 6월 8일부터 오늘날짜까지 남은 일수 출력 
date1 <- as.Date('2020/02/25')
date2 <- as.Date('2020/06/08')
date2-date1

#선생님
as.Date('2020/06/08') - Sys.Date()


sum <-1 

objects # 선언된 변수 목록
rm(list=ls()) #선언된 전체변수 삭제
#rm(list="변수") "변수" 삭제됨

#산술연산 기호
7 %/% 3 #몫
7 %% 3 #나머지 
3^2 #승수
3 **3 #승수 
1e1 # 10
1e-1 #0.1
1e2 #100
1e3 #1000

#NA와 NULL 
cat(1,NA,2) # 자리수 고정, 잘못된 값이 들어 올 경우 
cat(1,NULL,2) #없는 데이터이므로 자리수 고정 불가
sum(1,NA,3) #NA는 무시될 수 없음 
sum(1,NULL,3) #NULL은 무시됨 

NA + 1 #NA
NULL +1 #numeric(0)

#날짜와 관련한 외부 패키지 : lubridate
install.packages('lubridate')
library(lubridate)
date1 <- now() ; date1 #lubridate 로딩후에 사용해야함 
class(date1) #POSIXct도 날짜 
as.character(date1, '%Y')

year(date1) #년 
month(date1) #월, 숫자형식
month(date1, label= T) #월, 문자형식,(날짜언어가 영문일때)
day(date1) #일
wday(date1) #요일숫자출력
wday(date1, label = T) #요일 이름출력
hour(date1) #시
minute(date1) #분
second(date1) #초 

#날짜 언어 변경

Sys.setlocale('LC_TIME', 'C') #영문
month(date1, label = T)

Sys.setlocale('LC_TIME', 'KOREAN') #한글 
month(date1, label = T)

#날짜 단위 날짜S
date1 + months(6) #월단위 6개월후 
date1 + years(6) #연도단위 6년후
date1 + days(6) #일단위 6일후
date1 + hours(6) #시간단위 6시간후 

#연습문제
#2020년 2월의 일별 데이터를 출력
# 그중 v_year 라는 컬럼(변수)에 년도만, v_month라는 컬럼(변수)에 월만,
#v_day라는 컬럼(변수)에 일만 분리저장
#v_bonus_date 컬럼에 6개월 후 데이터를 입력

v_year <- year(seq(as.Date("2020/02/01"), as.Date("2020/02/29"), by="year" )) ; v_year

v_month <- month(seq(as.Date("2020/02/01"), as.Date("2020/02/29"), by="month" )) ; v_month

v_day <- day(seq(as.Date("2020/02/01"), as.Date("2020/02/29"), by="day" )) ; v_day
v_bonus_date <-seq(as.Date("2020/02/01"), as.Date("2020/02/29"), by="month" )+months(6); v_bonus_date

#선생님
date2 <- seq(as.Date("2020/02/01"), as.Date("2020/02/29"), 1 ); date2
v_year <- year(date2)
v_month <- month(date2)
v_day <- day(date2)
v_bonus_date <-date2 + months(6)
