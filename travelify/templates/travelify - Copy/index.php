<?php defined('_JEXEC') or die('Restricted access');?>
<!DOCTYPE html>
<html xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
	<jdoc:include type="head" />
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/style.css" type="text/css" />
	<!--
	<script src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/bootstrap.min.js">
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/font-awesome.css" type="text/css" />
	-->
	</script>
</head>
<body class="home blog custom-background">
	<div class="wrapper">
		<header id="branding">
			<div class="container clearfix">
				<div class="hgroup-wrap clearfix">
					<section class="hgroup-right">
						<div class="social-icons clearfix">
							<jdoc:include type="modules" name="social-icons" /> 
						</div>
					</section>
					<hgroup class="clearfix" id="site-logo">
						<jdoc:include type="modules" name="logo" /> 
					</hgroup>
				</div>
			</div>
			<nav id="main-nav" class="clearfix">
				<div class="container clearfix">
					<jdoc:include type="modules" name="mainmenu" /> 
				</div>
			</nav>
			<?php if ($this->countModules('breadcrumb')) : ?>
				<div class="page-title-wrap">
					<div class="container clearfix">
						<jdoc:include type="modules" name="breadcrumb" /> 
					</div>
				</div>
			<?php endif; ?>
			<?php if ($this->countModules('featured-slider')) : ?>
				<section class="featured-slider">
					<jdoc:include type="modules" name="featured-slider" /> 
				</section>
			<?php endif; ?>
		</header>
		<div id="main" class="container clearfix">
			<div id="container">
				<div class="no-margin-left col-lg-8" id="primary" >
					<div id="content">
						<main id="content" role="main" >
							<jdoc:include type="component" />
						</main>
					</div>
				</div>
				<div class="col-lg-4" id="secondary">
					<?php if ($this->countModules('login')) : ?>
						<div id="login" class="widget widget_login">
							<jdoc:include type="modules" name="login" /> 
						</div>
					<?php endif; ?>
					<?php if ($this->countModules('search')) : ?>
						<div id="search-2" class="widget widget_search">
							<jdoc:include type="modules" name="search" /> 
						</div>
					<?php endif; ?>
					
					<?php if ($this->countModules('recent-left')) : ?>
						<aside class="widget rpwe_widget recent-posts-extended" id="rpwe_widget-3">
							<jdoc:include type="modules" name="recent-left" /> 
						</aside>
					<?php endif; ?>
					<?php if ($this->countModules('category-statistic')) : ?>
						<aside class="widget widget_categories" id="categories-2">
							<jdoc:include type="modules" name="category-statistic" /> 
						</aside>
					<?php endif; ?>
					<?php if ($this->countModules('right-menu')) : ?>
						<aside class="widget widget_nav_menu" id="nav_menu-4">
							<jdoc:include type="modules" name="right-menu" /> 
						</aside>
					<?php endif; ?>
					<?php if ($this->countModules('calendar')) : ?>
						<aside class="widget widget_calendar" id="calendar-2">
							<jdoc:include type="modules" name="calendar" /> 
						</aside>
					<?php endif; ?>
					
				</div>
			</div>
		</div>
		<footer class="clearfix" id="footerarea">
			<div class="widget-wrap">
				<div class="container">
					<div class="widget-area clearfix">
						<?php if ($this->countModules('recent-bottom1')) : ?>
							<div class="col-md-4 col-sm-12 col-xs-12">
								<aside class="widget widget_recent_entries" id="recent-posts-5">
									<jdoc:include type="modules" name="recent-bottom1" /> 
								</aside>
							</div>
						<?php endif; ?>
						<?php if ($this->countModules('recent-bottom2')) : ?>
							<div class="col-md-4 col-sm-12 col-xs-12">
								<aside class="widget rpwe_widget recent-posts-extended" id="rpwe_widget-5">
									<jdoc:include type="modules" name="recent-bottom2" /> 
								</aside>
							</div>
						<?php endif; ?>
						<?php if ($this->countModules('tag-cloud')) : ?>
							<div class="col-md-4 col-sm-12 col-xs-12">
								<aside class="widget widget_tag_cloud" id="tag_cloud-3">
									<jdoc:include type="modules" name="tag-cloud" /> 
								</aside>
							</div>
						<?php endif; ?>	
					</div>
				</div>
			</div>
			<div id="site-generator">
				<div class="container">
					<?php if ($this->countModules('copyright')) : ?>
						<div class="copyright">
							<jdoc:include type="modules" name="copyright" /> 
						</div>
					<?php endif; ?>
					<?php if ($this->countModules('footer-right')) : ?>
						<div class="footer-right">
							<jdoc:include type="modules" name="footer-right" />
						</div>
					<?php endif; ?>
				</div>
			</div>
			<div class="back-to-top">
			</div>
		</footer>
	</div>
</body>
</html>