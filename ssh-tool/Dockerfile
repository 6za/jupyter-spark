FROM paulczar/omgwtfssl
RUN apk --update add openssh-client
CMD ssh-keygen  -t rsa -N '' -f /root/id_rsa && chmod 755 /root/id_rsa*
