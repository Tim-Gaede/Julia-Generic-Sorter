function sortComparable!(a, compareTo)

    #inertionSort for comparable
    function insSort_comp!(a, compareTo)

        for i = 2 : length(a)
            j = i
            while j > 1  &&  compareTo(a[j], a[j-1]) < 0
                a[j], a[j-1]  =  a[j-1], a[j] # swap
                j -= 1
            end
        end

    end

    #quickSort for comparable
    function qSort_comp!(a, lo, hi, compareTo)

        i = lo;  j = hi
        while i < hi
            pivot = a[(lo+hi)>>>1]
            while i <= j
                while compareTo(a[i], pivot) < 0;    i += 1;    end
                while compareTo(a[j], pivot) > 0;    j -= 1;    end
                if i <= j
                    a[i], a[j]  =  a[j], a[i] # swap
                    i += 1;  j -= 1
                end
            end
            if lo < j;     qSort_comp!(a, lo, j, compareTo);    end
            lo = i;  j = hi
        end

    end


    if length(a) < 16 # <-Not optimized?
        insSort_comp!(a, compareTo)
    else
        qSort_comp!(a, 1, length(a), compareTo)
    end

end
