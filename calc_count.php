<?php

if (count($argv) != 3 || !is_numeric($argv[1]) || !is_numeric($argv[2])) {
    echo "0\n";

    exit;
}

$total = max($argv[1], $argv[2]);
$count = min($argv[1], $argv[2]);

$first_limit = max($count, $total - $count);
$second_limit = min($count, $total - $count);

$accum = 1;

for ($i = $total; $i > $first_limit; $i--) {
    $accum *= $i;
}

for ($i = 2; $i <= $second_limit; $i++) {
    $accum /= $i;
}

echo $accum."\n";
