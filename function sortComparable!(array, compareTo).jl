
# Githubworthy?
function sortComparable!(array, compareTo)

    function insertionSort_comparable!(array, compareTo)

        for i = 2 : length(array)
            j = i
            while j > 1    &&    compareTo(array[j], array[j-1]) < 0
                array[j], array[j-1]  =  array[j-1], array[j] # swap
                j -= 1
            end
        end

    end


    function quickSort_comparable!(array, lo, hi, compareTo)

        i = lo;  j = hi
        while i < hi
            pivot = array[(lo+hi)>>>1]
            while i <= j
                while compareTo(array[i], pivot) < 0;  i += 1 end
                while compareTo(array[j], pivot) > 0;  j -= 1 end
                if i <= j
                    array[i], array[j]  =  array[j], array[i] # swap
                    i += 1;  j -= 1
                end
            end
            if lo < j;  quickSort_comparable!(array, lo, j, compareTo) end
            lo = i;  j = hi
        end

    end


    if (length(array) < 16) # <-Not optimized?
        insertionSort_comparable!(array, compareTo)
    else
        quickSort_comparable!(array, 1, length(array), compareTo)
    end

end







function sortComparableAlternative!(array, compareTo)
    if (length(array) < 16)

        #insertionSort_comparable!(array, compareTo) ...........................
        len = length(array)

        for i = 2 : len
            j = i
            while (j > 1    &&    compareTo(array[j], array[j-1]) < 0)
                temp = array[j];    array[j] = array[j-1];    array[j-1] = temp
                j -= 1
            end
        end
        # ......................................................................

    else

        quickSort_comparable!(array, 1, length(array), compareTo)

        #-----------------------------------------------------------------------
        function quickSort_comparable!(array, lo, hi, compareTo)
            i, j = lo, hi
            while i < hi
                pivot = array[(lo+hi)>>>1]
                while i <= j
                    while compareTo(array[i], pivot) < 0;  i += 1 end
                    while compareTo(array[j], pivot) > 0;  j -= 1 end
                    if i <= j
                        array[i], array[j] = array[j], array[i]
                        i += 1;  j -= 1
                    end
                end
                if lo < j; quickSort_comparable!(array, lo, j, compareTo) end
                lo, j  =  i, hi
            end
        end
        # ----------------------------------------------------------------------

    end
end


# TODO: Eliminate use of numbers to represent suits?
mutable struct Playing_Card #: IComparable
# immutable!  If you want to shuffle cards, you have to actually
# shuffle the cards rather than change their values

    #rank::Int64#private int _rank;
    rank_char::Char #2, 3,...8, 9, T, J, Q, K, A #public char rank_char
    suit_char::Char


end



function rank_value(playing_card)
    if (playing_card.rank_char == '2')    return  2    end
    if (playing_card.rank_char == '3')    return  3    end
    if (playing_card.rank_char == '4')    return  4    end
    if (playing_card.rank_char == '5')    return  5    end
    if (playing_card.rank_char == '6')    return  6    end
    if (playing_card.rank_char == '7')    return  7    end
    if (playing_card.rank_char == '8')    return  8    end
    if (playing_card.rank_char == '9')    return  9    end
    if (playing_card.rank_char == 'T')    return 10    end
    if (playing_card.rank_char == 'J')    return 11    end
    if (playing_card.rank_char == 'Q')    return 12    end
    if (playing_card.rank_char == 'K')    return 13    end
    if (playing_card.rank_char == 'A')    return 14    end # can also be a 1
    return -99

end


function set(playing_card, rank_char, suit_char)
    playing_card.rank_char = rank_char
    playing_card.suit_char = suit_char
end

function printout_2chars(playing_card)
    return playing_card.rank_char * playing_card.suit_char
end

#=
myCard = Playing_Card('Q', 'H')
println(rank_value(myCard))

set(myCard, 'A', 'S')
println(rank_value(myCard))
=#

function compareTo(card_1st, card_2nd)
    if (rank_value(card_1st) < rank_value(card_2nd)) return -1 end
    if (rank_value(card_1st) > rank_value(card_2nd)) return  1 end
    return 0
end

myCards = Array{Playing_Card, 1}(undef, 5) 
myCards[1] = Playing_Card('3', 'H')
myCards[2] = Playing_Card('J', 'S')
myCards[3] = Playing_Card('2', 'S')
myCards[4] = Playing_Card('7', 'D')
myCards[5] = Playing_Card('5', 'C')

for item in myCards
    print(printout_2chars(item), " ")
end
print("\r\n")
sortComparable!(myCards, compareTo)
for item in myCards
    print(printout_2chars(item), " ")
end
