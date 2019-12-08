var app = angular.module('entryForm', []);

app.controller('MainCtrl', function($scope, $http){
      $scope.row = {
        'er_no': '',
        'item_id': '',
        'project_id': '',
        'name_of_item': '',
        'name_of_project': '',
        'transaction_date': '0000-00-00',
        'transaction_type': '0',
        'authenticity_token': '',
        'rate' : 0,
        'quantity': 0,
        'remarks': "",
        'main_item_register_page_no': ''
      };
      $scope.rows = [];

      $scope.getItemName = function(id){
          $scope.row.authenticity_token = authenticity_token;
                 $http.get('/er/item/'+id, $scope.row).then(
                  function(response){
                    $scope.row.name_of_item = response.data.name_of_item;
                    console.log(response.data.name_of_item);
                  },
                  function(response){

                  })
      }

      $scope.getEntryItems = function(entry_no, entry_type){
        if(entry_type == "1"){
          $http.get('/er/entry_items').then(
            function(response){
              if( response.status == 200){
                $scope.rows = response.data;
                console.log("done");
              }
            })
        }
        
      }
      
      $scope.submitForm = function (e) {
        e.preventDefault();
        var authenticity_token = document.getElementById('authenticity_token').value;
        $scope.row.authenticity_token = authenticity_token;
                 $http.post('/er/main_entry', $scope.row).then(
                  function(response){
                    console.log(response.data.record_id)
                    if(response.status == 200){
                    var row = angular.copy($scope.row);
                    row.destroy_url = response.data.destroy_url
                    row.record_id = response.data.record_id
                    $scope.rows.unshift(row);
                    $scope.row.item_id = 0;
                    $scope.row.rate = 0;
                    $scope.row.quantity = 0;
                   // $scope.row.transaction_type = '2'
                  }
                  },
                  function(response){

                  })
};

  });

$(document).ready(function(){
  $('#item_names').select2({
    width: 'resolve'
  });
});