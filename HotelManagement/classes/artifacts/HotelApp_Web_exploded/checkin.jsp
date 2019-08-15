<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Hotel Maharishi</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/checkin.css">
<link rel="script" href="resources/css/modal.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/checkin.js"></script>
<style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
<body class="chkin-light-grey">

<!-- Navigation Bar -->
<div class="chkin-bar chkin-white chkin-large">
    <a href="#" class="chkin-bar-item chkin-button chkin-red chkin-mobile"><i class="fa fa-bed chkin-margin-right"></i>Attendant</a>
    <a href="#rooms" class="chkin-bar-item chkin-button chkin-mobile">Rooms</a>
    <a href="#about" class="chkin-bar-item chkin-button chkin-mobile">Information</a>
    <a href="#contact" class="chkin-bar-item chkin-button chkin-mobile">Messages</a>
    <a href="logout" class="chkin-bar-item chkin-button chkin-right chkin-light-grey chkin-mobile">Logout</a>
</div>
<!-- Header -->
<header id="header" class="chkin-display-container chkin-content" style="max-width:1500px;">
    <img class="chkin-image" src="resources/images/hotel.jpg" alt="The Hotel" style="min-width:1000px" width="1500" height="800">
    <div class="chkin-display-left chkin-padding chkin-col l6 m8">
        <div class="chkin-container chkin-red">
            <h2><i class="fa fa-bed chkin-margin-right"></i>Hotel Maharishi Guests</h2>
        </div>
        <div class="chkin-container chkin-white chkin-padding-16">
            <table id="tbl_products">
                  <thead>
                  <tr>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Check In</th>
                      <th>Check Out</th>
                  </tr>
                  </thead>
                <tbody>
                <c:forEach items="${guests}" var="guest">
                    <tr>
                        <td><c:out value="${guest.firstName}" /></td>
                        <td><c:out value="${guest.lastName}"/> </td>
                    <td>
                        <i  class="fa fa-calendar-o"></i>
                        <a href="#rooms" class ="checkin" id ="<c:out value="${guest.id}" />"> Check In</a></td>
                    <td>
                        <i class="fa fa-credit-card" aria-hidden="true"></i>
                        <a href="<c:url value="/checkin">
                                    <c:param name="guestId" value="${guest.id}"/>
                                </c:url>" class ="checkout"  >Check Out</a></td>
                    </tr>
                </c:forEach>
                <br>
                </tbody>
            </table>
        </div>
    </div>
</header>

