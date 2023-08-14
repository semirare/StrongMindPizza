
# StrongPizza
Welcome to **StrongPizza**, a web application to help you build and manage delicious pizzas and toppings.  Built using Ruby on Rails 7 and Ruby 3 with PostgreSQL as the database.

## Getting Started

These instructions will help you set up and run the project on your local machine for development and testing purposes.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/) (version 3.2.2)
- [PostgreSQL](https://www.postgresql.org/) (version 10 or higher)
- [Bundler](https://bundler.io/) (for managing Ruby gems)

### Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/semirare/StrongMindPizza.git
   cd StrongMindPizza
   ```

2. Install Ruby gems:

   ```shell
   bundle install
   ```

3. Set up the database:

   ```shell
   rails db:setup
   ```

   Please be aware that you will need to be using a psql user with superuser permissions. If you need to create one, the following can be 
   run.

   ```shell
   sudo -u postgres createuser --interactive
   ```
   
   Select y when asked to give superuser permissions.

### Usage

1. Start the Rails server:

   ```shell
   rails server
   ```

2. Open your web browser and visit [http://localhost:3000](http://localhost:3000) to see the app in action.

### Running Tests

You can run tests using the following command:

   ```shell
   rails test
   ```

Note that this will not run the system tests. System tests can be run with:

   ```shell
   rails test:system
   ```

or the full suite can be run with

   ```shell
   rails test && rails test:system
   ```

### Deployment

The project is deployed on Heroku here(https://strong-mind-pizza-63c863b9651a.herokuapp.com/)

### License

This project is licensed under the [MIT License](LICENSE).

---

Happy coding! 🚀
```
