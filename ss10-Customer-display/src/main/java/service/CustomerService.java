package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    void create(Customer customer);
    List<Customer> getAll();
}
