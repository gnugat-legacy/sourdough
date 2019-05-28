<?php

namespace tests\Gnugat\Sourdough\App;

use Gnugat\Sourdough\App\GnugatSourdoughAppKernel;

class GnugatSourdoughAppSingletonKernel
{
    private static $kernel;

    public static function get(string $env = 'test', bool $debug = false): GnugatSourdoughAppKernel
    {
        if (null !== self::$kernel) {
            return self::$kernel;
        }
        self::$kernel = new GnugatSourdoughAppKernel($env, $debug);
        self::$kernel->boot();

        return self::$kernel;
    }
}
