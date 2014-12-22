// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui.min
//= require jquery_ujs
// require turbolinks
//= require jquery.turbolinks
//= require bootstrap.min
//= require multi_step_form
//= require bootstrap-notify
//= require formToWizard
//= require jPushMenu
//= require blur
//= require jquery.purr
//= require best_in_place

//= require jquery-ui-scrollable.min

//= require_tree .

$(document).ready(function($) {





    $(function() {
        $( "#accordion" ).accordion({
            heightStyle: "content"
        });
     });

    $('.toggle-menu').jPushMenu();

    $('#tabs,#tabs2')
        .tabs()
        .addClass('ui-tabs-vertical ui-helper-clearfix');

    $(".print").unbind('click');

   // document.getElementById("productsDrag").addEventListener('dragstart', function(e) {
   //     console.log('Drag Interaction Started!');
   // });
    $('#send-zzn').on( "click",function(){

        $('.first').hide();
        $('#loading').html('<i class="fa fa-circle-o-notch fa-spin fa-5x"></i>');
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: "http://155.208.145.141/PhoneGapServiceQA/api/authentication/login",
            data:  {"StoreCode":"I905","Password":"tangent","Username":"I905CASHIER1","modelName":"UserModel","Platform":"MOB","Version":"1.0.7.1"},
            success: function(data) {
                console.log( "Login success" );
                console.log(data);

                $.ajax({
                    type: "POST",
                    dataType: "JSON",
                    url: "http://155.208.145.141/PhoneGapServiceQA/api/quote/processquote",
                    data: {"Quote":{"PrintQuoteFlag":true,"EmailQuoteFlag":false,"CreateProformaFlag":false,"PrinterName":"921A","StoreCode":"I905","RepCode":"1562","CustomerAddress":{"Name":"Ruaan test","CustomerNumber":"","TelNumber1":"011-111-1111","City":"","AccountGroup":"ZCLR","Email":"","Street":"","VatNo":""},"CustomerNo":"","DeliveryAddress":{"DeliveryL1":"","DeliveryL2":""},"DeliveryDate":"12/27/2014","OriginalQuoteNo":"","SapArticles":[{"CompanyCode":null,"SalesOrganisation":"I905","DistributionChannel":null,"ArticleCode":"EZAD038","ArticleDescription":"BASECOAT 5KG PROGRIP","ArticleType":"HAWA","ItemCategoryGroup":"NORM","NonStockAccntAssignment":"","ProcurementKey":"","StockIndicator":"","BaseUoM":"EA","QtyInBaseUoM":"1.00","SalesUoM":"EA","QtyInSalesUoM":1,"ConditionPricingUoM":"EA","QtyInPricingUoM":0,"AtpQty":111,"BomStatus":"","BomHeaderArticle":"","BillofMaterialNumber":"","BomComponentQty":0,"GrossWeight":5,"BaseListPriceUoMIncVat":0,"ListPriceUoMIncVat":1.0,"NettInvoicePriceIncVat":1.0,"InvoicePriceExclVat":0,"VatAmount":0,"Currency":"ZAR","OneTimeCustomer":null,"ErrorCode":null,"IssuedAtPos":false,"PosNo":null,"CustomFieldGridIndex":0,"Umren":1,"Umrez":1,"LabstUom":null,"Labst":null,"MovingAveragePrice":null,"Dlinl":0,"MerchandiseCategory":null,"MerchandiseCatGroup":null,"ArticleWeight":0,"CountedArticleQty":null,"Length":"0.000","Width":"0.000","Heigth":"0.000","UnitOfDimension":"","ArticleWithStock":false,"OboAtpQty":0,"BomArticles":[],"BaseListPriceUoMIncludingVat":0,"DisplayQty":111,"DisplayWeight":"5","ListPriceUoMIncVatString":"46.90","displaySingle":true,"displayUOM":"Each","QtyInBaseUoMString":"1.00","QtyInSalesUoMString":"1.00","NettInvoicePriceIncVatString":"46.90","AtpQtyString":"111.00","_index":0,"stockIndicator":""},{"CompanyCode":null,"SalesOrganisation":"C921","DistributionChannel":null,"ArticleCode":"EZAD038","ArticleDescription":"BASECOAT 5KG PROGRIP","ArticleType":"HAWA","ItemCategoryGroup":"NORM","NonStockAccntAssignment":"","ProcurementKey":"","StockIndicator":"","BaseUoM":"EA","QtyInBaseUoM":"1.00","SalesUoM":"EA","QtyInSalesUoM":1,"ConditionPricingUoM":"EA","QtyInPricingUoM":0,"AtpQty":111,"BomStatus":"","BomHeaderArticle":"","BillofMaterialNumber":"","BomComponentQty":0,"GrossWeight":5,"BaseListPriceUoMIncVat":0,"ListPriceUoMIncVat":1.0,"NettInvoicePriceIncVat":1.0,"InvoicePriceExclVat":0,"VatAmount":0,"Currency":"ZAR","OneTimeCustomer":null,"ErrorCode":null,"IssuedAtPos":false,"PosNo":null,"CustomFieldGridIndex":0,"Umren":1,"Umrez":1,"LabstUom":null,"Labst":null,"MovingAveragePrice":null,"Dlinl":0,"MerchandiseCategory":null,"MerchandiseCatGroup":null,"ArticleWeight":0,"CountedArticleQty":null,"Length":"0.000","Width":"0.000","Heigth":"0.000","UnitOfDimension":"","ArticleWithStock":false,"OboAtpQty":0,"BomArticles":[],"BaseListPriceUoMIncludingVat":0,"DisplayQty":111,"DisplayWeight":"5","ListPriceUoMIncVatString":"46.90","displaySingle":true,"displayUOM":"Each","QtyInBaseUoMString":"1.00","QtyInSalesUoMString":"1.00","NettInvoicePriceIncVatString":"46.90","AtpQtyString":"111.00","_index":0,"stockIndicator":""}],"UpdatedSapArticles":[],"ExistingCustomerAddress":{},"HeaderText":[]},"Token":data.Token,"modelName":"QuoteModel","Platform":"MOB","Version":"1.0.7.1"},
                    success: function(data) {
                        $('#loading').hide();
                        console.log( "Push Quote success" );
                        $('#message').html('Save to CRM succefull.');
                        console.log(data);
                        $('#project_sapCode').val(data.QuoteNumber);
                    }
                });
            }

        });


    });


    $( "label:contains('Subsection')" ).html( "Add product to quote without sections" );
    // $( "label:contains('Subsection')" ).prev().prop('checked', true);
    //$( "label:contains('Subsection')" ).prev().hide();
    $("#checkAll").click(function () {
        $('.checkClass').not(this).prop('checked', this.checked);
    });

});


