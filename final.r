install.packages("dplyr") # 필터링, 정렬, 집계, 그루핑 등
install.packages("magrittr") # 파이프 연산자 패키지

library(dplyr)
library(magrittr)

## 벡터(Vector) : 같은 타입의 값이 여러 개 나오는 데이터 집합
# 0. 데이터 불러오기
load("E:/RStudio_workspace/Rdata/vector.rda")

# 1. 벡터 데이터 개수 구하기
length(v)
v %>% length()

# 2. 벡터 데이터 평균, 최대, 최소, 합 구하기
mean(v)
v %>% mean()

max(v)
v %>% max()

min(v)
v %>% min()

sum(v)
v %>% sum()

# 3. 벡터 데이터에서 일부 데이터 추출하기(주어진 조건을 만족하는 데이터 추출하기)
v[v > 77] # 벡터 변수 v에서 77보다 큰 값만 추출
v[v > 77 & v < 99] # 벡터 변수 v에서 77보다 크고 99보다 작은 값만 추출

v[v > 77] %>% mean() # 벡터 변수 v에서 77보다 큰 값만 추출하고 그 추출된 값들의 평균
v[v > 77] %>% length() # 벡터 변수 v에서 77보다 큰 값만 추출하고 그 추출된 값들의 개수

# 3. 벡터 데이터에서 일부 데이터 추출하기(특정 위치에 있는 데이터 추출하기)
c(1, 2, 3) # 1, 2, 3이라는 세 개의 값이 들어간 벡터 생성
seq(1, 10, by=2) # 1부터 시작해서 10이 될때까지 간격(by)이 2인 벡터를 생성
seq(0, 10, by=2) # 0부터 시작해서 10이 될때까지 간격이 2인 벡터를 생성

v[c(1, 2, 3)] # 벡터 변수 v에서 1, 2, 3의 위치에 있는 값을 추출
v[seq(1, 10, by=2)] # 벡터 변수 v에서 1, 3, 5, 7, 9의 위치에 있는 값을 추출
v[seq(0, 10, by=2)] # 벡터 변수 v에서 0, 2, 4, 6, 8, 10의 위치에 있는 값을 추출
v[seq(1, length(v), by=2)] # 벡터 변수 v에서 홀수 번째에 위치한 값을 추출
v[seq(0, length(v), by=2)] # 벡터 변수 v에서 짝수 번째에 위치한 값을 추출

v[seq(1, length(v), by=2)] %>% mean() # 벡터 변수 v에서 홀수 번째에 위치한 값을 추출하고 그 값들의 평균

## 데이터프레임(DataFrame) : DB의 테이블처럼 컬럼과 행으로 구성된 데이터 집합, 하나의 컬럼은 벡터임
# 0. 데이터 불러오기
load("E:/RStudio_workspace/Rdata/data_frame.rda")

# 1. 데이터프레임의 개수 구하기(행, 열)
dim(df)

# 2. 특정 컬럼에 대한 평균 구하기
df$model # 데이터프레임 변수 df에서 model 컬럼만 추출
df %>% .$model # 데이터프레임 변수 df에서 model 컬럼만 추출

df$cty # 데이터프레임 변수 df에서 cty 컬럼만 추출
df$cty %>% mean() # 데이터프레임 변수 df에서 cty 컬럼만 추출한 다음 평균을 구하기
df %>% .$cty %>% mean() # 데이터프레임 변수 df에서 cty 컬럼만 추출한 다음 평균을 구하기

# 3. 특정 컬럼에 대한 필터링 적용하기 (주어진 조건을 만족하는 값만 추출하기)
df %>% filter(cty >= 20) # 데이터프레임 변수 df에서 cty 컬럼의 값이 20 이상인 레코드만 추출하기
df %>% filter(model == "a4") # 데이터프레임 변수 df에서 model 컬럼의 값이 "a4"인 레코드만 추출하기
df %>% filter(manufacturer == "hyundai") %>% dim() # 데이터프레임 변수 df에서 manufacturer 컬럼의 값이 'hyundai'인 레코드를 추출하고 그 레코드에 대한 행, 열의 개수 출력

