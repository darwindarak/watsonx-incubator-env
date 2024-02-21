FROM python:3.11-slim

# Streamlit port
EXPOSE 8501
# Jupyterlab port
EXPOSE 8888

WORKDIR /lab

RUN groupadd -r labuser \
 && useradd -r -g labuser labuser \
 && chown -R labuser:labuser /lab

USER labuser

ADD ./requirements.txt requirements.txt
RUN python -m venv venv
ENV PATH="/lab/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

CMD ["jupyter" "lab" "--port" "8888"]

