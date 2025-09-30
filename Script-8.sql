-- Customer Management:
select customer_id,
	   first_name,
	   last_name,
	   customer_segment,
	   loyalty_tier
from dim_customer
where customer_type = 'Individual'
order by last_name 
limit 15;

-- Product Catalog Review:
select product_id,
	   product_name,
	   brand_name,
	   unit_price 
from dim_product
where brand_name like '%Apple%'
order by unit_price desc;

-- Premium customer Analysis:
select customer_id,
	   first_name,
	   last_name,
	   loyalty_tier,
	   customer_segment
from dim_customer
where loyalty_tier in ('Gold','Platinum')
limit 20; 

-- Store Operations:
select store_id,
	   store_name,
	   city,
	   state_province
from dim_store
where is_24_hour is not null
order by state_province, city;

--Employee Directory:
select employee_id,
	   first_name,
	   last_name,
	   hire_date::date as hire_date,
	   extract(year from age(current_date, hire_date))::int as year_with_company
from dim_employee
where hire_date >= date '2020-01-01'
order by hire_date desc
limit 10;

-- Product Pricing Analysis:
select product_id,
	   product_name,
	   brand_name, 
	   unit_price::float as unit_price 
from dim_product
where unit_price is null
or unit_price = 0 
order by product_name;

-- Customer Communication:
select customer_id,
	   first_name||' '||last_name as full_name,
	   email_address,
	   length(first_name) as len_of_first_mame
from dim_customer
where customer_type like 'Individual'
limit 10;

-- Store Location Analysis:
select store_id,
	   store_name,
	   city,
	   state_province 
from dim_store 
where state_province in ('CA', 'NY', 'TX')
order by state_province, store_name;

-- Product Categorization
select distinct category_level1
from dim_product 
order by category_level1;

-- Employee contact Formatting
select employee_id,
	   upper(first_name ||' '||last_name) as full_name, 
	   left(first_name, 3) as first3_first_name,
	   extract(year from hire_date)::int as hire_year 
from dim_employee 
where first_name like 'John%'
order by full_name;




