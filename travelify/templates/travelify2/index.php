<?php defined('_JEXEC') or die('Restricted access');?>
<!DOCTYPE html>
<html xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
	<jdoc:include type="head" />
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/font-awesome.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/style.css" type="text/css" />
	<script src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/bootstrap.min.js">
	</script>
</head>
<body class="page page-id-1027 page-template-default custom-background left-sidebar-template">
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
			<section class="featured-slider">
				<jdoc:include type="modules" name="featured-slider" /> 
			</section>
		</header>
		<div id="main" class="container clearfix">
			<div id="container">
				<div class="no-margin-left col-lg-8" id="primary" >
					<div id="content">
						<main id="content" role="main" >
							<article>
							<header class="entry-header">
								<h2 class="entry-title">
									Contact us    			</h2><!-- .entry-title -->
							</header>
							<div class="entry-content clearfix" style="padding: 14px 2.5% 0px;">
								<p style="margin-bottom: 5px;">This form is created to preview form design and it is not meant to be used for support related questions.<strong> All messages sent through this form will be ignored.</strong> For support related questions please use our <a href="https://colorlib.com/wp/forums/" style="text-decoration: underline;">support forum</a>.</p>
							</div>
							<jdoc:include type="component" />
							</article>
						</main>
					</div>
				</div>
				<div class="col-lg-4" id="secondary">
					
					<?php if ($this->countModules('recent-posts-6')) : ?>
						<aside class="widget widget_recent_entries" id="recent-posts-6">
							<jdoc:include type="modules" name="recent-posts-6" /> 
						</aside>
					<?php endif; ?>
					<?php if ($this->countModules('archives-2')) : ?>
						<aside class="widget widget_archive" id="archives-2">
							<jdoc:include type="modules" name="archives-2" /> 
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