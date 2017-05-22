$(document).ready(function(){


  $("#submit").on("click", function(){

    // get the username from input
    // make a GET request to the API
    // inject the response in the page

    var userName = $("#username").val();
    var apiUrl = "https://api.github.com/users/" + userName + "/repos";

    $.ajax({
      type: "GET",
      url: apiUrl,
      success: function(data){
        // data is an array of repo Object
        $("#repos").empty();
        data.forEach(function(repo){
          var listItem = "<li>"+ repo.name + "(" + repo.language + ")" + "</li>";
          $("#repos").append(listItem);
        });
      },
      error: function(error){
        $("#repos").empty();
        var listItem = "<li>"+ error.statusText + "</li>";
        $("#repos").append(listItem);
      }
    });

  });

});
