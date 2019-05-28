# How to contribute

Everybody should be able to help. Here's how you can make this project more
awesome:

1. [Fork it](https://github.com/gnugat/sourdough/fork_select)
2. improve it
3. submit a [pull request](https://help.github.com/articles/creating-a-pull-request)

Your work will then be reviewed as soon as possible (suggestions about some
changes, improvements or alternatives may be given).

Here's some tips to make you the best contributor ever:

* [Green tests](#green-tests)
* [Coding Style](#coding-style)
* [Specifications](#specifications)
* [Use cases](#use-cases)
* [Keeping your fork up-to-date](#keeping-your-fork-up-to-date)

## Green tests

Run the tests using the following script:

    bin/test.sh

## Coding Style

Run the CS checker using the following script: 

    bin/cs.sh

Run the CS fixer using the following script:

    bin/cs.sh -f

## Specifications

Sourdough drives its development using [phpspec](http://www.phpspec.net/):

    # Generate the specification class:
    vendor/bin/phpspec describe 'Gnugat\Sourdough\MyNewClass'

    # Customize the specification class:
    $EDITOR tests/spec/Gnugat/Sourdough/MyNewClass.php

    # Generate the specified class:
    vendor/bin/phpspec run

    # Customize the class:
    $EDITOR src/Gnugat/Sourdough/MyNewClass.php

    vendor/bin/phpspec run # Should be green!

## Use cases

Sourdough has been created to fulfill actual needs. To keep sure of it, use
cases are created and are automated: they become part of the test suite.

Have a look at `tests`, you might add your own.

## Keeping your fork up-to-date

To keep your fork up-to-date, you should track the upstream (original) one
using the following command:

    git remote add upstream https://github.com/gnugat/sourdough.git

Then get the upstream changes:

    git checkout master
    git pull --rebase origin master
    git pull --rebase upstream master
    git checkout <your-branch>
    git rebase master

Finally, publish your changes:

    git push -f origin <your-branch>

Your pull request will be automatically updated.
