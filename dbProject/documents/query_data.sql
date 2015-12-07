#### Title : Online Resume test queries
#### Names: Anusha Kondapalli, Shilpa Poloju


#### Question 1:
Show all jobseekers.
SQL:
```
SELECT FIRST , last
FROM user
JOIN roles ON user.user_id = roles.user_id
WHERE role =  "jobseeker"
LIMIT 0 , 30
```

#### Answer
```
 first      last
ward      abigail
butler    brent
thompson  camila
kelly     catherine
jacobs    diane
morris    duane
rodriguez gregory
shaw      javier
kelley    katie
castro    linda
pearson   soham
nichols   tamara
alexander tracey
```

#### Question 2:
Show all employees.
SQL:
```
SELECT FIRST , last
FROM user
JOIN roles ON user.user_id = roles.user_id
WHERE role =  "employee"
LIMIT 0 , 30
```

#### Answer
```
 FIRST    last
welch    linda
curtis   lorraine
cox      marian
baker    mark
shaw     pauline
kelley   pedro
jacobs   samantha
```

#### Question 3:
calculate the charge for jobseeker x
SQL:
 ```
SELECT FIRST , last, SUM( rate ) 
FROM user
JOIN charges_for_user ON user.user_id = charges_for_user.user_id
JOIN applied_for ON user.user_id = applied_for.user_id
WHERE user.user_id =2
LIMIT 0 , 30
```

#### Answer
```
 first   last  rate
butler  brent   20
```

#### Question 4:
calculate the charge for company x
SQL:
```
SELECT company_name, SUM( rate ) 
FROM company
JOIN charges_for_company ON company.company_id = charges_for_company.company_id
JOIN interviews ON charges_for_company.company_id = interviews.company_id
WHERE company.company_id =2
LIMIT 0 , 30
```

#### Answer
```
 company_name  rate 
oracle          75

```

#### Question 5:
find the company with the most jobs
SQL:
```
SELECT company_id, COUNT( company_id ) c
FROM posted_jobs
GROUP BY company_id
ORDER BY c DESC 
LIMIT 2
```

#### Answer 
```
company_id  c 
1           4
3           4
```

#### Question 6:
find the average # of interviews for all active users
SQL:
```
SELECT total_no_interviews / no_of_users AS avg_no_of_interviews
FROM (

SELECT COUNT( DISTINCT (
user_id
) ) AS no_of_users, SUM( no_of_interviews ) AS total_no_interviews
FROM (

SELECT user_id, COUNT( user_id ) AS no_of_interviews
FROM interviews
GROUP BY user_id
) AS t1
) AS t2

```

#### Answer
```
avg_no_of_interviews
2.0000
```

#### Question 7:
add a new administrator(worker)
SQL:

```
INSERT INTO USER( last, 
FIRST , street, city, state, zip, email, 
PASSWORD , phone, picture, user_id, social_security_no, credit_card_no, expiration_month, expiration_year, cvc ) 
VALUES (
 `mayflower`,  `sita`,  `4700 taft`,  `wichitafalls`,  `texas`, 76308,  `sita@yahoo.com`, 12345, 4255590557, NULL , 21, 2389035360, 123432378909567, 7, 2016, 456
)
```
```
INSERT INTO USER(user_id,role)
VALUES (21,`employee`)
```

#### Answer
```
user table
mayflower  sita  4700 taft wichitafalls  texas 76308  sita@yahoo.com  12345  4255590557  NULL  21 2389035360  123432378909567  7  2016  456  NULL  NULL NULL NULL

role table
21  employee
```

#### Question 8:
find the customer representative with most interviews
SQL:
```
SELECT customer_representative, COUNT( customer_representative ) AS most_interviews
FROM interviews
GROUP BY customer_representative
ORDER BY most_interviews DESC 
LIMIT 2
```

#### Answer
```

customer_representative       most_interviews Ascending
lorraine curtis               7
linda welch                   4

```


#### Question 9:
find the company that generated the most interviews in all months
SQL:
```
SELECT company_name, COUNT( y.jobs ) 
FROM (

SELECT company_name, MAX( interviews.company_id ) AS jobs
FROM company
JOIN interviews ON company.company_id = interviews.company_id
GROUP BY interviews.company_id
ORDER BY jobs
)y
LIMIT 0 , 30
```
#### Answer
```
company_name     count( y.jobs )
microsoft        5
```

#### question 10:
find all interviews that were done last year
SQL:
```
SELECT DATE, company_id, job_category_id
FROM interviews
WHERE YEAR( DATE ) =2015
LIMIT 0 , 30
```

#### Answer:
```
date          company_id        job_category_id
2015-01-01    1                 3
2015-10-08    1                 4
2015-01-22    2                 3
2015-12-01    2                 4
2015-11-04    3                 1
2015-12-17    3                 3
2015-12-15    3                 5
2015-12-03    3                 8
2015-01-15    4                 2
2015-12-01    4                 9
2015-11-10    5                 2
2015-12-0     5                 6
```

