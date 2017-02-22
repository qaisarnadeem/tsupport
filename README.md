# tSupport

## About
Discover what your customers want. Change the meaning of customer support by adapting to the best industry standards of customer support management.

## Content
- [Requirements](#requirements)
- [Installation](#installation)

## Requirements

- NodeJs >= 6.3.1
- Ruby = 2.3.1
- rails 5.0
- mysql



## Installation

Note: These installation steps assume you have setup rails environment prerequists already. If you want to configure your machine for rails head to [Install Rails](http://railsapps.github.io/installing-rails.html)
and follow the instructions as per you OS

1. Move to the directory and install gem dependencies
    ```bash
    cd tsupport
    bundle install
    ```

2. Migrate the database
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed #this will ask for admin user email and password
    ```

3. Install angular2 for frontend

    ```bash
    npm run postinstall
    ```

## Run the app

1. Run the rails server in the main directory with
    ```bash
    rails server
    ```

2. Open [http://localhost:3000](http://localhost:3000) in your browser
