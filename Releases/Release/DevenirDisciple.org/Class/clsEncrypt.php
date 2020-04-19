<?php

class Encryption{
  
  public function encryptData($data, $encryption_key, $iv){
    $enc_name = openssl_encrypt(
      $this->pkcs7_pad($data, 16),
      'AES-256-CBC',
      $encryption_key,
      0,
      $iv
    );
    
    return $enc_name;
  }
  
  public function pkcs7_pad($data, $size){
    $length = $size - strlen($data) % $size;
    return $data . str_repeat(chr($length), $length);
  }
  
  public function decryptData($data, $key, $iv){
    $name = $this->pkcs7_unpad(openssl_decrypt(
      $data,
      'AES-256-CBC',
      $key,
      0,
      $iv
    ));
    
    return $name;
  }
  
  public function pkcs7_unpad($data){
    return substr($data, 0, -ord($data[strlen($data) - 1]));
  }
  
  public function generateKey(){
    $key_size = 32;
    $encryption_key = openssl_random_pseudo_bytes($key_size, $strong);
    if (strlen($encryption_key) < 32){
      $encryption_key = $this->generateKey();
    }
    
    return $encryption_key;
  }
  
  public function generateIV(){
    $iv_size = 16;
    $iv = openssl_random_pseudo_bytes($iv_size, $strong);
    
    if (strlen($iv) < 16){
      $iv = $this->generateIV();
    }
    
    return $iv;
  }
}

?>
