#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

array = []
order = ""

loop do
    print("Input any number (Key \"E\" will quit input) : ")
    input_num = gets.chomp.downcase
    if input_num == "e"
        break
    elsif input_num =~ /^[0-9]+$/
        array << input_num.to_i
    else
        print("Not a number.\n")                
    end
end

loop do
    print("ASC or DESC ? : ")
    order = gets.chomp.downcase
    break if order == "asc" || order == "desc"
end

print(array.to_s + "\n")

def quick_asc(array)
    return array if array.length <= 1
    left = []
    right = []
    pivot = array[0]
    #print("pivot : " + pivot.to_s + "\n")
    for i in 1..array.length-1
        if array[i] <= pivot
            left << array[i]
        else
            right << array[i]
        end
    end
    #print(left.to_s)
    #print(right.to_s + "\n")
    left = quick_asc(left)
    right = quick_asc(right)

    return left + [pivot] + right
end

def quick_desc(array)
    return array if array.length <= 1
    left = []
    right = []
    pivot = array[0]
    #print("pivot : " + pivot.to_s + "\n")
    for i in 1..array.length-1
        if array[i] >= pivot
            left << array[i]
        else
            right << array[i]
        end
    end
    #print(left.to_s)
    #print(right.to_s + "\n")
    left = quick_desc(left)
    right = quick_desc(right)

    return left + [pivot] + right
end

if order == "asc"
    print(quick_asc(array))
else
    print(quick_desc(array))
end