window.addEventListener("DOMContentLoaded", () => {
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='product__box__added' id= 'children_wrapper'>
                          <div class='category__box__parent'>
                            <select class="search-detail__category-box" id="child_category" name="q[category_id_eq]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
      $('.child_category').append(childSelectHtml);
    }
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='product__box__added' id= 'grandchildren_wrapper'>
                                <div class='category__box__parent'>
                                  <select class="search-detail__category-box" id="grandchild_category" name="q[category_id_eq]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.child_category').append(grandchildSelectHtml);
    }

    $('#search_category').on('change', function(){
      var parentCategory = document.getElementById('search_category').value; 
      if (parentCategory != "---"){ 
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
      }
    });
    
    $('.child_category').on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category'); 
      if (childId != "---"){ 
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); 
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_category_search').remove();
        $('#grandchildren_wrapper').remove(); 
      }
    });
  });
});