<!-- Page content -->
<div class="chkin-content" style="max-width:1532px;">

    <div class="chkin-container chkin-margin-top" id="rooms">
        <h3>Rooms</h3>
        <p>Make yourself at home is our slogan. We offer the best beds in the industry. Sleep well and rest well.</p>
    </div>

    <div class="chkin-row-padding">
        <div class="chkin-col m3">
            <label><i class="fa fa-calendar-o"></i> Check In</label>
            <input class="chkin-input chkin-border" type="date" placeholder="DD MM YYYY">
        </div>
        <div class="chkin-col m3">
            <label><i class="fa fa-calendar-o"></i> Check Out</label>
            <input class="chkin-input chkin-border" type="date" placeholder="DD MM YYYY">
        </div>
        <div class="chkin-col m2">
            <label><i class="fa fa-male"></i> Adults</label>
            <input class="chkin-input chkin-border" type="number" placeholder="1">
        </div>
        <div class="chkin-col m2">
            <label><i class="fa fa-child"></i> Kids</label>
            <input class="chkin-input chkin-border" type="number" placeholder="0">
        </div>
        <div class="chkin-col m2">
            <label><i class="fa fa-search"></i> Search</label>
            <button class="chkin-button chkin-block chkin-black">Search</button>
        </div>
    </div>

    <div class="chkin-row-padding chkin-padding-16">
        <div class="chkin-third chkin-margin-bottom">
            <img src="resources/images/room_single.jpg" alt="Norway" style="width:100%">
            <div class="chkin-container chkin-white">
                <h3>Single Room</h3>
                <h6 class="chkin-opacity">From $100</h6>
                <p>Single bed</p>
                <p>15m<sup>2</sup></p>
                <p class="chkin-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i></p>
                <button id="single" class="room-type chkin-button chkin-block chkin-black chkin-margin-bottom">Choose Room</button>
            </div>
        </div>
        <div class="chkin-third chkin-margin-bottom">
            <img src="resources/images/room_double.jpg" alt="Norway" style="width:100%">
            <div class="chkin-container chkin-white">
                <h3>Double Room</h3>
                <h6 class="chkin-opacity">From $200</h6>
                <p>Queen-size bed</p>
                <p>25m<sup>2</sup></p>
                <p class="chkin-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i></p>
                <button id="double" class="room-type chkin-button chkin-block chkin-black chkin-margin-bottom">Choose Room</button>
            </div>
        </div>
        <div class="chkin-third chkin-margin-bottom">
            <img src="resources/images/room_deluxe.jpg" alt="Norway" style="width:100%">
            <div class="chkin-container chkin-white">
                <h3>Deluxe Room</h3>
                <h6 class="chkin-opacity">From $500</h6>
                <p>King-size bed</p>
                <p>40m<sup>2</sup></p>
                <p class="chkin-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
                <button id="deluxe" class="room-type chkin-button chkin-block chkin-black chkin-margin-bottom">Choose Room</button>
            </div>
        </div>
    </div>

    <div class="chkin-row-padding" id="about">
        <div class="chkin-col l4 12">
            <h3>Information</h3>
            <h6>Our hotel is one of a kind. It is truely amazing. Located in Fairfield Iowa, From the kindness of a friendly greeting to the comfort of a good night’s sleep, you’ll find everything you need right here.</h6>
            <p>We accept: <i class="fa fa-credit-card chkin-large"></i> <i class="fa fa-cc-mastercard chkin-large"></i> <i class="fa fa-cc-amex chkin-large"></i> <i class="fa fa-cc-cc-visa chkin-large"></i><i class="fa fa-cc-paypal chkin-large"></i></p>
        </div>
        <div class="chkin-col l8 12">
            <!-- Image of location/map -->
            <img src="resources/images/map.jpg" class="chkin-image chkin-greyscale" style="width:100%;">
        </div>
    </div>

    <div class="chkin-row-padding chkin-large chkin-center" style="margin:32px 0">
        <div class="chkin-third"><i class="fa fa-map-marker chkin-text-red"></i> 52257 Fairfield, IOWAFrom the kindness of a friendly greeting to the comfort of a good night’s sleep, you’ll find everything you need right here., US</div>
        <div class="chkin-third"><i class="fa fa-phone chkin-text-red"></i> Phone: +00 151515</div>
        <div class="chkin-third"><i class="fa fa-envelope chkin-text-red"></i> Email: mail@mail.com</div>
    </div>

    <div class="chkin-panel chkin-red chkin-leftbar chkin-padding-32">
        <h6><i class="fa fa-info chkin-deep-orange chkin-padding chkin-margin-right"></i> On demand, we can offer playstation, babycall, children care, dog equipment, etc.</h6>
    </div>

    <div class="chkin-container">
        <h3>Our Hotels</h3>
        <h6>You can find our hotels anywhere in the world:</h6>
    </div>

    <div class="chkin-row-padding chkin-padding-16 chkin-text-white chkin-large">
        <div class="chkin-half chkin-margin-bottom">
            <div class="chkin-display-container">
                <img src="resources/images/cinqueterre.jpg" alt="Cinque Terre" style="width:100%">
                <span class="chkin-display-bottomleft chkin-padding">Cinque Terre</span>
            </div>
        </div>
        <div class="chkin-half">
            <div class="chkin-row-padding" style="margin:0 -16px">
                <div class="chkin-half chkin-margin-bottom">
                    <div class="chkin-display-container">
                        <img src="resources/images/newyork2.jpg" alt="New York" style="width:100%">
                        <span class="chkin-display-bottomleft chkin-padding">New York</span>
                    </div>
                </div>
                <div class="chkin-half chkin-margin-bottom">
                    <div class="chkin-display-container">
                        <img src="resources/images/sanfran.jpg" alt="San Francisco" style="width:100%">
                        <span class="chkin-display-bottomleft chkin-padding">San Francisco</span>
                    </div>
                </div>
            </div>
            <div class="chkin-row-padding" style="margin:0 -16px">
                <div class="chkin-half chkin-margin-bottom">
                    <div class="chkin-display-container">
                        <img src="resources/images/pisa.jpg" alt="Pisa" style="width:100%">
                        <span class="chkin-display-bottomleft chkin-padding">Pisa</span>
                    </div>
                </div>
                <div class="chkin-half chkin-margin-bottom">
                    <div class="chkin-display-container">
                        <img src="resources/images/paris.jpg" alt="Paris" style="width:100%">
                        <span class="chkin-display-bottomleft chkin-padding">Paris</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="chkin-container chkin-padding-32 chkin-black chkin-opacity chkin-card chkin-hover-opacity-off" style="margin:32px 0;">
        <h2>Be the first to know</h2>
        <p>Join our company news letter.</p>
        <label>E-mail</label>
        <input class="chkin-input chkin-border" type="text" placeholder="Your Email address">
        <button type="button" class="chkin-button chkin-red chkin-margin-top">Subscribe</button>
    </div>

    <div class="chkin-container" id="contact">
        <h2>Messages</h2>
        <p>Do you need help? Do not hesitate to ask support.</p>
        <i class="fa fa-map-marker chkin-text-red" style="width:30px"></i> Support<br>
        <i class="fa fa-phone chkin-text-red" style="width:30px"></i> Phone: +00 151515<br>
        <i class="fa fa-envelope chkin-text-red" style="width:30px"> </i> Email: support@mail.com<br>
        <form action="/action_page.php" target="_blank">
            <p><input class="chkin-input chkin-padding-16 chkin-border" type="text" placeholder="Name" required name="Name"></p>
            <p><input class="chkin-input chkin-padding-16 chkin-border" type="text" placeholder="Email" required name="Email"></p>
            <p><input class="chkin-input chkin-padding-16 chkin-border" type="text" placeholder="Message" required name="Message"></p>
            <p><button class="chkin-button chkin-black chkin-padding-large" type="submit">SEND MESSAGE</button></p>
        </form>
    </div>

    <!-- End page content -->
</div>

<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2>Checkin</h2>
        </div>
        <div class="modal-body">
            <p id="message"> this is a message</p>
        </div>
        <div class="modal-footer">
            <%--      <h3></h3>--%>
        </div>
    </div>

</div>

<!-- Footer -->
<footer class="chkin-padding-32 chkin-black chkin-center chkin-margin-top">
    <h5>Find Us On</h5>
    <div class="chkin-xlarge chkin-padding-16">
        <i class="fa fa-facebook-official chkin-hover-opacity"></i>
        <i class="fa fa-instagram chkin-hover-opacity"></i>
        <i class="fa fa-snapchat chkin-hover-opacity"></i>
        <i class="fa fa-pinterest-p chkin-hover-opacity"></i>
        <i class="fa fa-twitter chkin-hover-opacity"></i>
        <i class="fa fa-linkedin chkin-hover-opacity"></i>
    </div>
</footer>


</body>
</html>