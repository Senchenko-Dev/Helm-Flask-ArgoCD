FROM python:3.8-alpine AS builder

WORKDIR /app

COPY wheels/*.whl ./

RUN pip install --no-cache-dir *.whl

FROM python:3.8-alpine

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages  
COPY --from=builder /usr/local/bin /usr/local/bin 

RUN pip install --no-cache-dir Flask

COPY . .

ENV FLASK_APP=app.py

ENV PATH="/usr/local/bin:${PATH}"
 
EXPOSE 5000

CMD ["/usr/local/bin/flask", "run", "--host=0.0.0.0"]





