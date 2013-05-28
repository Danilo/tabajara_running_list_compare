
def LoadList(filename, list)
    input = File.open(filename)
        input.read().each do |first_file_line|
        list.push(first_file_line.match(/[^SYSTEM;]\d{1,9}.{4}/))
    end
    input.close()
end

def compare(array_a, array_b, diff_list)
    0.upto(array_a.size) do |i|
        if array_a[i].to_s.length == 12
            quarter_array_a = array_a[i].to_s.match(/^.{4}/)
        else
            quarter_array_a = array_a[i].to_s.match(/^.{6}/)
        end
         
        0.upto(array_b.size) do |j|
            if array_a[i].to_s.length == 12
                quarter_array_b = array_b[j].to_s.match(/^.{4}/)
            else
                quarter_array_b = array_b[j].to_s.match(/^.{6}/)
            end
            
            if array_a[i].to_s == array_b[j].to_s
                diff_list.push(array_a[i].to_s)
            else
                if quarter_array_a.to_s == quarter_array_b.to_s
                    diff_list.push("<<" + array_a[i].to_s)
                    diff_list.push(">>" + array_b[j].to_s)
                end
            end
        end
    end
end

file_one_list = []
LoadList("RUNNING-Coasin.LST", file_one_list)
#puts file_one_list[0]
#puts "----------------------------------------------------------------------"
file_two_list = []
LoadList("RUNNING-Meu.LST", file_two_list)
#puts file_two_list[0]
#puts "----------------------------------------------------------------------"

diff_file_list = []
compare(file_one_list, file_two_list, diff_file_list)
puts diff_file_list