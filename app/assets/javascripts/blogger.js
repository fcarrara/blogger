// $('.grid').masonry({
//   itemSelector: '.grid-item',
//   columnWidth: 320
// });

// var elem = document.querySelector('.grid');
// var msnry = new Masonry( elem, {
//   // options
//   itemSelector: '.grid-item',
//   columnWidth: 320
// });

//BlocksIt
// $(document).ready(function() {
//     $('.grid').BlocksIt({
//         numOfCol: 3,
//         offsetX: 8,
//         offsetY: 8,
//         blockElement: '.grid-item'
//     });
// });

// $(document).ready(function() {
 //    var $grid = $('.grid').masonry({
 //  		itemSelector: '.grid-item',
 //  		columnWidth: 320
	// });


 //     // var wookmark = new Wookmark('.grid', {
 //     // 	itemWidth: 320
 //     // });


	// // layout Masonry after each image loads
	// $grid.imagesLoaded( function() {
 //  		// wookmark.updateOptions();
 //  		$('.grid').masonry({
 //  			itemSelector: '.grid-item',
 //  			columnWidth: 320
	// 	});
 //  	});
// });

// var stackgrid = new Stackgrid;

// // Configurate your stackgrid options here.
// stackgrid.config.column_width = 320;
// stackgrid.config.numberOfColumns = 3;

// // One way to make sure everything is loaded is
// // to wrap the initializer inside window onload.
// window.onload = function() {

//   // The initializer takes in two arguements:
//   // the grid container selector, and the grid items selector
//   stackgrid.initialize('.grid', '.grid-item');

// };
$(document).ready(function(){
	// $("#month").change(function(){
	// 	var id = $(this).children(":selected").val();
	//     var params = 'month=' + id;
	//     $.ajax({
	//       url: "/articles",
	//       data: params
	//     })
	// });
	$(function () {
	  var alert = $('.alert');
	  if (alert.length > 0) {
	    alert.show().animate({height: alert.outerHeight()}, 200);
	    window.setTimeout(function() {
	      alert.slideUp();
	    }, 3000);
	  }
	});
});