# Cheko
Cheko is a restaurant system that allows users to browse through the menu


### To run the Application 
1. locate inside `/Docker-Compose folder `
2. run the command: ` docker-compose up --build  `

This should run the three components, Db, backend and frontend.

To test the **app**, go to http://localhost:3000/

To test the **backend APIs**, http://localhost:8002/services 
* `/ ` : healthcheck
* `/categories ` : get all categories 
* `/branches` : get all branches and their info  
* `/menuItems` : get all menu items 
* `/menuItems/secondHighest` : get the secondHighest meal in each category

### Repo Components: 
* #### Database 
  The database is a Postgres DB, contains the core information for Cheko restaurant,
  this component is the backbone layer of Cheko System, and it handles the data of the system.

The DB contains 4 main tables, see below

* menu_items
  ```sql
    (
        id   bigint not null
        primary key,
        name        varchar(255)  not null,
        description varchar(255),
        calories    integer,
        price       double precision,
        category_id bigint references categories
    )
  ```


* categories
  ```sql
    (
    id  bigint not null
    primary key,
    name varchar(255)  not null unique
     )
  ```

* branches
  ```sql
    (
    id  bigint not null
    primary key,
    district      varchar(255)    not null,
    opening_hours varchar(255)    not null,
    latitude      double precision  not null,
    longitude     double precision  not null
    )
  ```


* menu_item_branches
  ```sql
    (
        menu_item_id integer not null
        references menu_items,
        branch_id    integer not null references branches,
        primary key (menu_item_id, branch_id)
    )
  ```

<div style="page-break-after: always;"></div>


* #### Backend
    The backend is a Spring-Boot web application, serving multiple (Application Programming Interface) APIs for Cheko restaurant, 
    this component is the second layer of Cheko System, and it handles the logic of the system, integrated with cheko-database


* #### Frontend 
  The frontend is a react-native web application, serving multiple user inter-faces UIs for Cheko restaurant,
  this component is the second layer of Cheko System, and it handles the UI of the system, integrated with cheko-backend


* #### Docker Compose 
   This folder contains all dependencies needed by docker to run the application.

    | File Name          | Description                                                             |
    |--------------------|-------------------------------------------------------------------------|
    | Backend            | Folder, contains all needed files (build) and DockerFile to run the app |
    | Frontend           | Folder, contains all needed files (build) and DockerFile to run the app |
    | cheko.sql          | File, contains a snapshot of cheko's data                               |
    | docker-compose.yml | File, contains docker configurations                                    |

