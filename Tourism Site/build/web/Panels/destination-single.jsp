<%-- 
    Document   : offer-single
    Created on : Jun 16, 2019, 3:16:49 AM
    Author     : DigitalForce™
--%>

<%@page import="java.util.Base64"%>
<%@page import="DBConnection.DB_Primary"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="LogReg Forms/login.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Destination</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
    
    
    
    <%
        String se_view = "none";
        String se_view2 = "block";
        String name = "No-Name";
        String role = "No-Role";
        String country = "No";
        String email = "No";
        
        
            if(request.getSession().getAttribute("username") == null || request.getSession().getAttribute("username").equals("")){
                se_view = "block";
                se_view2 = "none";
            } else {
                se_view = "none";
                se_view2 = "block";
                name = request.getSession().getAttribute("username").toString();
                role = request.getSession().getAttribute("user-role").toString();
                
                email = request.getSession().getAttribute("email").toString();
            }
            
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String encode = "no";
        
        String id = request.getParameter("i");
        int Id = Integer.parseInt(id);
        
        
        try {
            con = DB_Primary.getConnection();
            st = con.createStatement();
        
        }catch(Exception ex){
            
        }
    %>
    
    <style type="text/css">
        
        @import url('https://fonts.googleapis.com/css?family=Bahianita&display=swap');
        
        #brand {
            font-family: 'Bahianita', cursive;
            color:white; 
            border: 4px solid white; 
            padding: 10px;
            letter-spacing: 3px;
        }
        
    </style>