# 데이터프레임 변수 df에서 drv가 "f"인 cty의 평균
df %>% filter(drv == "f") # 데이터프레임 변수 df에서 drv가 "f"인 데이터만 추출
df %>% filter(drv == "f") %>% .$cty # 데이터프레임 변수 df에서 drv가 "f"인 데이터만 추출한 다음 cty 값만 추출
df %>% filter(drv == "f") %>% .$cty %>% mean() # 데이터프레임 변수 df에서 drv가 "f"인 cty의 평균

# 4. 새로운 컬럼 추가하기
df$sum = df$cty + df$hwy # cty컬럼과 hwy컬럼에 있는 값을 더해서 새로운 커럶 sum에 저장하고 생성

# 5. 정렬하기
df %>% arrange(cty) # 데이터프레임 변수 df에 저장된 레코드들을 cty 컬럼의 오름차순으로 정렬
df %>% arrange(-cty) # 데이터프레임 변수 df에 저장된 레코드들을 cty 컬럼의 내림차순으로 정렬
df %>% arrange(cty, hwy) # 데이터프레임 변수 df에 저장된 레코드들을 cty 컬럼의 오름차순으로 정렬하고 cty값이 같으면 hwy로 정렬

# 6. group_by 함수 사용하기
df %>% group_by(drv) %>% summarise(n = n(), avg_cty = mean(cty)) # df에 저장된 데이터를 drv가 같은 레코드들끼리 그루핑을 하고 각 그룹별로 레코드 개수, cty평균 계산
# n()은 데이터가 몇 행으로 되어 있는지 '빈도'를 구하는 기능

# 7. 각 집단별로 다시 집단 나누기
df %>% group_by(manufacturer, drv) %>% summarise(avg_city = mean(cty)) %>% head(10)

# 8. dplyr 조합하기
# 회사별로 “suv” 자동차의 도시 및 고속도로 통합연비 평균을 구해 내림차순으로 정렬하고, 1~10위까지 출력하기
df %>% group_by(manufacturer) %>% filter(class == "suv") %>% mutate(mean = (cty + hwy)/2) %>% arrange(-mean) %>% head(10)
# mutate()는 기존 df에 컬럼을 임시로 추가하여 출력해줌


### R 기본 문법

# 1. 변수의 이름
# 변수의 이름에는 . _ 등이 올 수 있다. .은 먼저 사용할 수 있지만 _는 먼저올 수 없다.

a... = 0 (o)
a___ = 0 (o)
.a = 0 (o)
_a = 0 (x)


# 2. 대입 연산자
# C언어에서는 변수에 값을 넣는 대입연산자로 =을 사용한다. R에서도 =을 사용하지만 추가적으로 <-도 사용할 수 있다.

a = 1
b <- 1


# 3. 문자열
# 문자열은 파이썬과 문법이 매우 흡사하다. 따옴표는 작은따옴표 큰따옴표 구분하여 사용하지 않고 짝만 맞추면 된다.

a <- 'Hello World'
a <- "Hello World"
a <- "He said 'Hello World'"


# 4. 불리언
# 불리언 값은 TRUE 또는 T, FALSE 또는 F 로 표시된다. 불리언 값과 같이 쓰이는 특수문자는 &(AND), |(OR), !(NOT) 등등이 있다.

> T & F
[1] FALSE
> T | F
[1] TRUE
> !TRUE
[1] FALSE


# 5. 벡터
# R 프로그래밍에선 변수(?)는 스칼라, 배열(?)은 벡터로 불리운다. c()함수를 통해서 스칼라값을 벡터로 묶을 수 있다.

> a = c(1,2,3)
[1] 1 2 3
> a = c(1,2,3,c(4,5,6))
[1] 1 2 3 4 5 6
> a = c(c(1,2,3),c(4,5,6))
[1] 1 2 3 4 5 6
# 벡터에 접근하는 방법은 벡터의 인덱스를 불러오는 것이다. 대부분의 프로그래밍 언어는 배열의 시작이 [0]부터지만 R 에서는 [1]부터 시작이다.

> a[1]
[1] 1
> a[c(1,3)]
[1] 1 3


# 6. 펙터
# 변주형 변수, 카테고리를 지정할 수 있는 요소다. 이것은 데이터 프레임을 다룰때 주로 사용되었다.

