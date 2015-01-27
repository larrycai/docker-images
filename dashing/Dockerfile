FROM ubuntu:trusty

MAINTAINER Larry Cai <larry.caiyu@gmail.com>

RUN apt-get update \
	&& apt-get install -y ruby ruby-dev gem bundler g++ make nodejs \
	&& apt-get install -y libghc-zlib-dev
	
# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN bundle config --global path "$GEM_HOME" \
	&& bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

# Install dashing
RUN gem install dashing instagram nokogiri twitter eventmachine
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && bundle 

COPY run.sh /

VOLUME ["/dashing"]

EXPOSE 3030

WORKDIR /dashing

CMD ["/run.sh"]

