<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="portfolio" class="scrollspy-section bg-dark padding-large">
		<div class="container">

			<div class="row">
				<div class="col-md-12">

					<div class="section-header">
						<div class="title">
							<span>Some of Our Works</span>
						</div>
						<h2 class="section-title light">참가 기업</h2>
					</div>
				</div>
			</div>

			<div class="row">

				<div id="filters" class="button-group d-flex flex-wrap gap-4 py-5" data-aos="fade-up">
					<a href="#" class="btn btn-outline-light rounded-pill text-uppercase is-checked"
						data-filter=".design">IT 기업</a>
					<a href="#" class="btn btn-outline-light rounded-pill text-uppercase"
						data-filter=".it">물류 기업</a>
					<a href="#" class="btn btn-outline-light rounded-pill text-uppercase"
						data-filter=".landscape">인사 경영</a>
				</div>

			</div>
			
			<div class="grid p-0 clearfix row row-cols-2 row-cols-lg-3 row-cols-xl-3 rounded " data-aos="fade-up">
				<div class="col mb-4 portfolio-item construction it ">
					<img src="images/portfolio-thumb-1.jpg"
							class="img-fluid" alt="portfolio">
					<span>기업 이름</span>
				</div>
				<div class="col mb-4 portfolio-item construction landscape">
					<img src="images/portfolio-thumb-2.jpg"
							class="img-fluid" alt="portfolio">
					<span>기업 이름11</span>

				</div>
				<div class="col mb-4 portfolio-item construction">
					<img src="images/portfolio-thumb-11.jpg"
							class="img-fluid" alt="portfolio">
				</div>
				<div class="col mb-4 portfolio-item construction">
					<img src="images/portfolio-thumb-4.jpg"
							class="img-fluid" alt="portfolio">
				</div>
			</div>

		</div>
	</section>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="plugins.js"></script>
	<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
	<script src="script.js"></script>
</body>
</html>