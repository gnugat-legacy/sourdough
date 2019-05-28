<?php

namespace tests\Gnugat\Sourdough\App\Command;

use Gnugat\MicroFrameworkBundle\Service\KernelApplication as Application;
use PHPUnit\Framework\TestCase;
use Symfony\Component\Console\Tester\ApplicationTester;
use tests\Gnugat\Sourdough\App\GnugatSourdoughAppSingletonKernel;

class HelpCommandTest extends TestCase
{
    private const HELP_COMMAND = 'help';

    private $app;

    protected function setUp(): void
    {
        $kernel = GnugatSourdoughAppSingletonKernel::get('test', false);
        $application = new Application($kernel);
        $application->setAutoExit(false);
        $this->app = new ApplicationTester($application);
    }

    /**
     * @test
     */
    public function it_displays_a_help_message()
    {
        $input = [
            self::HELP_COMMAND,
        ];

        $statusCode = $this->app->run($input);

        self::assertSame(0, $statusCode, $this->app->getDisplay());
    }
}
