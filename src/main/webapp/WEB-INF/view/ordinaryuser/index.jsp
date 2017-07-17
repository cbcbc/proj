<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="E-SHOP, Bootstrap Web Templates" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>首页</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/index.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!--top-header-->
        <div class="top-header">
            <div class="container">
                <div class="top-header-main">
                    <div class="col-md-6 top-header-left">
                        <div class="drop">
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-6 top-header-left">
                        <div class="cart box_1">
                            <a href="checkout.html">
                                <div class="total">
                                    <img src="images/user.png" />
                                    <span>${nickname}</span>&nbsp;&nbsp;- <span>${role_type}</span>
                                </div>
                            </a>
                            <div id="user_info">
                                <ul>
                                    <a href=""><li class="personal">个人资料</li></a>
                                    <a href=""><li class="personal">查看订单</li></a>
                                    <a href="logout"><li class="personal">退出</li></a>
                                </ul>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--top-header-->
        <!--start-logo-->
        <div class="logo">
            <a href="#"><h1>E-SHOP</h1></a>
        </div>
        <!--start-logo-->
        <!--prdt-starts-->
        <div class="prdt" style="padding-top:50px">
            <div class="container">
                <div class="prdt-top">
                    <div class="col-md-9 prdt-left">
                        <div class="product-one">
                            <div class="col-md-4 product-left p-left">
                                <div class="product-main simpleCart_shelfItem" style="padding-bottom: 16px">
                                    <a href="single.html" class="mask"><img class="img-responsive zoom-img" src="images/cloth-1.png" alt="" /></a>
                                    <div class="product-bottom">
                                        <h3><a href="#" style="color: black">名表</a></h3>
                                        <p style="line-height: 20px; padding-top: 5px"><a href="#">查看详情</a></p>
                                        <h4>
                                            <span class="item_price" style="text-decoration: line-through">$ 329</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <span class="item_price">$ 329</span>
                                        </h4>
                                        <a href="#">购买该商品</a>
                                    </div>
                                    <div class="srch srch1">
                                        <span>-50%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 product-left p-left">
                                <div class="product-main simpleCart_shelfItem">
                                    <a href="single.html" class="mask"><img class="img-responsive zoom-img" src="images/cloth-1.png" alt="" /></a>
                                    <div class="product-bottom">
                                        <h3>Smart Watches</h3>
                                        <p>Explore Now</p>
                                        <h4><a class="item_add" href="#"><i></i></a> <span class=" item_price">$ 329</span></h4>
                                    </div>
                                    <div class="srch srch1">
                                        <span>-50%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-3 header-right" style="padding-bottom: 20px; padding-left: 0px; z-index: 1">
                        <div class="search-bar" style="border: 1px solid #ECECEC">
                            <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                            <input type="submit" value="">
                        </div>
                    </div>
                    <div class="col-md-3 prdt-right">
                        <div class="w_sidebar">
                            <section  class="sky-form">
                                <h4>商品类目</h4>
                                <div class="row1 scroll-pane" style="height: auto">
                                    <div class="col col-4">
                                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>所有商品</label>
                                    </div>
                                    <div class="col col-4">
                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>衣</label>
                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>食</label>
                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>住</label>
                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>行</label>
                                        <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>其他</label>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--product-end-->
        <!--footer-starts-->
        <div class="footer" style="margin-top: 30px">
            <div class="container">
                <div class="footer-top">
                    <div class="col-md-6 footer-left">
                    </div>
                    <div class="col-md-6 footer-right">
                        <p>Copyright &copy; 2015. CMB All rights reserved.</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--footer-end-->

        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
    </body>
</html>