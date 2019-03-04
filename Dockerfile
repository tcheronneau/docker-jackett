FROM hub.mcth.fr/mono:bionic

ENV XDG_DATA_HOME="/config"
ENV JACKETT_RELEASE="v0.10.878"
ENV XDG_CONFIG_HOME="/config"

RUN apt-get update && \
	 apt-get install -y \
	jq && \
	echo "**** install jackett ****" && \
 	mkdir -p \
 	   /app/jackett && \
 	   | awk '/tag_name/{print $4;exit}' FS='[""]'); \
 	fi && \
 	   |jq -r '.assets[].browser_download_url' |grep Mono) && \
 	curl -o \
 	/tmp/jacket.tar.gz -L \
 	   ${jackett_url} && \
 	tar xf \
 	/tmp/jacket.tar.gz -C \
 	   /app/jackett --strip-components=1 && \
 	echo "**** clean up ****" && \
	apt-get purge -y jq && \
	apt-get clean && \
	rm -rf /tmp/* /var/lib/apt/* && \
	chown -R appuser:appuser /app && chown -R appuser:appuser /config


EXPOSE 9117
USER appuser
VOLUME ["/config"]
CMD ["/usr/bin/mono", "/app/jackett/JackettConsole.exe", "--NoUpdates"]
