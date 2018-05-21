# url_generator

Running Locally:

1. Make sure you migrate the table into your local environment  
```
$> rake db:migrate
```

2. Running rails server in port 3000, this should be accessible in localhost:3000
```
$> rails s -b 0.0.0.0
```
2. To run the test make sure you migrate the tables in the test environment
```
$> rake db:migrate RAILS_ENV=test
```
3. To run specs
```
$> rspec
```
