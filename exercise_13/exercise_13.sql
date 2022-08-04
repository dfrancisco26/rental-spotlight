-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount
select country, avg(payment.amount) from country
left join city on country.country_id = city.country_id
left join address on city.city_id = address.city_id
left join customer on address.address_id = customer.address_id
left join rental on customer.customer_id = rental.customer_id
left join payment on rental.rental_id = payment.rental_id
where payment.amount is not null
group by country.country
order by avg(payment.amount) desc
limit 10