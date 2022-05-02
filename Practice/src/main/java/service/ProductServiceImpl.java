package service;

import bean.Products;

import java.util.*;

public class ProductServiceImpl implements ProductService{
    private static Map<Integer, Products> productsMap;
     static {
         productsMap = new HashMap<>();
         productsMap.put(1, new Products(1,"iphone", "apple", 8.0, 10, new Date()));
         productsMap.put(2, new Products(2,"samsung", "samsung", 7.0, 9, new Date()));
         productsMap.put(3, new Products(3,"sony", "sony", 6.0, 8, new Date()));
         productsMap.put(4, new Products(4,"nokia", "nokia", 5.0, 7, new Date()));
         productsMap.put(5, new Products(5,"xiaomi", "xiaomi", 4.0, 6, new Date()));
     }
    @Override
    public void create(Products products) {
         if(!productsMap.containsKey(products.getId())) {
             productsMap.put(products.getId(), products);
         }
    }

    @Override
    public void update(Products products) {
        if (productsMap.containsKey(products.getId())){
            productsMap.put(products.getId(), products);
        }
    }

    @Override
    public void delete(Integer id) {
        if (productsMap.containsKey(id)){
            productsMap.remove(id);
        }
    }

    @Override
    public List<Products> findAll() {
        return new ArrayList<>(productsMap.values());
    }

    @Override
    public Products findById(Integer id) {
        if (productsMap.containsKey(id)){
            return productsMap.get(id);
        }
        else {return null;}
    }
}
