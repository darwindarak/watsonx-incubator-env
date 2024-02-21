FROM python:3.11-slim

# Streamlit port
EXPOSE 8501
# Jupyterlab port
EXPOSE 8888

RUN useradd -m lab

USER lab
WORKDIR /home/lab

ADD ./requirements.txt requirements.txt
RUN python -m venv venv
ENV PATH="/home/lab/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

CMD ["jupyter","lab","--port","8888"]
