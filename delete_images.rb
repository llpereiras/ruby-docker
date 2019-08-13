# frozen_string_literal: true

images = `sudo docker container ps -a | grep -v 'Up' | grep -v 'ID' | awk '{print $2}'`

images = images.split("\n").uniq

images.each do |image|
  begin
    `sudo docker image rm -f #{image}`
  end
end

containers = `sudo docker container ps -a | grep -v 'Up' | grep -v 'ID' | awk '{print $1}'`

containers = containers.split("\n").uniq

containers.each do |container|
  begin
    `sudo docker rm -f #{container}`
  end
end
