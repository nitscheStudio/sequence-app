# Sequence App Backend

The backend of the Sequence App powers the online sample library for music producers, handling sample uploads, likes, users and downloads.

## Getting Started

These instructions will guide you on how to get a copy of the backend running on your local machine for development and testing purposes.

### Prerequisites

-   **[Docker](https://www.docker.com/)**: Ensure Docker is installed on your system. Docker will handle the PHP environment, web server, and MySQL database through containers.

Verify Docker installation by running `docker --version` in your terminal.

### Installing with Docker

1. **Clone the repository** to your local machine (if not available already ).

    ```bash
    git clone https://github.com/nitscheStudio/sequence-app.git
    ```

2. Navigate to the project directory where the docker-compose.yml file is located.

```bash
docker-compose up -d
```

3. Set up your environment by copying the .env.example file to a new file named .env, and adjust the environment variables as necessary. Docker-specific settings (like database host, user, and password) should match those defined in your docker-compose.yml.

4. Install PHP dependencies with Composer. You can run Composer commands through Docker by executing:

```bash
docker-compose exec app composer install
```

5. Generate an application key.

```bash
docker-compose exec app php artisan key:generate
```

7. ### Importing the Database Dump

If you prefer to start with a pre-populated database, a dump file is included in the project. To import this dump into your Docker-managed MySQL database, follow these steps:

1. Ensure your Docker containers are running, especially the database container.

2. Import the dump file into your MySQL database using the following command:

Replace "your-mysql-container-name" with your actual container name.

```bash
docker exec -i [your-mysql-container-name] mysql -u[sail] -p[password] [sequence_app] < /app/database./dumps/sequence_app2024-02-25.sql
```

## Usage

After setting up the backend, you can start using the API to manage music samples.
Please use the install the frontend application to interact with the Sequence backend.

## Author

-   **Keno Nitsche** - [nitscheStudio](https://github.com/nitscheStudios)
