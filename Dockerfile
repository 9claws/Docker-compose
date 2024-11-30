FROM alpine
RUN apk update
RUN apk add python3 py3-pip
WORKDIR /3.2-crud
COPY 3.2-crud .
RUN pip install -r requirements.txt
# RUN python3 manage.py migrate
RUN python3 manage.py collectstatic --noinput
CMD ["gunicorn", "-b", "0.0.0.0", "stocks_products.wsgi"]
