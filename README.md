# Library of Babel

## Description

API part of app that help you create your own virtual library. Rate and review books. Manage collections of books that you read, are reading or want to read.

## Live demo

A live demo can be viewed here:
<https://library-of-babel.netlify.app/>

## How to set up project locally

### Requirements

- Ruby 3.0+
- Git
- Account in Cloudinary service
- Set up of frontend project: <https://github.com/Skonry/library-of-babel-front>

### Installation

1. Clone the repo locally:
`git clone https://github.com/Skonry/library-of-babel-api.git`

2. Navigate to project directory:
`cd library-of-babel-api`

3. Create the database.yml file

4. Install the gems:
`bundle install`

5. Create and seed the database: 
`rails db:create`
`rails db:migrate`
`rails db:seed`

6. Create account in Cloudinary service

7. Start app:
`rails server`

8. Set up frontend part of app if it isn't already done.