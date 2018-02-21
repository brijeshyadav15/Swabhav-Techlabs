﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleRepository_App
{
    class StudentRepository
    {
        private HiTechDbContext _db;

        public StudentRepository(HiTechDbContext db)
        {
            _db = db;
        }

        public void Add(Student student)
        {
            _db.Students.Add(student);
            _db.SaveChanges();
        }

        public IQueryable<Student> Get()
        {
            return _db.Students;
        }

        public IQueryable<Student> Find(Expression<Func<Student, bool>> query)
        {
            return _db.Students.Where(query);
        }
    }
}