> sex <- factor(c("M","F"))
> levels(sex)
[1] "F" "M"
> print(sex)
[1] M F
Levels: F M


# 7. 벡터의 길이
# 벡터의 길이를 파악하는 함수는 nrow, NROW, length가 있다. nrow 함수는 행렬의 길이만 알아낼 수 있다. 나머지 두개는 벡터도 가능.

> x <- c("a","b","c")
> length(x)
[1] 3
> nrow(x)
NULL
> NROW(x)
[1] 3


# 8-1. 조건 연산
# 스칼라 혹은 벡터에 대한 조건의 결과를 얻는 방법이다.

> x <- c(11,12,13,14,19,20)
> x > 15
[1] FALSE FALSE FALSE FALSE  TRUE  TRUE
# 벡터 x의 값과 15를 비교하여 하나의 벡터값이 만들어졌다. 이 벡터를 x의 인덱스 값으로 넣으면

> x[x>15]
[1] 19 20
# 벡터 x의 값에서 15보다 큰 값을 추출할 수 있다.

> which(x>15)
[1] 5 6
> which(x==9)
integer(0)
# which 함수를 사용하면 조건을 충족하는 값의 위치를 알아낼 수 있다.

> x[which(x>15)]
[1] 19 20
> x[x>15]
[1] 19 20
# 이 처럼 같은 결과를 출력한다.



# 8-2. 조건 연산
# 벡터에서 같은 문자값이 있는지 확인하는 방법은 다음과 같다.

> "a" %in% c("a","b","c")
[1] TRUE
> "d" %in% c("a","b","c")
[1] FALSE


# 9. 시퀀스
# 1부터 100까지 들어간 혹은 규칙있는 벡터값을 생성하기 위해선 시퀀스라는 함수를 사용한다.

> seq(1,5)
[1] 1 2 3 4 5
> seq(1,5,2)
[1] 1 3 5
> seq(0,100,5)
 [1]   0   5  10  15  20  25  30  35  40  45  50  55  60  65  70  75  80  85  90
[20]  95 100
# 이처럼 작성되며 seq(시작 값, 종료 값, 순서)로 표현한다.

> rep(1:2,5)
 [1] 1 2 1 2 1 2 1 2 1 2
> rep(1:2,each=5)
 [1] 1 1 1 1 1 2 2 2 2 2
# rep 함수를 사용하면 시퀀스 함수와는 약간 다른 모양의 벡터 생성이 가능하다.



# 10. 행렬
# 행렬은 행의 갯수를 선택하여 생성하거나 열의 갯수를 선택하여 생성할 수 있다. 말로 쓰기 어려우니 다음 코드를 보자.

> matrix(c(0,1,2,3,4,5,6,7,8,9),nrow=2)
     [,1] [,2] [,3] [,4] [,5]
[1,]    0    2    4    6    8
[2,]    1    3    5    7    9
> matrix(c(0,1,2,3,4,5,6,7,8,9),ncol=2)
     [,1] [,2]
[1,]    0    5
[2,]    1    6
[3,]    2    7
[4,]    3    8
[5,]    4    9
# 이처럼 같은 값으로 만든 행렬이지만 행이 2개냐 열이 2개냐의 차이로 모양이 확연히 달라졌다.

     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
> matrix(c(1,2,3,4,5,6,7,8,9),ncol=3, byrow=T)
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
# 또 기본은 세로(열) 우선으로 값이 채워져 나가지만 byrow을 통해서 가로(행) 우선으로 값을 채울 수 있다.

> our.mat <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,dimnames = list(c("item1","item2","item3"),c("feature1","feature2","feature3")))
> our.mat
      feature1 feature2 feature3
item1        1        4        7
item2        2        5        8
item3        3        6        9
# 위와같이 각행렬의 이름을 지정해 줄 수도 있다.



# 행렬에 접근하는 방법은 벡터와 유사하며 2차원 배열에 접근하듯 하면된다. our.mat에 접근해 보도록 하자.

# our.mat[row,col]
> our.mat[1,]
feature1 feature2 feature3
       1        4        7
> our.mat[1,c(1,2)]
feature1 feature2
       1        4
> our.mat[!our.mat[,1]==2,]
      feature1 feature2 feature3
item1        1        4        7
item3        3        6        9
> our.mat["item1",]
feature1 feature2 feature3
       1        4        7
