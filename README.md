## Description

Franchyz API is a Ruby on Rails API for a sport team management app.

You should find the React front-end here : https://github.com/TacosTHP/Franchyz

## Version

Ruby 2.7.1
Rails 6.0.3.1

## Installation

`git clone https://github.com/TacosTHP/FranchyzAPI.git`

`cd FranchyzAPI`

`bundle install`

`echo DEVISE_JWT_SECRET_KEY=\"$(rake secret)\" > .env`

`rails db:create && rails db:migrate`

`rails s`

Your API is now running on http://localhost:3000