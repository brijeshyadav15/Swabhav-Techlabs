﻿using System;

namespace SRPViolationApp
{
    class Invoice
    {
        private String _id;
        private String _name;
        private double _cost;
        private double _discount;
        private static double GST = 5;

        public Invoice(String id, String name, double cost, double discount)
        {
            _id = id;
            _name = name;
            _cost = cost;
            _discount = discount;
        }

        public String Id
        {
            get
            {
                return _id;
            }
        }

        public String Name
        {
            get
            {
                return _name;
            }
        }

        public double Cost
        {
            get
            {
                return _cost;
            }
        }

        public double Discount
        {
            get
            {
                return _discount;
            }
        }

        private double CalculateDiscount()
        {
            return Math.Abs(Discount - Cost);
        }

        private double CalculateTax()
        {
            return GST * (Cost - CalculateDiscount());
        }

        private double CalculateTotal()
        {
            return (Cost - Discount) + CalculateTax();
        }

        public void printInvoice()
        {
            Console.WriteLine("Invoice ID :" + Id);
            Console.WriteLine("Customer name :" + Name);
            Console.WriteLine("Cost Price :" + Cost);
            Console.WriteLine("Discounted Price :" + CalculateDiscount());
            Console.WriteLine("Tax on this product :" + CalculateTax());
            Console.WriteLine("Total :" + CalculateTotal());
        }
    }
}