# our.mat[!our.map[,1]==2],의 경우 1열이 2가 아닌 행을 뽑아내므로 결과는 1,3행이 출력된다. 또한 our.mat["item1",]처럼 행과 열의 이름으로 행열을 뽑아내는 것도 가능하다.



# 이번엔 행렬의 연산을 해보자.

> our.mat*our.mat
      feature1 feature2 feature3
item1        1       16       49
item2        4       25       64
item3        9       36       81
> our.mat%*%our.mat
      feature1 feature2 feature3
item1       30       66      102
item2       36       81      126
item3       42       96      150
# 기본적인 *로 곱셈 연산을 실시하면 쓸데없이(?) 행렬의 각각의 자리에서 곱셈이 일어난다. 우리가 알고있는 일반적인 행렬의 곱셈을 실시하기 위해선 our.mat%*%our.mat와 같이 작성해야 한다.



# 11. 데이터 프레임
# R 프로그래밍에서 가장 중요한 데이터로 사용된다고 한다. 행렬은 숫자의 집합체임에 비해 데이터 프레임은 벡터, 펙터 등등이 모두 합쳐질 수 있기 때문인듯 하다.

> x=c(1,2,3,4,5)
> y=c(2,4,6,8,10)
> z=c('M','F','M','F','M')
> our.dataFrame <- data.frame(x,y,z)

colnames(our.dataFrame) <- c("number", "age", "gender")
rownames(our.dataFrame) <- c("a","b","c","d","e")
# 데이터 프레임의 생성은 위와같이 이루어지며 데이터 프레임의 구조를 확인하는 방법은 다음과 같다.

> str(our.dataFrame) #
'data.frame':   5 obs. of  3 variables:
 $ x: num  1 2 3 4 5
 $ y: num  2 4 6 8 10
 $ z: Factor w/ 2 levels "F","M": 2 1 2 1 2
> head(our.dataFrame)
  x  y z
1 1  2 M
2 2  4 F
3 3  6 M
4 4  8 F
5 5 10 M
> View(our.dataFrame)


# 데이터 프레임의 접근 방법은 행렬과 비슷하지만 $ 특수문자를 통해서 벡터의 이름으로 열에 접근이 가능하다.

> our.dataFrame[1,]
  x y z
1 1 2 M
> our.dataFrame$z
[1] M F M F M
Levels: F M
> our.dataFrame[our.dataFrame$z=="F",]
  x y z
2 2 4 F
4 4 8 F


# 12. 합, 평균
# R 프로그래밍에선 벡터의 합과 평균값을 구해주는 함수가 존재한다.

> sum(c(1,2,3))
[1] 6
> sum(c(1,2,3,NA))
[1] NA
> sum(c(1,2,3,NA),na.rm=T)
[1] 6
> mean(c(1,2,3))
[1] 2
> mean(c(1,2,3,NA),na.rm=T)
[1] 2
# 결측치(NA)가 있는 경우 원활한 계산이 불가하므로 na.rm으로 결측치를 모두 제거해야 한다.



# 13. 조건문
# 조건문을 작성하는 방법은 C언어와 아주 유사하다.

x <- 1
if(x>3) {
    print("TRUE")
} else {
    print("FALSE")
}
# 하지만 유의해야 할 점은 if문의 닫히는 중괄호 바로 옆에 else가 (이어지도록)와야한다. 한줄씩 코드가 실행되서 그런것 같다.



# 14. 반복문
# 마지막으로 반복문은 for, while이 존재하며 문법은 자바스크립트 ES6스럽다.

# [ FOR ]
for(i in 1:10) {
    print(i)
}

# [ WHILE ]
i <- 0
while(i<10) {
    print(i)
    i <- i+1
}
# R 프로그래밍에선 딱히 반복문을 사용할 일이 적었다. 단기간으로 배워서 그런지도 모르겠다. 유일하게 사용했던 이유는 벡터값을 전부 뒤집기 위해서였다.

a <- NULL

for(i in 1:length(airquality$Ozone)) {
    a[i] <- airquality$Ozone[length(airquality$Ozone)-(i-1)]
}

for(i in 1:length(airquality$Ozone)) {
    print(a[i])
}