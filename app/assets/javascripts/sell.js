$(document).on("turbolinks:load", function(){

  var image_file = $('.nest-form');
  var image_count = 1;
  var image_tag;
  var file_tag;

  function build_image_tag(alt, src) {
    var html = `<li>
                  <img alt="${alt}" src="${src}">
                </li>`
    return html;
  }

  function build_file_tag(num) {
    var html = `<input name="images[name][${num}]" style="display: none;" type="file" id="image${num}">`
    return html;
  }

  image_file.on('click', function() {
    image_file.children('input[name="images[name][' + image_count + ']"]')[0].click();
  })

  image_file.on('change', image_file.children('input[name="images[name][' + image_count + ']"]'), function (e) {
    var file = e.target.files[0];
    var file_reader = new FileReader();

    file_reader.onload = (function () {
      return function (e) {
        image_tag = build_image_tag(image_count, e.target.result);
        $('.image-preview').append(image_tag);
        image_count += 1;
        file_tag = build_file_tag(image_count);
        image_file.append(file_tag);
      };
    })(file);

      file_reader.readAsDataURL(file);
  
  });






  function feeCalculation(inputPrice){
    var saleFee = Math.floor(inputPrice * 0.1);
    var saleProfit = inputPrice - saleFee;

    $('.sell-fee').text(`¥${saleFee.toLocaleString()}`);
    $('.sell-profit').text(`¥${saleProfit.toLocaleString()}`)
  }

  $('#product-exhibition__form__group__text-box__field__price').on('keyup', function() {
    var inputPrice = $('#product-exhibition__form__group__text-box__field__price').val();
    if ( 300 <= inputPrice && inputPrice <= 9999999) {
      feeCalculation(inputPrice) 
    } else {
      $('.sale-fee').text('-');
      $('.sell-profit').text('-');
    }
  });
});