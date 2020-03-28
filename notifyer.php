<?php 
        require "connection.php";
        
        
    $title=$_POST['title'];
    $message=$_POST['message'];
        
        
        define( 'API_ACCESS_KEY', 'Your server key');
$msg = array
(
    'body'   =>$message,
    'title'     => $title,
    'key1'  => 'val1'
);
$fields = array
(
    'to'            => "token_of your receiver",
    'notification'          => $msg


);

$headers = array
(
    'Authorization: key=' . API_ACCESS_KEY,
    'Content-Type: application/json'
);

$ch = curl_init();
curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
curl_setopt( $ch,CURLOPT_POST, true );
curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
$result = curl_exec($ch );
curl_close( $ch );
echo $result;


   
?>   
