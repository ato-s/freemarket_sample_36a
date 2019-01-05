$(function(){
	$('.js-owl-carousel-item').owlCarousel({
		items: 1,
    smartSpeed: 500,
		loop: true,
    dots: false,
		thumbs: true,
		thumbImage: true,
		thumbContainerClass: 'js-owl-thumbs',
		thumbItemClass: 'js-owl-thumb-item'
	});
});
