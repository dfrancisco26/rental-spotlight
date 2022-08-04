-- the top 10 cities with the most total rental payment amount
-- include the city name and sum
-- use SUM to sum up the amounts


select city, sum(payment.amount) from city
left join address on city.city_id = address.city_id
left join customer on address.address_id = customer.address_id
left join rental on customer.customer_id = rental.customer_id
left join payment on rental.rental_id = payment.rental_id
where payment.amount is not null
group by city.city
order by sum(payment.amount) desc
limit 10