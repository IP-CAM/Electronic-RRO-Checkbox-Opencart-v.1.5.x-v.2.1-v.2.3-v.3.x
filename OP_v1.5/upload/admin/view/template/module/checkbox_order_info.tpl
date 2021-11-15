<script src='view/javascript/checkbox/jquery2/jquery-2.1.1.min.js'></script>
<script>
    var jq2_1_1 = jQuery.noConflict();
</script>

<script type="text/javascript" src="view/javascript/checkbox/bootstrap/js/bootstrap.min.js"></script>
<link href="view/stylesheet/checkbox/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/checkbox/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />

<div class="col-md-3">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title"><i class="fa fa-print"></i> Checkbox PPO</h3>
    </div>
    <div id="checkbox-rro-order-info-container">
      <div id="checkbox-rro-before-load">
        <i class="fa fa-spinner fa-spin"></i>
      </div>

    </div>

    <script>
        $(document).ready(function () {

            function loadInfo() {

                $('#checkbox-rro-before-load').addClass('preloader');

                $.get('index.php?route=module/checkbox/orderInfo&order_id=<?php echo  $order_id ?>&token=<?php echo  $token; ?>', function (html) {
                    $('#checkbox-rro-before-load').removeClass('preloader');

                    $('#checkbox-rro-order-info-container').html(html);
                });
            }

            loadInfo();

            $(document).on('click', '#checkbox-rro-order-info-button-refresh', function () {
                loadInfo();
            });

            $(document).on('click', '#checkbox-rro-order-info-button-create-receipt', function () {

                var payment_type = $('#checkbox-rro-order-info-button-create-receipt-payment-type').val();

                if ($('#checkbox-rro-order-info-button-create-receipt-send-email').prop('checked')) {
                    var send_email = 1;
                } else {
                    var send_email = 0;
                }

                $('#checkbox-rro-before-load').addClass('preloader');

                $.get('index.php?route=module/checkbox/createReceipt&order_id=<?php echo  $order_id ?>&payment_type=' + payment_type + '&send_email=' + send_email + '&token=<?php echo  $token; ?>', function (html) {

                    $('#checkbox-rro-before-load').removeClass('preloader');

                    if (html['error']) {
                        $('#checkbox-rro-order-info-container').prepend(html['error']);
                    } else {
                        $('#checkbox-rro-order-info-button-refresh').click();
                    }

                });
            });


            $(document).on('click', '#checkbox-rro-order-info-button-return-receipt', function () {

                $('#checkbox-rro-before-load').addClass('preloader');

                $.get('index.php?route=module/checkbox/createReceipt&is_return=1&order_id=<?php echo  $order_id ?>&token=<?php echo  $token; ?>', function (html) {

                    $('#checkbox-rro-before-load').removeClass('preloader');

                    if (html['error']) {
                        $('#checkbox-rro-order-info-container').prepend(html['error']);
                    } else {
                        $('#checkbox-rro-order-info-button-refresh').click();
                    }

                });
            });

        });
    </script>
    <style>
        #checkbox-rro-order-info-container {
            position: relative;
            min-height: 100px;
        }

        #checkbox-rro-before-load {
            display: none;
        }

        #checkbox-rro-before-load.preloader {
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            z-index: 1001;
            background-color: #f0f8ff9c;
        }

        #checkbox-rro-before-load.preloader i {
            font-size: 70px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -35px 0 0 -35px;
        }
    </style>
  </div>
</div>
