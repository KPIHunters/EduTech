// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// app/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
// require jquery_ujs
//= require autocomplete

// Frameworks
//= require creative-tim-pro/light_dashboard/jquery-ui.min
//= require creative-tim-pro/light_dashboard/bootstrap.min

// Add-ons
//= require creative-tim-pro/light_dashboard/jquery.validate.min
//= require creative-tim-pro/light_dashboard/moment.min
//= require creative-tim-pro/light_dashboard/bootstrap-datetimepicker
//= require creative-tim-pro/light_dashboard/bootstrap-selectpicker
//= require creative-tim-pro/light_dashboard/bootstrap-checkbox-radio-switch-tags
//= require creative-tim-pro/light_dashboard/chartist.min
//= require creative-tim-pro/light_dashboard/bootstrap-notify
//= require creative-tim-pro/light_dashboard/sweetalert2
//= require creative-tim-pro/light_dashboard/jquery-jvectormap
//= require creative-tim-pro/light_dashboard/jquery.bootstrap.wizard.min
//= require creative-tim-pro/light_dashboard/bootstrap-table
//= require creative-tim-pro/light_dashboard/jquery.datatables
// require datatables
//= require sweetalert2.all.min

// Theme
//= require creative-tim-pro/light_dashboard/light-bootstrap-dashboard
//= require creative-tim-pro/light_dashboard/demo

// Custom System JS
//= require helpers/popups
//= require helpers/localize
//= require views/dashboard

var colors = [
    'info',
    'success',
    'warning',
    'danger'
];

function readURL(input,targetImg, h ,w) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();

        reader.onload = function(e) {
            $targetImg = $(targetImg);
            $targetImg.removeClass('hidden');
            $targetImg.attr('height', h);
            $targetImg.attr('width', w);
            $targetImg.attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]); // convert to base64 string
    }
}

function setup() {
    mobile_menu_initialized = false;
    toggle_initialized = false;

    window_width = $(window).width();
    $sidebar = $('.sidebar');
    $sidebar.toggleClass('active');

    // check if there is an image set for the sidebar's background
    lbd.checkSidebarImage();

    if($('body').hasClass('sidebar-mini')){
        lbd.misc.sidebar_mini_active = true;
    }

    lbd.initSidebarsCheck();

    lbd.initMinimizeSidebar();

    $('.form-control').on("focus", function(){
        $(this).parent('.input-group').addClass("input-group-focus");
    }).on("blur", function(){
        $(this).parent(".input-group").removeClass("input-group-focus");
    });

    // Init Collapse Areas
    lbd.initCollapseArea();

    // Init Tooltips
    $('[rel="tooltip"]').tooltip();

    // Init Tags Input
    var tagsInputClass = $(".tagsinput");
    if(tagsInputClass.length !== 0){
        tagsInputClass.tagsInput();
    }

    //  Init Bootstrap Select Picker
    var selectpicker = $(".selectpicker");
    if(selectpicker.length !== 0){
        selectpicker.selectpicker();
    }

    if(window.location.href.indexOf('profiles') >= 0 && window.location.href.indexOf('edit') >= 0) {
        try {
            $cpf = $("#profile_gov_id_pf");
            $cpf.mask('000.000.000-00', {reverse: true});
            $phone = $("#profile_phone");
            $phone.mask("(00) 00000-0000");
            $zip = $("#profile_zip_code")
            $zip.mask("00.000-000");
            $birthday = $("#profile_birthday")
            $birthday.mask("00/00/0000");

            let $profState = $("#profile_state_ibge");
            let profState = $profState.val();
            for(let i = 0; i < states_ibge.length; i++) {
                state = states_ibge[i];
                if(state.indexOf(profState) >= 0) {
                    $profState.val(state);
                    break;
                }
            }

            let $profCounty = $("#profile_county_ibge");
            let profCounty = $profCounty.val();
            for(let i = 0; i < county_ibge.length; i++) {
                county = county_ibge[i];
                if(county.indexOf(profCounty) >= 0) {
                    $profCounty.val(county);
                    break;
                }
            }
        } catch (e) {
            // declarações para manipular quaisquer exceções
            console.log(e); // passa o objeto de exceção para o manipulador de erro
            document.location.reload(true);
        }
    }

    if($('.smart-table').length && !$.fn.DataTable.isDataTable( '.smart-table' )) {
        $('.smart-table').DataTable({
            "language": {
                "url": "/Portuguese.json"
            }
        });
    }

}


$(document).ready(setup);
$(document).on('page:load', setup);
document.addEventListener('turbolinks:request-start', setup);
document.addEventListener('turbolinks:load', setup);