</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="dorne-load"></div>
    </div>

    <!-- ***** Search Form Area ***** -->
    <div class="dorne-search-form d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-close-btn" id="closeBtn">
                        <i class="pe-7s-close-circle" aria-hidden="true"></i>
                    </div>
                    <form action="#" method="get">
                        <input type="search" name="caviarSearch" id="search" placeholder="Search Your Desire Destinations or Events">
                        <input type="submit" class="d-none" value="submit">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Header Area Start ***** -->
    <header class="header_area" id="header" style="background-color: rgba(0,0,0,0.8)">
        <div class="container-fluid h-100" >
            <div class="row h-100">
                <div class="col-12 h-100">
                    <nav class="h-100 navbar navbar-expand-lg">
                        <a class="navbar-brand" href="index.jsp"><h3 id="brand">lankaGUIDE</h3></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        <div class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Explore <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="destinations.jsp" >Destinations</a>
                                        <a class="dropdown-item" href="hotels_rest.jsp">Hotels</a>
                                        <a class="dropdown-item" href="offers.jsp">Offers</a>
                                        <a class="dropdown-item" href="events.jsp">Events</a>
                                        
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="explore.html">About Us</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contactUs.jsp">Contact Us</a>
                                </li>
                            </ul>
                            
                            <!-- Signin btn -->
                            <div class="dorne-signin-btn">
                                <a href="user-profile.jsp" class="btn btn-warning" style="display: <%=se_view2%>"><%=name%> </a>
                                <a href="LogReg Forms/login.jsp" class="btn btn-primary" style="display: <%=se_view%>">Sign in </a>
                                
                                <a href="<%=request.getContextPath()%>/SessionInvalidate" class="btn btn-dark" style="display: <%=se_view2%>">Sign Out</a>
                            </div>
                            <!-- Add listings btn -->
                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area height-700 bg-img bg-overlay" style="background-image: url(img/bg-img/tea5.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <div class="map-ratings-review-area d-flex">
                            
                            <a href="#"><i class="fas fa-map-signs"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <% 
                rs = st.executeQuery("Select * from destinations where ID = "+Id+" ");
                if(rs.next()){
                    byte[] imgData = rs.getBytes("Image"); // blob field 
                                if(imgData==null){
                                    encode = "Nothing";
                                } else {
                                    encode = Base64.getEncoder().encodeToString(imgData);
                                    request.setAttribute("imgBase", encode);
                                }
                                
                %>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Single Listing Area Start ***** -->
    <section class="dorne-single-listing-area section-padding-100" style="background-color: #00cccc;">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Listing Content -->
                <div class="col-12 col-lg-8">
                    <div class="single-listing-content">

                        <div class="listing-title">
                            <h4><%=rs.getString("Name")%></h4>
                            <h6><%=rs.getString("Venue")%></h6>
                        </div>

                        

                        <div class="overview-content mt-50" id="overview">
                            <div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.4s">
                                <img src='data:image/jpeg;base64,${imgBase}' alt="">
                                <div class="editors-pick-info">
                                    <div class="places-total-destinations d-flex">
                                        <a href="#"><%=rs.getString("Name")%></a>
                                        <a href="#">943 Rating</a>
                                    </div>
                                    <div class="add-more">
                                        <a href="#">+</a>
                                    </div>
                                </div>
                            </div>
                            <p><%=rs.getString("Description")%></p>
                        </div>

                        

                        

                        

                    </div>
                </div>

                <!-- Listing Sidebar -->
                <div class="col-12 col-md-8 col-lg-4">
                    <div class="listing-sidebar">

                        <!-- Listing Verify -->
                        <div class="listing-verify">
                            <a href="#" class="btn dorne-btn w-100"><i class="fa fa-check pr-3"></i> Verified Listing</a>
                        </div>

                       

                        

                        <!-- Author Widget -->
                        <div class="author-widget mt-50 d-flex align-items-center">
                            <img src="img/clients-img/1.jpg" alt="">
                            <div class="authors-name">
                                <a href="#">Admin</a>
                                <p>The Author</p>
                            </div>
                        </div>

                        

                    </div>
                </div>
                
                    <div class="listing-sidebar">
                        <h3>Comment Here</h3>
                        <form  action="<%=request.getContextPath()%>/Comment" method="POST">
                            <div class="row">
                            <div class="col-12 col-md-6">
                                <input type="text" name="sender" class="form-control" placeholder="Your Name">
                            </div>

                            <div class="col-12">
                                <textarea name="description" class="form-control" id="Message" cols="30" rows="10" placeholder="Your Message"></textarea>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn dorne-btn">Send</button>
                            </div>
                            </div>

                        
                        </form>
                        <br><br>
                        <h3>Comments</h3> 
                        <%
                        int l = 0;
                        rs = st.executeQuery("Select COUNT(*) from contact_messages");
                        if(rs.next()){
                            l = rs.getInt(1)+20;
                        }
                        for(int i =0; i<l; i++){
                            rs = st.executeQuery("Select * from contact_messages where ID = "+(i+1)+"");
                            if(rs.next()){
                                
                                %>
                        <P>From _<%=rs.getString(4)%></p>
                        <div class="col-12">
                            <input type="text" value="<%=rs.getString(3)%>"  class="form-control" id="Message" cols="30" rows="10" placeholder="Your Message" readonly>
                        </div>
                        <%}} %>
                    </div>
                
            </div>
        </div>
    </section>
    <% 
        }
    %>
    <!-- ***** Single Listing Area End ***** -->

    <!-- ****** Footer Area Start ****** -->
    <footer class="dorne-footer-area" style="background-color: black">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 d-md-flex align-items-center justify-content-between">
                    <div class="footer-text">
                        <p>
                            
                            H.Inc Cooperation

                        </p>
                    </div>
                    <div class="footer-social-btns">
                        <a href="#"><i class="fa fa-linkedin" aria-haspopup="true"></i></a>
                        <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-haspopup="true"></i></a>
                        <a href="#"><i class="fa fa-facebook" aria-haspopup="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ****** Footer Area End ****** -->

    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/others/plugins.js"></script>
    <!-- Google Maps js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk9KNSL1jTv4MY9Pza6w8DJkpI_nHyCnk"></script>
    <script src="js/google-map/location-map-active.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>
</body>

</html>
