function sortComparable!(a::Array, compareTo)

    #inertionSort for comparable
    function insSort_comp!(a::Array, compareTo)

        for i = 2 : length(a)
            j = i
            while j > 1  &&  compareTo(a[j], a[j-1]) < 0
                a[j], a[j-1]  =  a[j-1], a[j] # swap
                j -= 1
            end
        end

    end

    #quickSort for comparable
    function qSort_comp!(a::Array, lo::Int64, hi::Int64, compareTo)

        i = lo;  j = hi
        while i < hi
            pivot = a[(lo+hi) ÷ 2]
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


    if length(a) ≤ 60
        insSort_comp!(a, compareTo)
    else
        qSort_comp!(a, 1, length(a), compareTo)
    end

end
