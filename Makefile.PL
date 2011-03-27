
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'bringing JSON functions to autobox',
  'AUTHOR' => 'Robin Edwards <robin.ge@gmail.com>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.94'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'autobox-JSON',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'autobox::JSON',
  'PREREQ_PM' => {
    'JSON' => '2.50',
    'autobox' => '2.72'
  },
  'VERSION' => '0.0003',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



