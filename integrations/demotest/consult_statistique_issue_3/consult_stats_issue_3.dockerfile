FROM python:3.8

WORKDIR /app
RUN python3 -m pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

COPY . .
RUN rm .env docker-compose.consult_stats_issue3.yml runtests.sh

RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]