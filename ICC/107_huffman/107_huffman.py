print("hello world")




    
def BubbleSort(sort_arrayay):
    n = len(sort_array)

    for i in range(n):
        swapped = False
        for j in range(0, n - i - 1):
            if sort_array[j] > sort_array[j + 1]:
                sort_array[j], sort_array[j + 1] = sort_array[j + 1], sort_array[j]
                swapped = True
        if not swapped:
            break