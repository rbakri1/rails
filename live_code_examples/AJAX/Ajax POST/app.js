$(document).ready(function(){

  $("#submit").on("click", function(){

    var content = $("#content").val();

    var gistData = {
      "description": "Stupid gist",
      "public": true,
      "files": {
        "hello.rb": {
          "content": content
        }
      }
    };

    // POST request to create my gist
    var apiUrl = "https://api.github.com/gists";
    $.ajax({
      type: "POST",
      url: apiUrl,
      data: JSON.stringify(gistData),
      success: function(data){
        console.log(data);
      },
      error: function(error){
        console.log(error);
      }
    });

  });

});