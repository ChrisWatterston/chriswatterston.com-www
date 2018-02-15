<?php
	defined('C5_EXECUTE') or die("Access Denied.");
	include('inc/header.php');

	$enableFullFooter = enable;

	$th = Loader::helper('text');
	$c = Page::getCurrentPage();
	$ih = Loader::helper('image');

	$pageDesc = $c->getAttribute('meta_description');
	$pageURL = $c->getCollectionPath();

	$img = $c->getAttribute('thumbnail');
	if ($img) {
		$thumb = $ih->getThumbnail($img, 1440, 250, array('crop'=>true, 'quality'=>40));
		$tagSrc = $thumb->src;
	}
?>
<?php include('inc/body.php'); ?>
<header class="main page-oversize">
	<div class="bkgrnd-img" style="background-image:url('<?php echo $tagSrc; ?>');"></div>
	<section class="navigation-wrap">
		<div class="cols">
			<div class="col branding">
				<a href="<?php echo DIR_REL?>/" style="border:0;" title="Back to the start">
					<img src="<?php echo $view->getThemePath()?>/img/brnd/chriswatterston-logo.svg" class="logo" />
				</a>
			</div>
			<div class="col navigation">
				<nav class="main">
					<?php
						$hmn = Stack::getByName('Header Navigation');
						$hmn->display();
					?>
				</nav>
			</div>
		</div>
	</section>
	<section class="introduction-wrap">
		<div class="intro type-center">
			<?php
				$mttc = new Area('Title Content');
				$mttc->display($c);
			?>
		</div>
	</section>
