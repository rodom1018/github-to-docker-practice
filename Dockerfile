FROM python:3.9.13
# python 3.9.13 으로 실행 하겠다.

MAINTAINER hyeon <ske04186@gmail.com>
# Docker의 컨테이너를 생성 및 관리 하는 사람의 정보

#RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh
#RUN apt-get install git-lfs
RUN pip3 install django
# 도커 컨테이너에서 pip3 install django 명령어를 실행.

COPY ./ /usr/src/app
# <src> 의 파일 혹은 디렉토리를 <dest> 경로에 복사하는 명령어임 .

WORKDIR /usr/src/app
# 이후 작성될 명령어를 컨테이너 내의 어떤 디렉토리에서 수행할 것인지를 명시하는 명령어 입니다.
# 해당 디렉토리가 없다면 생성합니다. 
# /usr/src/app 디렉토리를 (생성하여) 이동.  

#RUN sudo apt update
#RUN apt install python3-pip
#RUN sudo apt-get install libpq-dev python-dev
#RUN sudo apt install python3-testresources
#RUN virtualenv myenv
#RUN source myenv/bin/activate
#RUN python -m pip install --upgrade pip
RUN pip install virtualenv
RUN virtualenv myenv

RUN source ./myenv/bin/activate
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install git+https://git@github.com/SKTBrain/KoBERT.git@master
RUN apt-get update
RUN apt-get -y install git-lfs
RUN git lfs pull
RUN pip install konlpy
RUN pip install sentence-transformers
RUN pip install transformers
WORKDIR ./backend
# manage.py를 실행할 수 있는 디렉토리로 이동
#cd 1st_2

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
# = python3 manage.py runserver 0.0.0.0:8000

EXPOSE 8000
# django 서버의 포트를 8000로 지정하였으므로 Docker의 컨테이너 또한 8000 포트를 열어줍니다.
