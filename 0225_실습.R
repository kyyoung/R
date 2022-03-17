# 1. 2019년 전체 날짜를 갖는 v1 변수 생성
v1 <- seq(as.Date("2019/01/01"), as.Date("2019/12/31"), 1 ); v1

# 2. 위의 벡터를 년도를 제외한 월/일 형식으로만 출력하여 v2 생성
v_m_day <- as.character(v1, '%m/%d'); v_m_day

# 3. '2019/04/25'일로부터 100일 뒤의 날짜와 요일 출력 
as.character(as.Date('2019/04/25')+100, '%Y/%m/%d/%A')

# 4. 사원의 입사일이 다음과 같을때 현재까지 근무일수가 몇주, 몇일인가 출력 
v_hiredate <- c('2018/04/06', '2019/12/23', '2019/05/04') ; v_hiredate

v_hiredate_day <- Sys.Date() - as.Date(v_hiredate); v_hiredate_day
Sys.Date() + days(7)
v_hiredate_weeks <- floor(v_hiredate_day / 7) ; v_hiredate_weeks 

help("as.duration")

#선생님 
v_hiredate_day <- as.numeric(Sys.Date() - as.Date(v_hiredate)); v_hiredate_day
#형태를 숫자로 변환하여 계산함 