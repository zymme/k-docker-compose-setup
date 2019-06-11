FROM rabbitmq:3-management

LABEL maintainer="david.zimmer@bitsinglass.com"



COPY init.sh /init.sh
RUN chmod 775 /init.sh

# Define default command
CMD ["/init.sh"]
