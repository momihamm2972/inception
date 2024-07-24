# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: momihamm <momihamm@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/22 17:37:06 by momihamm          #+#    #+#              #
#    Updated: 2024/07/24 11:55:06 by momihamm         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest

RUN apt update && apt install nginx -y

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]