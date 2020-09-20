# Udacity-Data-Engineering

This project is developed based on [san089/Udacity-Data-Engineering-Projects](https://github.com/san089/Udacity-Data-Engineering-Projects). 

For project 1 and 2, in order to make it easier to setup and run, I dockerize Jupyter, Postgres, Cassandra, so you can have an isolated playground environment.

## To start

1. Download Docker if you don't have Docker intalled. You can download it at [here](https://www.docker.com/products/docker-desktop)
2. Run `docker-compose up --build`
3. To access Jupyter, open up another terminal and cd into the same directory. Run `docker-compose logs jupyter` and look for something like:
```
jupyter_1      |     To access the notebook, open this file in a browser:
jupyter_1      |         file:///home/jovyan/.local/share/jupyter/runtime/nbserver-6-open.html
jupyter_1      |     Or copy and paste one of these URLs:
jupyter_1      |         http://805700573b7d:8888/?token=787bb445bc8c2ef2cf9f9e258817619627df94de751e1e46
jupyter_1      |      or http://127.0.0.1:8888/?token=787bb445bc8c2ef2cf9f9e258817619627df94de751e1e46
```
