$(document).ready(function() {
  setTimeout(function(){
    $('.alert').slideUp(1000);
  }, 1500);  

  $("#reading_reading_date").datepicker({dateFormat: 'yy-mm-dd'});

//================  MORRIS.JS =====================//
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'chart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#chart').data('logs'),
    // The name of the data record attribute that contains x-values. xkey: 'workout_date',
    // A list of names of data record attributes that contain y-values. ykeys: ['duration_in_min'],
    // Labels for the ykeys -- will be displayed when you hover over the // chart.
    xkey: 'reading_date',
    ykeys: ['duration_in_min'],
    labels: ['Duration (min)'],
    xLabels: "day",
    xLabelAngle: 60,
    xLabelFormat: function (x) {
      date_string = x.getFullYear() + "/" + parseInt(x.getMonth() + 1) + "/" + x.getDate();
      return date_string;
    },
    yLabelFormat: function(y) { return y + ' min'; }
  });

  //------ Display book thumbnail ------//
  var book_img = '<i class="fa fa-book fa-5x"></i>';
  $(".log-list li.book-thum").append(book_img);

  $( "li.book-thum" ).each(function( index ) {
    var title = $( this ).data("title");
    var author = $( this ).data("author");
    var log_id = $( this ).data("id");
    var averageRating = 0;
    var ratingsCount = 0;
    var maxRating = 5;

    var star = "<i class='fa fa-star'></i>";
    
    var url = "https://www.googleapis.com/books/v1/volumes?q="+title+"inauthor:"+author+ "&printType=books&maxResults=3";
    $.getJSON(url, function(data){
      
      //--- RATING ---//
      var $book_rating_star = $('span.rating[data-id="'+log_id+'"]');
            
      $book_rating_star.text('');

      if (averageRating === 0) {
        if (data.items[0].volumeInfo.averageRating){
          averageRating = data.items[0].volumeInfo.averageRating;
          ratingsCount = data.items[0].volumeInfo.ratingsCount;
        } else if (data.items[1].volumeInfo.averageRating){
          averageRating = data.items[1].volumeInfo.averageRating;
          ratingsCount = data.items[1].volumeInfo.ratingsCount;
        } else if (data.items[2].volumeInfo.averageRating){
          averageRating = data.items[1].volumeInfo.averageRating;
          ratingsCount = data.items[1].volumeInfo.ratingsCount;
        }
      }

      var ratingInt = averageRating === parseInt(averageRating, 10);
      for (var i = 0; i < Math.floor(averageRating); i++)
        $book_rating_star.append(star);

      if (!ratingInt)
        $book_rating_star.append("<i class='fa fa-star-half-o'></i>");


      if (Math.round(averageRating) < maxRating){
        for (i = Math.round(averageRating); i < maxRating; i++)
          $book_rating_star.append("<i class='fa fa-star-o'></i>");
      }   

      $book_rating_star.append("&nbsp;("+ratingsCount+")");  


      //--- book thumbnail image ---//
      var $book_thum_li = $('.log-list li.book-thum[data-id="'+log_id+'"]');
      var thumbImg;

      if (data.items[0].volumeInfo.imageLinks){
        thumbImg = data.items[0].volumeInfo.imageLinks.thumbnail;
      } else if (data.items[1].volumeInfo.imageLinks) {
        // book_img = "<img src='" + data.items[1].volumeInfo.imageLinks.thumbnail + "' class='resize'>";
        thumbImg = data.items[1].volumeInfo.imageLinks.thumbnail;
      } else if (data.items[2].volumeInfo.imageLinks) {
        // book_img = "<img src='" + data.items[2].volumeInfo.imageLinks.thumbnail + "' class='resize'>";
        thumbImg = data.items[2].volumeInfo.imageLinks.thumbnail;
      }
      if (thumbImg)
        book_img = "<img src='" + thumbImg + "' class='resize'>";
      $book_thum_li.html(book_img);

    });
  });
  //--- end of display book thumbnail ---//


});
