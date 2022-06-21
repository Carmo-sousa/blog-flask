FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN blog_flask create-db
RUN blog_flask populate-db
RUN blog_flask add-user -u admin -p admin
EXPOSE 5000
CMD ["blog_flask", "run"]
