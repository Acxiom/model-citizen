#!/usr/bin/perl -w
use strict;
use warnings FATAL => 'all';
use File::Spec;
use Test::More;
use English qw(-no_match_vars);

if (not $ENV{TEST_AUTHOR}) {
  my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
  plan(skip_all => $msg);
}

eval { require Test::Perl::Critic; };

if ($EVAL_ERROR) {
  my $msg = 'Test::Perl::Critic required to criticize code';
  plan(skip_all => $msg);
}

# Make sure we adhere to the supplied linting rules
my $rcfile = File::Spec->catfile('t', '../.perlcriticrc');
Test::Perl::Critic->import(-profile => $rcfile);
all_critic_ok();
