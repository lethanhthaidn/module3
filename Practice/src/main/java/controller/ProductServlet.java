package controller;

import bean.Products;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//import static service.ProductServiceImpl.productsMap;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "update":
                showUpdate(request, response);
                break;
            case "view":
                break;
            case "delete":
                delete(request, response);
                break;
            case "list":
            default:
                showList(request, response);
        }

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> productsList = productService.findAll();
        request.setAttribute("list", productsList);
        request.getRequestDispatcher("product/list_jstl.jsp").forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/create.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        response.sendRedirect("/product?action=list");
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id",id);
        request.getRequestDispatcher("product/update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "update":
                update(request, response);
                break;
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String dateRelease = request.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateOfRelease = null;
        try {
            dateOfRelease = format.parse((dateRelease));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        productService.create(new Products(id, name, brand, price, quantity, dateOfRelease));
        response.sendRedirect("/product?action=list");
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String dateRelease = request.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date dateOfRelease = null;
        try {
            dateOfRelease = format.parse((dateRelease));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        productService.update(new Products(id, name, brand, price, quantity, dateOfRelease));
        response.sendRedirect("/product?action=list");

    }
}
