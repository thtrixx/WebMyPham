package vn.cosmetics.controller.admin;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.cosmetics.model.Transactions;
import vn.cosmetics.service.TransactionService;
import vn.cosmetics.service.impl.TransactionServicesImpl;
import vn.cosmetics.model.Catalog;
import vn.cosmetics.service.CategoryService;
import vn.cosmetics.service.impl.CategoryServicesImpl;
import vn.cosmetics.model.Ordered;
import vn.cosmetics.model.Product;
import vn.cosmetics.service.OrderedService;
import vn.cosmetics.service.ProductService;
import vn.cosmetics.service.impl.OrderedServiceImpl;
import vn.cosmetics.service.impl.ProductServiceImpl;

public class AdminHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TransactionService transactionService = new TransactionServicesImpl();
	CategoryService categoryService = new CategoryServicesImpl();
	OrderedService orderService = new OrderedServiceImpl();
	DecimalFormat df = new DecimalFormat("#.000");
    public AdminHomePage() {
        super();
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proday=0;
		double salesday=0;
		int promonth=0;
		double salesmonth=0;
		List<Catalog> listcate = categoryService.getAll();
		List<Ordered> listorder = orderService.getAll();
		List<Transactions> transactionList = transactionService.getByDay(); 
		List<Transactions> transactionList1 = transactionService.getByMonth(); 
		int n= transactionList.size();
		int m= transactionList1.size();
		
		for(Transactions tran: transactionList ) {
			for (Ordered  item: listorder ) {
				if (Integer.parseInt(item.getTransaction_id())==tran.getId())
					proday =proday + item.getQty();
			}
			salesday= salesday + Double.parseDouble(tran.getAmount());
		}
		
		for(Transactions tran: transactionList1 ) {
			for (Ordered  item: listorder ) {
				if (Integer.parseInt(item.getTransaction_id())==tran.getId())
					promonth =promonth + item.getQty();
			}
			salesmonth= salesmonth + Double.parseDouble(tran.getAmount());
		}

		request.setAttribute("orderbyday",transactionList); 
		request.setAttribute("countorderbyday",n);
		request.setAttribute("countorderbymonth",m);
		request.setAttribute("countprobyday",proday);
		request.setAttribute("countprobymonth",promonth);
		request.setAttribute("salesday",df.format(salesday));
		request.setAttribute("salesmonth",df.format(salesmonth));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/index.jsp");
		dispatcher.forward(request,response);
	}
	
	public static void main(String[] args) throws Exception {
		String date=java.time.LocalDate.now().toString();
		TransactionService transactionService = new TransactionServicesImpl();
		List<Transactions> transactionList1 = transactionService.getByMonth(); 
		int n= transactionList1.size();
		System.out.println(transactionList1);
		System.out.println(n);

}

}
