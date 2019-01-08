%% Based on canonical data version 1.1.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/poker/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(poker_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").




'1_single_hand_always_wins_test'() ->
    ?assertMatch(["4S 5S 7H 8D JC"],
		 lists:sort(poker:best_hands(["4S 5S 7H 8D JC"]))).

'2_highest_card_out_of_all_hands_wins_test'() ->
    ?assertMatch(["3S 4S 5D 6H JH"],
		 lists:sort(poker:best_hands(["4D 5S 6S 8D 3C",
					      "2S 4C 7S 9H 10H",
					      "3S 4S 5D 6H JH"]))).

'3_a_tie_has_multiple_winners_test'() ->
    ?assertMatch(["3H 4H 5C 6C JD", "3S 4S 5D 6H JH"],
		 lists:sort(poker:best_hands(["4D 5S 6S 8D 3C",
					      "2S 4C 7S 9H 10H",
					      "3S 4S 5D 6H JH",
					      "3H 4H 5C 6C JD"]))).

'4_multiple_hands_with_the_same_high_cards_tie_compares_next_highest_ranked_down_to_last_card_test'() ->
    ?assertMatch(["3S 5H 6S 8D 7H"],
		 lists:sort(poker:best_hands(["3S 5H 6S 8D 7H",
					      "2S 5D 6D 8C 7S"]))).

'5_one_pair_beats_high_card_test'() ->
    ?assertMatch(["2S 4H 6S 4D JH"],
		 lists:sort(poker:best_hands(["4S 5H 6C 8D KH",
					      "2S 4H 6S 4D JH"]))).

'6_highest_pair_wins_test'() ->
    ?assertMatch(["2S 4H 6C 4D JD"],
		 lists:sort(poker:best_hands(["4S 2H 6S 2D JH",
					      "2S 4H 6C 4D JD"]))).

'7_two_pairs_beats_one_pair_test'() ->
    ?assertMatch(["4S 5H 4C 8C 5C"],
		 lists:sort(poker:best_hands(["2S 8H 6S 8D JH",
					      "4S 5H 4C 8C 5C"]))).

'8_both_hands_have_two_pairs_highest_ranked_pair_wins_test'() ->
    ?assertMatch(["2S 8H 2D 8D 3H"],
		 lists:sort(poker:best_hands(["2S 8H 2D 8D 3H",
					      "4S 5H 4C 8S 5D"]))).

'9_both_hands_have_two_pairs_with_the_same_highest_ranked_pair_tie_goes_to_low_pair_test'() ->
    ?assertMatch(["JD QH JS 8D QC"],
		 lists:sort(poker:best_hands(["2S QS 2C QD JH",
					      "JD QH JS 8D QC"]))).

'10_both_hands_have_two_identically_ranked_pairs_tie_goes_to_remaining_card_kicker_test'() ->
    ?assertMatch(["JD QH JS 8D QC"],
		 lists:sort(poker:best_hands(["JD QH JS 8D QC",
					      "JS QS JC 2D QD"]))).

'11_three_of_a_kind_beats_two_pair_test'() ->
    ?assertMatch(["4S 5H 4C 8S 4H"],
		 lists:sort(poker:best_hands(["2S 8H 2H 8D JH",
					      "4S 5H 4C 8S 4H"]))).

'12_both_hands_have_three_of_a_kind_tie_goes_to_highest_ranked_triplet_test'() ->
    ?assertMatch(["4S AH AS 8C AD"],
		 lists:sort(poker:best_hands(["2S 2H 2C 8D JH",
					      "4S AH AS 8C AD"]))).

'13_with_multiple_decks_two_players_can_have_same_three_of_a_kind_ties_go_to_highest_remaining_cards_test'() ->
    ?assertMatch(["4S AH AS 8C AD"],
		 lists:sort(poker:best_hands(["4S AH AS 7C AD",
					      "4S AH AS 8C AD"]))).

'14_a_straight_beats_three_of_a_kind_test'() ->
    ?assertMatch(["3S 4D 2S 6D 5C"],
		 lists:sort(poker:best_hands(["4S 5H 4C 8D 4H",
					      "3S 4D 2S 6D 5C"]))).

'15_aces_can_end_a_straight_10_j_q_k_a_test'() ->
    ?assertMatch(["10D JH QS KD AC"],
		 lists:sort(poker:best_hands(["4S 5H 4C 8D 4H",
					      "10D JH QS KD AC"]))).

'16_aces_can_start_a_straight_a_2_3_4_5_test'() ->
    ?assertMatch(["4D AH 3S 2D 5C"],
		 lists:sort(poker:best_hands(["4S 5H 4C 8D 4H",
					      "4D AH 3S 2D 5C"]))).

'17_both_hands_with_a_straight_tie_goes_to_highest_ranked_card_test'() ->
    ?assertMatch(["5S 7H 8S 9D 6H"],
		 lists:sort(poker:best_hands(["4S 6C 7S 8D 5H",
					      "5S 7H 8S 9D 6H"]))).

'18_even_though_an_ace_is_usually_high_a_5_high_straight_is_the_lowest_scoring_straight_test'() ->
    ?assertMatch(["2H 3C 4D 5D 6H"],
		 lists:sort(poker:best_hands(["2H 3C 4D 5D 6H",
					      "4S AH 3S 2D 5H"]))).

'19_flush_beats_a_straight_test'() ->
    ?assertMatch(["2S 4S 5S 6S 7S"],
		 lists:sort(poker:best_hands(["4C 6H 7D 8D 5H",
					      "2S 4S 5S 6S 7S"]))).

'20_both_hands_have_a_flush_tie_goes_to_high_card_down_to_the_last_one_if_necessary_test'() ->
    ?assertMatch(["4H 7H 8H 9H 6H"],
		 lists:sort(poker:best_hands(["4H 7H 8H 9H 6H",
					      "2S 4S 5S 6S 7S"]))).

'21_full_house_beats_a_flush_test'() ->
    ?assertMatch(["4S 5H 4C 5D 4H"],
		 lists:sort(poker:best_hands(["3H 6H 7H 8H 5H",
					      "4S 5H 4C 5D 4H"]))).

'22_both_hands_have_a_full_house_tie_goes_to_highest_ranked_triplet_test'() ->
    ?assertMatch(["5H 5S 5D 8S 8D"],
		 lists:sort(poker:best_hands(["4H 4S 4D 9S 9D",
					      "5H 5S 5D 8S 8D"]))).

'23_with_multiple_decks_both_hands_have_a_full_house_with_the_same_triplet_tie_goes_to_the_pair_test'() ->
    ?assertMatch(["5H 5S 5D 9S 9D"],
		 lists:sort(poker:best_hands(["5H 5S 5D 9S 9D",
					      "5H 5S 5D 8S 8D"]))).

'24_four_of_a_kind_beats_a_full_house_test'() ->
    ?assertMatch(["3S 3H 2S 3D 3C"],
		 lists:sort(poker:best_hands(["4S 5H 4D 5D 4H",
					      "3S 3H 2S 3D 3C"]))).

'25_both_hands_have_four_of_a_kind_tie_goes_to_high_quad_test'() ->
    ?assertMatch(["4S 5H 5S 5D 5C"],
		 lists:sort(poker:best_hands(["2S 2H 2C 8D 2D",
					      "4S 5H 5S 5D 5C"]))).

'26_with_multiple_decks_both_hands_with_identical_four_of_a_kind_tie_determined_by_kicker_test'() ->
    ?assertMatch(["3S 3H 4S 3D 3C"],
		 lists:sort(poker:best_hands(["3S 3H 2S 3D 3C",
					      "3S 3H 4S 3D 3C"]))).

'27_straight_flush_beats_four_of_a_kind_test'() ->
    ?assertMatch(["7S 8S 9S 6S 10S"],
		 lists:sort(poker:best_hands(["4S 5H 5S 5D 5C",
					      "7S 8S 9S 6S 10S"]))).

'28_both_hands_have_straight_flush_tie_goes_to_highest_ranked_card_test'() ->
    ?assertMatch(["5S 7S 8S 9S 6S"],
		 lists:sort(poker:best_hands(["4H 6H 7H 8H 5H",
					      "5S 7S 8S 9S 6S"]))).
