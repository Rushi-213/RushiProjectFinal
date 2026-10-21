
package com.college.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory =
            buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        Configuration config = new Configuration();
        config.configure("hibernate.cfg.xml");

        config.setProperty(
            "hibernate.connection.url",
            System.getenv("DB_URL")
        );

        config.setProperty(
            "hibernate.connection.username",
            System.getenv("DB_USERNAME")
        );

        config.setProperty(
            "hibernate.connection.password",
            System.getenv("DB_PASSWORD")
        );

        return config.buildSessionFactory();
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