#### Question 11:
add a new job seeker
SQL:
```
INSERT INTO `user` (`last`, `first`, `street`, `city`, `state`, `zip`, `email`, `password`, `phone`, `picture`, `user_id`, `social_security_no`, `credit_card_no`, `expiration_month`, `expiration_year`, `cvc`, `document`, `date_posted`, `job`, `job_description`) VALUES
(`goodwill`, `emily`, `4700 taft`, `wichitafalls`, `texas`, 76308, `good.emi@gmail.com`, `32444`, `4567890876`, NULL, 22, 2342323232, 6565656565656565, 6, 2017, 666, NULL, `0000-00-00`, `quality engineer`, NULL);
```


#### Question 12:
find the jobseeker with most scheduled interviews(meaning they are scheduled, but not completed)
SQL:
```
SELECT FIRST , last, interviews.user_id, COUNT( interviews.user_id ) AS no_interviews
FROM user
JOIN roles ON user.user_id = roles.user_id
JOIN interviews ON interviews.user_id = user.user_id
WHERE role =  `jobseeker`
AND completed =  `no`
GROUP BY interviews.user_id
ORDER BY no_interviews
LIMIT 2
```
#### Answer:
```
FIRST      last     user_id        no_interviews Ascending
ward       abigail  1              1
morris     duane    6              1
```

#### Question 13:
find all jobs within x
SQL:
```
SELECT sub_categories
FROM job_categories
WHERE parent_category =  `computer programming`
LIMIT 0 , 30
```
#### Answer:
```
sub_categories
quality engineer
developer
designer
```

#### Question 14:
find all jobs within category x and subcategory y
SQL:
```
SELECT job_category_name, parent_category, sub_categories
FROM job_categories
WHERE job_category_name
IN (
 `it and engineering`,  `nursing`
)
LIMIT 0 , 30
```
#### Answer
```
job_category_name           parent_category         sub_categories
it and engineering          computer programming    quality engineer
nursing                     nurse manager           practitioner
nursing                     nurse manager           oncology
it and engineering          computer programming    developer
it and engineering          computer programming    designer
```

#### Question 15:
find the count of currently posted jobs in each category and list from most to least
SQL:
```
SELECT date_posted, job_category_name, sub_categories, COUNT( sub_categories ) AS no_jobs
FROM job_categories
JOIN posted_jobs ON job_categories.job_category_id = posted_jobs.job_category_id
WHERE Date_posted = current_date
GROUP BY sub_categories
ORDER BY no_jobs DESC 
LIMIT 0 , 30
```

#### Answer
```
date_posted        job_category_name      sub_categories                 no_jobs Descending
2015-12-03         nursing                oncology                       2
2015-12-03         it and engineering     quality engineer               1
2015-12-03         hr and recuiter        student development advicer    1
```

#### Question 16:
find the count of past posted jobs in each category  and list from most to least
SQL:
```
SELECT date_posted, job_category_name, sub_categories, COUNT( sub_categories ) AS no_jobs
FROM job_categories
JOIN posted_jobs ON job_categories.job_category_id = posted_jobs.job_category_id
WHERE Date_posted < current_date
GROUP BY sub_categories
ORDER BY no_jobs DESC 
LIMIT 0 , 30
```

#### Answer
```
date_posted                job_category_name               sub_categories                    no_jobs Descending
2014-12-17                 sales and marketing             social media producer             3
2015-08-19                 hr and recuiter                 student development advicer       3
2015-09-30                 health care                     medical dermology                 2
2015-09-30                 it and engineering              quality engineer                  2
2014-12-30                 it and engineering              designer                          2
2015-09-28                 nursing                         oncology                          1
2015-08-30                 sales and marketing             management                        1
2015-10-16                 it and engineering              developer                         1
2015-06-25                 nursing                         practitioner                      1
2015-10-02                 sales and marketing             finance                           1
```

#### Question 17:
find the count of all posted jobs in each category and list by month.
SQL:
```
SELECT date_posted, job_category_name, sub_categories, COUNT( sub_categories ) AS no_jobs
FROM posted_jobs
JOIN job_categories ON posted_jobs.job_category_id = job_categories.job_category_id
WHERE MONTH( date_posted ) 
GROUP BY sub_categories, MONTH( date_posted ) 
ORDER BY MONTH( date_posted ) 
LIMIT 0 , 30
```
#### Answer
```
date_posted     job_category_name         sub_categories                  no_jobs
2015-06-25      nursing                   practitioner                    1
2015-08-19      hr and recuiter           student development advicer     2
2015-08-30      sales and marketing       management                      1
2015-08-06      health care               medical dermology               1
2015-09-25      hr and recuiter           student development advicer     1
2015-09-30      health care               medical dermology               1
2015-09-30      it and engineering        quality engineer                2
2015-09-28      nursing                   oncology                        1
2015-09-19      sales and marketing       social media producer           1
2015-09-01      it and engineering        designer                        1
2015-10-16      it and engineering        developer                       1
2015-10-02      sales and marketing       finance                         1
2014-11-10      sales and marketing       social media producer           1
2014-12-17      sales and marketing       social media producer           1
2015-12-03      it and engineering        quality engineer                1
2015-12-03      nursing                   oncology                        2
2014-12-30      it and engineering        designer                        1
2015-12-03      hr and recuiter           student development advicer     1
```

#### Question 18:
alter a posted job
SQL:
```
ALTER TABLE posted_jobs ADD pid INT
```