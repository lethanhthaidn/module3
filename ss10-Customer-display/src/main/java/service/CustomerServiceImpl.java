package service;

import model.Customer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static List<Customer> customers = new ArrayList<Customer>();

    static{
        try {
            customers.add(new Customer("Thai", new SimpleDateFormat("dd-MM-yyyy").parse("01/01/1995"), "Da Nang", "url"));
            customers.add(new Customer("Quoc", new SimpleDateFormat("dd-MM-yyyy").parse("01/01/1991"), "Da Nang", "url"));
            customers.add(new Customer("HIeu", new SimpleDateFormat("dd-MM-yyyy").parse("01/01/1995"), "Da Nang", "url"));
            customers.add(new Customer("Ha", new SimpleDateFormat("dd-MM-yyyy").parse("01/01/1995"), "Da Nang", "url"));
            customers.add(new Customer("Thuan", new SimpleDateFormat("dd-MM-yyyy").parse("01/01/1995"), "Da Nang", "url"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void create(Customer customer) {
        customers.add(customer);
    }

    @Override
    public List<Customer> getAll() {
        return customers;
    }
}

