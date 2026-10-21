
package com.college.dao;

import com.college.model.Student;
import com.college.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import org.mindrot.jbcrypt.BCrypt;

public class StudentDAO {

    public boolean register(Student student) {

        Transaction tx = null;

        try (Session session =
                HibernateUtil.getSessionFactory().openSession()) {

            tx = session.beginTransaction();

            Query<Long> query = session.createQuery(
                "select count(s) from Student s " +
                "where s.email = :email " +
                "or s.rollNumber = :roll",
                Long.class
            );

            query.setParameter("email", student.getEmail());
            query.setParameter("roll", student.getRollNumber());

            if (query.uniqueResult() > 0) {
                tx.rollback();
                return false;
            }

            student.setPasswordHash(
                BCrypt.hashpw(
                    student.getPasswordHash(),
                    BCrypt.gensalt(12)
                )
            );

            session.persist(student);
            tx.commit();

            return true;

        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }

            e.printStackTrace();
            return false;
        }
    }

    public Student login(String email, String password) {

        try (Session session =
                HibernateUtil.getSessionFactory().openSession()) {

            Query<Student> query = session.createQuery(
                "from Student s where s.email = :email",
                Student.class
            );

            query.setParameter("email", email);

            Student student = query.uniqueResult();

            if (student != null &&
                BCrypt.checkpw(
                    password,
                    student.getPasswordHash()
                )) {

                return student;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
