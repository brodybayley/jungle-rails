# Jungle

A mini e-commerce application built with Rails 4.2 where users can view products in the feed, add/remove products from cart and purchase products.

# Final Product

!["Screenshot of main feed"](https://github.com/brodybayley/jungle-rails/blob/master/docs/main_feed.png)

!["Screenshot of product details"](https://github.com/brodybayley/jungle-rails/blob/master/docs/product_details.png)

!["Screenshot of cart"](https://github.com/brodybayley/jungle-rails/blob/master/docs/cart.png)

## Setup

1. Run `bundle install` to install dependencies
2. Run `bin/rake db:reset` to create, load and seed db
3. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
