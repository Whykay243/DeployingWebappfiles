FROM amazonlinux:2023.7.20250428.1

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://github.com/Whykay243/Webappfiles/archive/refs/heads/main.zip


# unzip folder
RUN unzip main.zip

# copy files into html directory
RUN cp -r Webappfiles-main/* /var/www/html/

# remove unwanted folder
RUN rm -rf Webappfiles-main main.zip

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
