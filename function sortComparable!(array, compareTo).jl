
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



 
