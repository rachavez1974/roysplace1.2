// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

//Display password if user clicks button
function showMyPassword(choice) {
  var x = document.getElementById(choice);
  if (x.type === "password") {
    x.type = "text";
  }else{
    x.type = "password";
  }
}


function showAptNumberBox(choice){
  var selectedValue = document.getElementById(choice).value;
  if(selectedValue.toLowerCase() === 'none')
    user_addresses_attributes_0_number.style.display = 'none';
  else
    user_addresses_attributes_0_number.style.display = 'block';
  
}

  function openSlideMenu(){
      document.getElementById('side-menu').style.width = '250px';
      document.getElementById('mainadmin').style.marginLeft = '250px';
    }
  function closeSlideMenu(){
      document.getElementById('side-menu').style.width = '0';
      document.getElementById('mainadmin').style.marginLeft = '0';
    }

    



     

