<?php

namespace Gnugat\Sourdough\App;

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class GnugatSourdoughAppKernel extends Kernel
{
    public function registerBundles(): \Generator
    {
        $contents = require __DIR__.'/../../config/bundles.php';
        foreach ($contents as $class => $envs) {
            if (isset($envs['all']) || isset($envs[$this->environment])) {
                yield new $class();
            }
        }
    }

    public function getProjectDir(): string
    {
        return __DIR__;
    }

    public function getCacheDir(): string
    {
        return __DIR__.'/../../var/cache/'.$this->environment;
    }

    public function getLogDir(): string
    {
        return __DIR__.'/../../var/log';
    }

    public function registerContainerConfiguration(LoaderInterface $loader): void
    {
        $configFilename = __DIR__.'/../../config/config.yaml';
        if ('test' === $this->environment) {
            $configFilename = __DIR__.'/../../config/config_test.yaml';
        }
        $loader->load($configFilename);
    }
}
