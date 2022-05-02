package service;

import bean.Products;

import java.util.List;

public interface ProductService {
    void create(Products products);
    void update(Products products);
    void delete(Integer id);
    List<Products> findAll();
    Products findById(Integer id);
}
