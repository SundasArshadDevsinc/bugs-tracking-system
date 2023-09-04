# Bugzilla - Bug Tracking System

This repository contains the code for a Bug Tracker System, which allows users to sign up, log in, and manage bugs and projects. The system is designed to facilitate bug tracking and project management within a development team.

## Table of Contents

- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Features](#features)


## Dependencies

To run this project, make sure you have the following dependencies installed:

- Ruby v2.7.8
- Rails v5.2.8.1


You can install Ruby using tools like RVM or rbenv. For Rails, you can use the gem installer:

```bash
gem install rails -v 5.2.8.1
```
## Getting Started

Follow these steps to set up the project on your local machine:

1. **Clone this repository:**

    ```bash
    git clone 
    cd bugtrackingsystem
    ```

2. **Install gem dependencies:**

    ```bash
    bundle install
    ```

3. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Start the server:**

    ```bash
    rails server
    ```

5. **Access the application in your browser at http://localhost:3000.**


## Features
The Bug Tracker System includes the following key features:

- **User Management:**
   - Users can sign up with their name, email, password, and user type (developer, manager, or QA).
   - Users can log in and log out.

- **Project Management:**
  - Managers can create projects and add users to them.
  - Projects can have multiple users.
  - Projects can have multiple bugs associated with them.

- **Bug Tracking:**
  - Users can report bugs by providing a unique title, type (feature or bug), and status (new, started, completed for features; new, started, resolved for bugs).
  - Bugs can have a descriptive description, a deadline, and a screenshot (in .png or .gif format).
  - Bugs are associated with a creator (user), a developer (user), and a project.


