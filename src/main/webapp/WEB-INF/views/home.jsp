<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>FitClub</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">
</head>

<div class="gallery-modal" id="galleryModal">

    <span class="close-gallery" onclick="closeGallery()">×</span>

    <button class="gallery-arrow left" onclick="changeImage(-1)">❮</button>

    <img id="modalImage">

    <button class="gallery-arrow right" onclick="changeImage(1)">❯</button>

</div>

<script>
    const galleryImages = [
        "/images/gallery1.jpg",
        "/images/gallery2.jpg",
        "/images/gallery3.jpg",
        "/images/gallery4.jpg",
        "/images/gallery5.jpg",
        "/images/gallery6.jpg",
        "/images/gym1.jpg",
        "/images/gym2.jpg",
        "/images/gym3.jpg"
    ];

    let currentImage = 0;

    function openGallery(index){
        currentImage = index;
        document.getElementById("galleryModal").style.display = "flex";
        document.getElementById("modalImage").src = galleryImages[currentImage];
    }

    function closeGallery(){
        document.getElementById("galleryModal").style.display = "none";
    }

    function changeImage(direction){
        currentImage += direction;

        if(currentImage < 0){
            currentImage = galleryImages.length - 1;
        }

        if(currentImage >= galleryImages.length){
            currentImage = 0;
        }

        document.getElementById("modalImage").src = galleryImages[currentImage];
    }
</script>

<body>

<!-- NAVBAR -->

<nav class="navbar" id="navbar">

    <div class="logo">
        FitClub
    </div>

    <ul class="nav-links">
        <li><a href="#">Home</a></li>

        <li><a href="#gallery">Gallery</a></li>
        <li><a href="/reviews">Reviews</a></li>
        <li><a href="reviews">Reviews</a></li>
        <li><a href="contact">Contact</a></li>
    </ul>

    <div class="nav-buttons">

        <a href="${pageContext.request.contextPath}/login"
           class="login-btn">

            Login

        </a>

        <a href="${pageContext.request.contextPath}/signup"
           class="join-btn">

            Join Now

        </a>

    </div>

</nav>

<!-- HERO SECTION -->

<section class="hero">

    <div class="overlay"></div>

    <div class="hero-content">

        <p class="small-title">WELCOME TO FITCLUB</p>

        <h1>
            STRONGER <br>
            EVERY <span>DAY</span>
        </h1>

        <p class="description">
            Join our modern fitness membership system with elite trainers,
            smart payment management, advanced workout tracking and premium
            gym experiences.
        </p>

        <div class="hero-buttons">

            <a href="#plans"
               class="primary-btn">

                Explore Plans

            </a>

            <a href="/dashboard"
               class="secondary-btn">

                Start Training

            </a>

        </div>

    </div>

</section>

<!-- STATS -->

<section class="stats-section">

    <div class="stat-card">
        <h2>2450+</h2>
        <p>Active Members</p>
    </div>

    <div class="stat-card">
        <h2>150+</h2>
        <p>Expert Trainers</p>
    </div>

    <div class="stat-card">
        <h2>25+</h2>
        <p>Fitness Programs</p>
    </div>

    <div class="stat-card">
        <h2>98%</h2>
        <p>Satisfaction Rate</p>
    </div>

</section>

<!-- ABOUT SECTION -->

<section class="about-section">

    <div class="about-image">
        <img src="${pageContext.request.contextPath}/images/trainer.jpg">
    </div>

    <div class="about-content">

        <h4>ABOUT US</h4>

        <h2>Why Choose FitClub?</h2>

        <p>
            We provide world-class gym facilities, expert trainers,
            flexible workout plans and premium fitness experiences
            to help you achieve your goals.
        </p>

        <ul>
            <li>Modern Equipment</li>
            <li>Certified Trainers</li>
            <li>Flexible Workout Plans</li>
            <li>Nutrition Support</li>
        </ul>

        <button class="primary-btn">
            Learn More
        </button>

    </div>

</section>

<!-- PROGRAMS -->

<section class="program-section">

    <div class="section-title">
        <h4>OUR PROGRAMS</h4>
        <h2>Popular Programs</h2>
    </div>

    <div class="program-cards">

        <div class="program-card">
            <h3>Muscle Building</h3>
            <p>Build strength and muscles with expert training plans.</p>
        </div>

        <div class="program-card">
            <h3>Weight Loss</h3>
            <p>Burn fat and improve body fitness effectively.</p>
        </div>

        <div class="program-card">
            <h3>Yoga & Flexibility</h3>
            <p>Improve flexibility and reduce stress levels.</p>
        </div>

    </div>

</section>

<!-- GALLERY -->

<section class="gallery-section" id="gallery">

    <div class="section-title">
        <h4>OUR GALLERY</h4>
        <h2>Explore Our Gym</h2>
    </div>

    <div class="gallery-grid">

        <img src="${pageContext.request.contextPath}/images/gallery1.jpg" onclick="openGallery(0)">
        <img src="${pageContext.request.contextPath}/images/gallery2.jpg" onclick="openGallery(1)">
        <img src="${pageContext.request.contextPath}/images/gallery3.jpg" onclick="openGallery(2)">
        <img src="${pageContext.request.contextPath}/images/gallery4.jpg" onclick="openGallery(3)">
        <img src="${pageContext.request.contextPath}/images/gallery5.jpg" onclick="openGallery(4)">
        <img src="${pageContext.request.contextPath}/images/gallery6.jpg" onclick="openGallery(5)">
        <img src="${pageContext.request.contextPath}/images/gym1.jpg" onclick="openGallery(6)">
        <img src="${pageContext.request.contextPath}/images/gym2.jpg" onclick="openGallery(7)">
        <img src="${pageContext.request.contextPath}/images/gym3.jpg" onclick="openGallery(8)">

    </div>

</section>

<!-- TESTIMONIALS -->

<section class="testimonial-section">

    <div class="section-title">
        <h4>TESTIMONIALS</h4>
        <h2>What Our Members Say</h2>
    </div>

    <div class="testimonial-container">

        <div class="testimonial-card">
            <p>
                "Amazing gym atmosphere and professional trainers.
                Highly recommended!"
            </p>

            <h3>John Smith</h3>
        </div>

        <div class="testimonial-card">
            <p>
                "FitClub completely transformed my fitness journey."
            </p>

            <h3>Sarah Lee</h3>
        </div>

        <div class="testimonial-card">
            <p>
                "Best equipment and flexible workout schedules."
            </p>

            <h3>Michael Brown</h3>
        </div>

    </div>

</section>

<!-- FOOTER -->

<footer class="footer">

    <p>
         © 2026 FitClub. All Rights Reserved.
    </p>

</footer>

<!-- JAVASCRIPT -->

<script>

    let lastScroll = 0;

    const navbar = document.getElementById("navbar");

    window.addEventListener("scroll", () => {

        const currentScroll = window.pageYOffset;

        if(currentScroll > lastScroll){

            navbar.style.top = "-100px";

        } else {

            navbar.style.top = "0";

        }

        lastScroll = currentScroll;

    });

</script>

</body>
</html>