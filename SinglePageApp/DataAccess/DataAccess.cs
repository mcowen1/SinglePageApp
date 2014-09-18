using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class DataAccess2
{
    public static List<Employees> Toggle_Employee_Active_Status(int ID)
    {
        List<Employees> emp = GetEmployeesList();
        int n = emp.Count;
        for (int i = 0; i < n; i++)
        {
            if (emp[i].ID == ID)
            {
                emp[i].IsActive = !emp[i].IsActive;
            }
        }
        return emp;
    }


    public static List<Departments> GetDepartments()
    {
        List<Departments> dept = new List<Departments>();

        Departments f = new Departments();
        {
            f.DeptID = 0;
            f.DepartmentName = "< Select Department >";
        }
        Departments a = new Departments();
        {
            a.DeptID = 1;
            a.DepartmentName = "Production";
        }
        Departments b = new Departments();
        {
            b.DeptID = 2;
            b.DepartmentName = "Quality Control";
        }
        Departments c = new Departments();
        {
            c.DeptID = 3;
            c.DepartmentName = "Human Resourses";
        }
        Departments d = new Departments();
        {
            d.DeptID = 4;
            d.DepartmentName = "Material Handling";
        }
        Departments e = new Departments();
        {
            e.DeptID = 5;
            e.DepartmentName = "Finance";
        }

        dept.Add(f);
        dept.Add(a);
        dept.Add(b);
        dept.Add(c);
        dept.Add(d);
        dept.Add(e);

        return dept;
    }

    public static List<Employees> GetEmployeesList()
    {
        List<Employees> emp = new List<Employees>();
        Employees a = new Employees();
        {
            a.ID = 1;
            a.FirstName = "Mike";
            a.LastName = "Brown";
            a.DeptID = 3;
            a.Name = "Human Resourses";
            a.Email = "MikeBrown@thecompany.com";
            a.IsActive = true;
        }
        Employees b = new Employees();
        {
            b.ID = 2;
            b.FirstName = "Fred";
            b.LastName = "Jones";
            b.DeptID = 5;
            b.Name = "Finance";
            b.Email = "FredJones@thecompany.com";
            b.IsActive = true;
        }
        Employees c = new Employees();
        {
            c.ID = 3;
            c.FirstName = "John";
            c.LastName = "Snail";
            c.DeptID = 4;
            c.Name = "Material Handling";
            c.Email = "FredJones@thecompany.com";
            c.IsActive = true;
        }
        Employees d = new Employees();
        {
            d.ID = 4;
            d.FirstName = "Adam";
            d.LastName = "Smith";
            d.DeptID = 1;
            d.Name = "Production";
            d.Email = "adamsmith@thecompany.com";
            d.IsActive = true;
        }
        Employees e = new Employees();
        {
            e.ID = 5;
            e.FirstName = "Jane";
            e.LastName = "Bird";
            e.DeptID = 2;
            e.Name = "Quality Control";
            e.Email = "janebird@thecompany.com";
            e.IsActive = true;
        }

        emp.Add(a);
        emp.Add(b);
        emp.Add(c);
        emp.Add(d);
        emp.Add(e);
      
        return emp;
    }

    public static Employees FindEmployeeRecord(int ID)
    {
        List<Employees> emp = GetEmployeesList();
        Employees e = new Employees();
        int n = emp.Count();
        for (int i = 0; i < n; i++)
        {
            e = emp[i];
            if (e.ID == ID)
            {
                return emp[i];
            }
        }
        return null;
    }
}