</header>
<section class="body page-oversize">
	<section class="services-wrap">
		<div class="service-section featured">
			<div class="service-header">
				<h1 class="main-heading colour-blue-dark type-uppercase">
					<strong>Featured Product.</strong> Picked especially so you don't miss out.
				</h1>
			</div>
			<div class="service-desc">
				<div class="bkgrnd-grad"></div>
				<div class="bkgrnd-pixel-white"></div>
				<div class="content">
					<?php
						$mfca = new Area('Main Feature Area');
					  $mfca->display($c);
					?>
					<div class="payment-powered">
						<p>My designs are brought to you through the worldwide trusted eCommerce service, <a href="<?php echo DIR_REL?>/design-development-solutions-and-services/shopify-ecommerce-website-designer-solution" title="Shopfiy designer and developer">Shopify</a>. This enables you to use a wide selection of payment options, letting you get your hands on products in a safe and secure way.</p>
						<p><strong>Delivery:</strong> All orders are turned around within 3-5 working days, before being shipped. Depending on location, delivery can take 1-3 days(UK), 3-5 days(EU), 7-10 days(international) - you will be be updated during the whole process.</p>
						<div class="payment-list">
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-shopify.svg" class="icon shopify" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-applepay.svg" class="icon applepay" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-paypal.svg" class="icon paypal" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-litecoin.svg" class="icon litecoin" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-ethereum.svg" class="icon ethereum" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-bitcoin.svg" class="icon bitcoin" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-visa.svg" class="icon visa" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-mastercard.svg" class="icon mastercard" />
							<img src="<?php echo $view->getThemePath()?>/img/icns/icon-amex.svg" class="icon amex" />
						</div>
					</div>
					<?php
					  // phpinfo();
					?>
					<div id='collection-component-6463e495500'></div>
					<script type="text/javascript">
					/*<![CDATA[*/

					(function () {
					  var scriptURL = 'https://sdks.shopifycdn.com/buy-button/latest/buy-button-storefront.min.js';
					  if (window.ShopifyBuy) {
					    if (window.ShopifyBuy.UI) {
					      ShopifyBuyInit();
					    } else {
					      loadScript();
					    }
					  } else {
					    loadScript();
					  }

					  function loadScript() {
					    var script = document.createElement('script');
					    script.async = true;
					    script.src = scriptURL;
					    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(script);
					    script.onload = ShopifyBuyInit;
					  }

					  function ShopifyBuyInit() {
					    var client = ShopifyBuy.buildClient({
					      domain: 'chris-watterston.myshopify.com',
					      apiKey: '4513effbe12a7d7cd4c3289699fa6229',
					      appId: '6',
					    });

					    ShopifyBuy.UI.onReady(client).then(function (ui) {
					      ui.createComponent('collection', {
					        id: 19257851940,
					        node: document.getElementById('collection-component-6463e495500'),
					        moneyFormat: '%C2%A3%7B%7Bamount%7D%7D',
					        options: {
					          "product": {
					            "buttonDestination": "modal",
					            "variantId": "all",
					            "isButton": false,
					            "contents": {
					              "imgWithCarousel": false,
					              "variantTitle": false,
					              "options": false,
					              "description": false,
					              "buttonWithQuantity": false,
					              "quantity": false,
					              "img": true
					            },
					            "templates": {
					              // "img": '{{ data.classes.product.img }}'
					              // "img": '<div class="{{data.classes.product.imgWrapper}}" data-element="product.imgWrapper"><img data-element="product.img" class="{{data.classes.product.img}}" src="{{data.currentImage.src}}" /></div>'
					            },
					            "order": [
					              'img',
					              'title',
					              'price',
					              'button',
					            ],
					            "text": {
					              "button": "View product"
					            },
					            "styles": {
					              "product": {
					                "@media (min-width: 601px)": {
					                  "max-width": "calc(32% - 10px)",
														"width": "calc(50% - 10px)",
					                  "margin-right": "5px",
														"margin-left": "5px",
					                  "margin-bottom": "50px"
					                }
					              },
					              "button": {
					                "background-color": "#000000",
					                "font-family": "Open Sans, sans-serif",
					                "font-size": "14px",
					                "padding-top": "14px",
					                "padding-bottom": "14px",
					                "padding-left": "60px",
					                "padding-right": "60px",
					                ":hover": {
					                  "background-color": "#000000"
					                },
					                "border-radius": "0px",
					                ":focus": {
					                  "background-color": "#000000"
					                },
					                "font-weight": "normal"
					              },
					              "variantTitle": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold"
					              },
					              "title": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "normal",
					                "color": "#000000",
													"font-size": "15px"
					              },
					              "description": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "normal"
					              },
					              "price": {
					                "font-family": "Open Sans, sans-serif",
					                "font-size": "13px",
					                "color": "#454851",
					                "font-weight": "bold"
					              },
					              "quantityInput": {
					                "font-size": "14px",
					                "padding-top": "15.5px",
					                "padding-bottom": "15.5px"
					              },
					              "compareAt": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold",
					                "color": "#454851",
					                "font-size": "15.299999999999999px"
					              }
					            },
					            "googleFonts": [
					              "Open Sans",
					              "Open Sans",
					              "Open Sans",
					              "Open Sans",
					              "Open Sans",
					              "Open Sans"
					            ]
					          },
					          "cart": {
					            "startOpen": false,
					            "contents": {
					              "button": true
					            },
					            "text": {
					              "title": "Basket",
					              "total": "Subtotal",
					              "button": "Checkout",
					              "empty": "Your basket is empty :'("
					            },
					            "styles": {
					              "button": {
					                "background-color": "#000000",
					                "font-family": "Open Sans, sans-serif",
					                "font-size": "14px",
					                "padding-top": "14",
					                "padding-bottom": "14px",
					                ":hover": {
					                  "background-color": "#000000"
					                },
					                "border-radius": "0px",
					                ":focus": {
					                  "background-color": "#000000"
					                },
					                "font-weight": "bold"
					              },
					              "footer": {
					                "background-color": "#ffffff"
					              }
					            },
					            "googleFonts": [
					              "Open Sans"
					            ]
					          },
					          "modalProduct": {
					            "contents": {
					              "img": false,
					              "imgWithCarousel": true,
					              "variantTitle": false,
					              "buttonWithQuantity": true,
					              "button": false,
					              "quantity": false
					            },
					            "text": {
					              "button": "Add to Basket"
					            },
					            "styles": {
					              "product": {
					                "@media (min-width: 601px)": {
					                  "max-width": "100%",
					                  "margin-left": "0px",
					                  "margin-bottom": "0px"
					                }
					              },
					              "button": {
					                "background-color": "#000000",
					                "font-family": "Open Sans, sans-serif",
					                "font-size": "14px",
					                "padding-top": "14px",
					                "padding-bottom": "14px",
					                "padding-left": "60px",
					                "padding-right": "60px",
					                ":hover": {
					                  "background-color": "#000000"
					                },
					                "border-radius": "0px",
					                ":focus": {
					                  "background-color": "#000000"
					                },
					                "font-weight": "bold"
					              },
					              "variantTitle": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold"
					              },
					              "title": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "normal",
					                "color": "#000000"
					              },
					              "description": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold"
					              },
					              "price": {
					                "font-family": "Open Sans, sans-serif",
					                "color": "#000000",
					                "font-weight": "bold",
													"font-size": "13px"
					              },
					              "quantityInput": {
					                "font-size": "14px",
					                "padding-top": "14px",
					                "padding-bottom": "14px"
					              },
					              "compareAt": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold"
					              }
					            },
					            "googleFonts": [
					              "Open Sans",
					              "Open Sans",
					              "Open Sans",
					              "Open Sans",
					              "Open Sans",
					              "Open Sans"
					            ]
					          },
					          "toggle": {
					            "styles": {
					              "toggle": {
					                "font-family": "Open Sans, sans-serif",
					                "background-color": "#000000",
					                ":hover": {
					                  "background-color": "#000000"
					                },
					                ":focus": {
					                  "background-color": "#000000"
					                },
					                "font-weight": "bold"
					              },
					              "count": {
					                "color": "#ffffff",
					                ":hover": {
					                  "color": "#ffffff"
					                },
					                "font-size": "14px"
					              },
					              "iconPath": {
					                "fill": "#ffffff"
					              }
					            },
					            "googleFonts": [
					              "Open Sans"
					            ]
					          },
					          "option": {
					            "styles": {
					              "label": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold"
					              },
					              "select": {
					                "font-family": "Open Sans, sans-serif",
					                "font-weight": "bold"
					              }
					            },
					            "googleFonts": [
					              "Open Sans",
					              "Open Sans"
					            ]
					          },
					          "productSet": {
					            "styles": {
					              "products": {
					                "@media (min-width: 601px)": {
					                  "margin-left": "0"
					                }
					              }
					            }
					          }
					        }
					      });
					    });
					  }
					})();
					/*]]>*/
					</script>
				</div>
			</div>
		</div>
		<div class="service-section full">
			<div class="service-desc">
				<div class="content store-list">
					<?php
						$mbco = new Area('Main Body');
						$mbco->display($c);
					?>
				</div>
			</div>
		</div>
	</section>
</section>
<?php include('inc/footer.php'); ?>
