use strict;
use warnings;

use Games::Ratings::Chess::DWZ;

use Test::More tests => 3;

my %expected;
my %computed;

## see the following two links for the official calculation 
## * http://schachbund.de/dwz/turniere/2007.html?code=A716-000-ONO&mcount[]=1-8
##   (Player Bartolomaeus, Christian)

my $player = Games::Ratings::Chess::DWZ->new();
$player->set_rating(2146);
$player->set_coefficient(30);
$player->add_game( {
                     opponent_rating => 2148,
                     result          => 'draw',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2222,
                     result          => 'win',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2201,
                     result          => 'draw',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2246,
                     result          => 'win',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2240,
                     result          => 'draw',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2357,
                     result          => 'loss',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2238,
                     result          => 'draw',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2334,
                     result          => 'loss',
                   }
                 );
$player->add_game( {
                     opponent_rating => 2281,
                     result          => 'draw',
                   }
                 );

## test 1: check new rating after this games
$expected{t07_new_rating_all_games} = '2172';
$computed{t07_new_rating_all_games} = $player->get_new_rating();

## test 2: check expected points
$expected{t08_expected_points_all_games} = '3.216';
$computed{t08_expected_points_all_games} = $player->get_points_expected();

## test 3: check performance
$expected{t12_performance} = '2252';
$computed{t12_performance} = $player->get_performance();

## run actual tests for all test_items in %expected
foreach my $test_item ( sort keys %expected ) {
    is( $computed{$test_item}, $expected{$test_item}, 
        "$test_item: $computed{$test_item} -> $expected{$test_item}" );
}




