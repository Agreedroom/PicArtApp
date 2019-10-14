(function ($) {
    'use strict';
    /*==================================================================
        [ Daterangepicker ]*/
    try {
        $('.js-datepicker').daterangepicker({
            "singleDatePicker": true,
            "showDropdowns": true,
            "autoUpdateInput": false,
            locale: {
                format: 'DD/MM/YYYY'
            },
        });
    
        var myCalendar = $('.js-datepicker');
        var isClick = 0;
    
        $(window).on('click',function(){
            isClick = 0;
        });
    
        $(myCalendar).on('apply.daterangepicker',function(ev, picker){
            isClick = 0;
            $(this).val(picker.startDate.format('DD/MM/YYYY'));
    
        });
    
        $('.js-btn-calendar').on('click',function(e){
            e.stopPropagation();
    
            if(isClick === 1) isClick = 0;
            else if(isClick === 0) isClick = 1;
    
            if (isClick === 1) {
                myCalendar.focus();
            }
        });
    
        $(myCalendar).on('click',function(e){
            e.stopPropagation();
            isClick = 1;
        });
    
        $('.daterangepicker').on('click',function(e){
            e.stopPropagation();
        });
    
    
    } catch(er) {console.log(er);}
    /*[ Select 2 Config ]
        ===========================================================*/
    
    try {
        var selectSimple = $('.js-select-simple');
    
        selectSimple.each(function () {
            var that = $(this);
            var selectBox = that.find('select');
            var selectDropdown = that.find('.select-dropdown');
            selectBox.select2({
                dropdownParent: selectDropdown
            });
        });
    
    } catch (err) {
        console.log(err);
    }
    

})(jQuery);




var objUsuarios=[
    {  
        usuario: "Abelmb",
        password: "1234"
    },
    {
        usuario: "Raul",
        password: "1234"

    },
    {
        usuario: "Xavi",
        password: "1234"
    
    }
]

function getInfo() {
    var usuario=document.getElementById("usuario").value
    var password=document.getElementById("password").value
    for(i=0;i<objUsuarios.length;i++){
        if(usuario == objUsuarios[i].usuario && objUsuarios[i].password){
            //alert("Bienvenido "+usuario)
              location.replace("/webpage/menu.html")
            return
        }
    }
     alert("Usuario o Contraseña no valida")
    
}

function validacionUsuario()
{
    valido = true;

    if ( document.getElementById("nombre").value == "" )
    {
        alert ( "Favor de llenar el espacio del Nombre" );
        valido = false;
    }
    if ( document.getElementById("usuario").value == "" )
    {
        alert ( "Favor de llenar el espacio del Usuario" );
        valido = false;
    }
    if ( document.getElementById("password").value == "" )
    {
        alert ( "Favor de llenar el espacio de la Contraseña" );
        valido = false;
    }
    if ( document.getElementById("puesto").value == "" )
    {
        alert ( "Favor de llenar el espacio del Puesto" );
        valido = false;
    }
    if(valido==true){
    location.replace("/webpage/regreso_menu_usuarios.html");    
    }
}

function validacionMaterial()
{
    valido = true;

    if ( document.getElementById("material").value == "" )
    {
        alert ( "Favor de llenar el espacio del Material" );
        valido = false;
    }
    if ( document.getElementById("cantidad").value == "" )
    {
        alert ( "Espacio de cantidad vacio o invalido" );
        valido = false;
    }
    if ( document.getElementById("precio").value == "" )
    {
        alert ( "Espacio de precio vacio o invalido" );
        valido = false;
    }
    
    if(valido==true){
    location.replace("/webpage/regreso_menu_material.html");    
    }
}

function getLogIn()
{
    fetch('http://10.0.105.52:5000/api/integrantes')
  .then(function(response) {
    return response.json();
  })
  .then(function(users) {
    console.log(users);
        console.log(document.getElementById("usuario").value);
        if(users._embedded.integrantes.length>0){
        
        var user= users._embedded.integrantes.filter(user => user.usuario == document.getElementById("usuario").value )[0]
        console.log(user);
        if(user.contrasena== document.getElementById("password").value){
            console.log("Password bien")
            location.replace("/webpage/menu.html");
        }else{
            console.log("Password mal")
            alert("Usuario malo o bad password");
        }
        }else{
             alert("pon una password");
        }
  });
    
}

function createUsuario()
{
    fetch('http://10.0.105.52:5000/api/integrantes', {
  method: 'POST',
  body:JSON.stringify( {
    "nombre": document.getElementById("nombre").value,
    "contrasena": document.getElementById("password").value,
    "usuario": document.getElementById("usuario").value,
  }),
          headers:{
    'Content-Type': 'application/json'
  }    
    })
  .then(function(response) {
    return response.json();
  })
  .then(function(users) {
    console.log(users);
       location.replace("/webpage/regreso_menu_usuarios.html");   
  })
    
}


function createMaterial()
{
    fetch('http://10.0.105.52:5000/api/productoes', {
  method: 'POST',
  body:JSON.stringify( {
    "nombre": document.getElementById("material").value,
    "cantidad": document.getElementById("cantidad").value,
    "costo_venta": document.getElementById("precio").value,
      "descripcion": document.getElementById("descripcion").value,
  }),
          headers:{
    'Content-Type': 'application/json'
  }    
    })
  .then(function(response) {
    return response.json();
  })
  .then(function(users) {
    console.log(users);
   location.replace("/webpage/regreso_menu_material.html");      
  })
    
}

