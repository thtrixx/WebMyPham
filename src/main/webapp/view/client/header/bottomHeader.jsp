

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url" />
<div class="aa-header-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="aa-header-bottom-area">
					<h1 class=" text text-center">CỬA HÀNG MỸ PHẨM CHÍNH HÃNG TOÀN QUỐC TUTU
						STORE</h1>
					<!-- cart box -->
					<div class="aa-cartbox">
						<a class="aa-cart-link"
							href="${pageContext.request.contextPath}/view/client/cart"> <span
							class="fas fa-cart-arrow-down"></span> <span
							class="aa-cart-title">Giỏ hàng</span> <c:if
								test="${length_order != NULL}">
								<span class="aa-cart-notify">${length_order}</span>
							</c:if>
						</a>
						<div class="aa-cartbox-summary">
							<ul class="scroll-product">
								<c:forEach items="${order.items}" var="item">
									<li><a class="aa-cartbox-img"
										href="${pageContext.request.contextPath}/view/client/cart"><img
											src="${item.product.image_link}" alt="img"></a>
										<div class="aa-cartbox-info">
											<h4>
												<a
													href="${pageContext.request.contextPath}/view/client/cart">${item.product.name}</a>
											</h4>
											<p>${item.qty}x${item.product.price * (1-((item.product.discount)/100))}00
												VNĐ</p>
										</div></li>
								</c:forEach>
							</ul>
							<div class="total-detailproduct">
								<span class="aa-cartbox-total-title"> <b>Tổng:</b>
								</span> <span class="aa-cartbox-total-price"> ${sumprice} VNĐ </span>
							</div>
							<a class="aa-cartbox-checkout aa-primary-btn"
								href="${pageContext.request.contextPath}/view/client/cart">Chi tiết</a>
							<a class="aa-cartbox-checkout aa-primary-btn"
								href="${pageContext.request.contextPath}/view/client/checkout">Thanh toán</a>
						</div>
					</div>
					<!-- / cart box -->

				</div>
			</div>
		</div>
	</div>
</div>

