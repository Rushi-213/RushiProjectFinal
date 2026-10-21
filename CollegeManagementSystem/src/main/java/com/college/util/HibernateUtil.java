
package com.college.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory =
            buildSessionFactory();

    private static SessionFactory buildSessionFactory() {

        String dbUrl = System.getenv("DB_URL");
        String dbUsername = System.getenv("DB_USERNAME");
        String dbPassword = System.getenv("DB_PASSWORD");

        // Check whether environment variables are available
        if (dbUrl == null || dbUrl.isBlank()
                || dbUsername == null || dbUsername.isBlank()
                || dbPassword == null || dbPassword.isBlank()) {

            throw new IllegalStateException(
                "Database environment variables are missing. "
                + "Check DB_URL, DB_USERNAME, and DB_PASSWORD in Render."
            );
        }

        // Load Hibernate configuration
        Configuration config = new Configuration();
        config.configure("hibernate.cfg.xml");

        // Override database connection settings
        config.setProperty(
            "hibernate.connection.driver_class",
            "org.postgresql.Driver"
        );

        config.setProperty(
            "hibernate.connection.url",
            dbUrl
        );

        config.setProperty(
            "hibernate.connection.username",
            dbUsername
        );

        config.setProperty(
            "hibernate.connection.password",
            dbPassword
        );

        // Create SessionFactory
        return config.buildSessionFactory();
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
