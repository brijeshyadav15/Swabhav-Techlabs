﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCore.Entity_Framework.Repository
{
    interface IRepository<T>
    {
        void Add(T entity);

        IQueryable<T> Get();
    }
}
