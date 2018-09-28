require 'date'
CURRENT_DATE = Date.today
def write_to_file(current_date)
	0.upto(2) do
		current_time = Time.now.strftime("%H:%M")
		File.open("#{current_date}.txt", "a") do |file|
			file.write("I love Ruby at #{current_time}\n")
			sleep(5)
		end
	end
	write_to_file(current_date+1)
end

write_to_file(CURRENT_DATE)