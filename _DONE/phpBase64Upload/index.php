<?php

if(!empty($_POST[base64PngImage]))
{
  base64_to_png('data:image/png;base64,'.trim($_POST[base64PngImage]), 'upload.png');
}

function base64_to_png($base64_string, $output_file) {
    $ifp = fopen($output_file, "wb");
    $data = explode(',', $base64_string);
    fwrite($ifp, base64_decode($data[1]));
    fclose($ifp);
    return $output_file;
}
